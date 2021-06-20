var/global/datum/controller/subsystem/samosbor/Samosbor = null

/datum/controller/subsystem/samosbor
	var/list/datum/turf_collection/processingTurfs = list()
	var/list/datum/turf_collection/samosborTurfs = list()
	var/min_couldown          = 1600   //����������� �������
	var/max_couldown          = 16000  //������������ �������
	var/presamosbor_duration  = 1200   //����� ����� �������� �� �������
	var/next_samosbor         = 0      //����� �������� ����� ��������
	var/samosbor_duration_min = 600    //����������� ����������������� ���������
	var/samosbor_duration_max = 1800   //������������ ����������������� ���������
	var/samosbor_stop       = 0        //����� �������� ����������
	var/samosbor_running    = 0        //��� ��������
	var/samosbor_level      = 5
	var/samosbor_damage     = 100
	var/samosbor_start_time = 0
	var/end_presamosbor     = 0
	var/list/z_levels       = list(5, 6, 7, 8, 9, 10, 11, 12, 13, 14)  //������ z-������� �� ������� ���������� ��������
	var/global_samosbor     = 1
	var/triggered_siren     = 0


/proc/StartSamosbor()
	Samosbor.StartSamosbor()

/datum/controller/subsystem/samosbor/Initialize()
	name = "samosbor"
	Samosbor = src
	wait = 10
	next_samosbor = rand(min_couldown, max_couldown) + world.time

/atom/proc/samosbor_act(amount)
	return

/obj/item/weapon/reagent_containers/samosbor_act(amount)
	..()
	for(var/datum/reagent/R in reagents)
		R.samosbor_act(amount)

/datum/reagents/proc/samosbor_act(amount)
	return

/datum/reagent/proc/samosbor_act(amount)
	return

/turf
	var/samosborAffected = 0

/atom
	var/samosbor = 0	//������� ������������ ����������

/datum/turf_collection
	var/list/turf/Turfs = list()

/datum/turf_collection/proc/GetLength()
	return Turfs.len

/datum/turf_collection/proc/Remove(var/turf/T)
	Turfs.Remove(T)

/obj/effect/decal/cleanable/blood/black_liquid
	basecolor = SYNTH_BLOOD_COLOUR

/obj/effect/decal/cleanable/blood/black_liquid/attack_by


//���������, ������� ��������� ������ ���������� ������������
/obj/effect/samosbor_start
	invisibility = 101

/datum/controller/subsystem/samosbor/fire(resumed = FALSE, no_mc_tick = FALSE)
	if(!samosbor_running)
		if(world.time >= next_samosbor)
			StartSamosbor()
		return

	if(global_samosbor)
		for(var/level in z_levels)
			FindAffected(level)
	else
		FindAffected(samosbor_level)


	if(world.time >= samosbor_stop)
		StopSamosbor()
		triggered_siren = 0
		return

	if(!triggered_siren || world.time >= (samosbor_start_time + presamosbor_duration))
		triggered_siren = 1
		for(var/key in samosborTurfs)
			var/datum/turf_collection/tc = samosborTurfs[key]
			for(var/turf/T in  tc.Turfs)
				AffectTurf(T, world.time < (samosbor_start_time + presamosbor_duration))
				if (no_mc_tick)
					CHECK_TICK
				else if (MC_TICK_CHECK)
					break



/datum/controller/subsystem/samosbor/proc/StartSamosbor()
	samosbor_running = 1
	samosbor_start_time = world.time
	end_presamosbor = world.time + presamosbor_duration
	samosbor_stop = rand(samosbor_duration_min, samosbor_duration_max) + world.time + presamosbor_duration
	samosbor_level = pick(z_levels)

/datum/controller/subsystem/samosbor/proc/StopSamosbor()
	samosbor_running = 0
	next_samosbor = rand(min_couldown, max_couldown) + world.time
	samosborTurfs = list()
	processingTurfs = list()

/datum/controller/subsystem/samosbor/proc/AffectTurf(var/turf/T, first=0)
	for(var/atom/A in T.contents)
		if(!first)
			A.samosbor += wait * 0.1 * samosbor_damage
		A.samosbor_act()

/datum/controller/subsystem/samosbor/proc/FindAffected(var/z)
	if(!z)
		return

	for(var/key in samosborTurfs)
		var/datum/turf_collection/tc = samosborTurfs[key]
		for(var/turf/T in tc.Turfs)
			T.samosborAffected = 0
			//if (no_mc_tick)
			CHECK_TICK
			//else if (MC_TICK_CHECK)
				//break

	var/obj/effect/samosbor_start/found

	for(var/obj/effect/samosbor_start/S)
		if(S.z == z)
			found = S
			break

	var/turf/located = locate(found.x, found.y, found.z)
	located.samosborAffected = 1

	var/datum/turf_collection/tc1 = new()
	var/datum/turf_collection/tc2 = new()

	tc1.Turfs += located
	tc2.Turfs += located

	processingTurfs["[z]"] = tc1
	samosborTurfs["[z]"] = tc2



	while(tc1.GetLength())
		for(var/turf/T in tc1.Turfs)
			var/list/turf/empty = FindNeighbours(T)
			tc1.Remove(T)

			for(var/turf/TE in empty)
				TE.samosborAffected = 1
				tc1.Turfs += TE
				tc2.Turfs += TE

			//if (no_mc_tick)
			CHECK_TICK
			//else if (MC_TICK_CHECK)
				//break


/datum/controller/subsystem/samosbor/proc/FindNeighbours(var/turf/T)
	var/list/turf/neighbours = list()
	neighbours += locate(T.x - 1, T.y, T.z)
	neighbours += locate(T.x - 1, T.y - 1, T.z)
	neighbours += locate(T.x - 1, T.y + 1, T.z)
	neighbours += locate(T.x + 1, T.y, T.z)
	neighbours += locate(T.x + 1, T.y - 1, T.z)
	neighbours += locate(T.x + 1, T.y + 1, T.z)
	neighbours += locate(T.x, T.y - 1, T.z)
	neighbours += locate(T.x, T.y + 1, T.z)


	var/turf/result = list()
	neighbours:
		for(var/turf/T2 in neighbours)
			for(var/obj/machinery/door/airlock/germa/D in T2.contents)
				if(D.density)
					continue neighbours

			if(T2.samosborAffected == 0 && !T2.density)
				result += T2

	return result
