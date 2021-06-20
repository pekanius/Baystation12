/datum/reagent/concentrate/gel
	reagent_state = LIQUID
	metabolism = REM * 5
	var/mood_bonus = 10

// /datum/reagent/concentrate/gel/affect_ingest(var/mob/living/carbon/human/M, var/alien, var/removed)
// 	for(var/datum/wish/concentrate/W in M.wishes)
// 		if(W.name == "concentrate_wish")
// 			M.add_event("concentrate", /datum/happiness_event/concentrate)
// 			if(W.concentrate_desired == type)
// 				M.add_event("desired_condentrate", /datum/happiness_event/concentrate_desired)
/datum/reagent/concentrate/gel/red
	name = "Red Gel Concentrate"
	description = "Red liquid."
	taste_description = "red gel concentrate"
	color = "#FF0000"
	mood_bonus = 20


// /datum/reagent/concentrate/gel/red/affect_ingest(var/mob/living/carbon/human/M, var/alien, var/removed)
// 	..(M, alien, removed)
// 	M.add_event("red_condentrate", /datum/happiness_event/concentrate_red)

/datum/reagent/concentrate/gel/blue
	name = "Blue Gel Concentrate"
	description = "Blue liquid."
	taste_description = "blue gel concentrate"
	color = "#0000FF"
	mood_bonus = 10

/datum/reagent/concentrate/gel/green
	name = "Green Gel Concentrate"
	description = "Green liquid."
	taste_description = "green gel concentrate"
	color = "#00FF00"
	mood_bonus = 10

/datum/reagent/concentrate/gel/yellow
	name = "Yellow Gel Concentrate"
	description = "Yellow liquid."
	taste_description = "yellow gel concentrate"
	color = "#FFFF00"
	mood_bonus = 10


/datum/reagent/blackliquid
	name = "Black Liquid"
	description = "Black liquid."
	taste_description = "bitter"
	reagent_state = LIQUID
	metabolism = REM * 5
	color = "#030303"

// /datum/reagent/blackliquid/distillate(var/amount)
// 	holder.remove_reagent(type, amount, safety = 1)
// 	holder.add_reagent(/datum/reagent/ethanol/samognoy/samognoy_gas, amount, safety = 1)

/datum/reagent/blackliquid/touch_obj(var/obj/O)
	O.samosbor = volume

/datum/reagent/biomass
	name = "Biomass"
	description = "Looks like... slimy meat..."
	taste_description = ""
	reagent_state = LIQUID
	color = "#E58EB2"
	metabolism = REM * 5

/datum/reagent/ethanol/samognoy/samognoy_gas
	name = "Samognoy Gas"
	description = "White steam"
	taste_description = "samognoy"
	reagent_state = GAS
	color = "#FFFFFF"

// /datum/reagent/ethanol/samognoy/samognoy_gas/condensate(var/amount)
// 	holder.remove_reagent(type, amount, safety = 1)
// 	holder.add_reagent("samognoy", amount, safety = 1)

/datum/reagent/ethanol/samognoy
	name = "Samognoy"
	description = "��� ����� ��� �������."
	taste_description = "ethanol and raw meat"
	reagent_state = LIQUID
	color = "#404030"
	touch_met = 5
	druggy = 10
	halluci = 30
	strength = 5

	glass_name = "��������"
	glass_desc = "�������&#255; �����&#255; ��������."

// /datum/chemical_reaction/boil_blackliquid
// 	name = "Boil blackliquid"
// 	result = "samognoygas"
// 	required_reagents = list(/datum/reagent/blackliquid = 1, /datum/reagent/biomass = 3)
// 	minimum_temperature = T0C + 93
// 	result_amount = 4
// 	mix_message = ""
// 	reaction_sound = null

// /datum/chemical_reaction/boil_blackliquid/on_reaction(var/datum/reagents/holder, var/created_volume)
// 	if(istype(holder.my_atom, /obj/item/weapon/reagent_containers/canister))
// 		var/obj/item/weapon/reagent_containers/canister/C = holder.my_atom
// 		if(C.beaker)
// 			var/obj/item/weapon/reagent_containers/glass/beaker/banka/beaker = C.beaker
// 			var/t = T0C + 40
// 			holder.trans_type_to(beaker, type, created_volume, force_temperature = t)
// 			beaker.reagents.process_reactions()

// /datum/chemical_reaction/condensate_samognoy_gas
// 	name = "Condensate samognoy gas"
// 	result = "samognoy"
// 	required_reagents = list(/datum/reagent/ethanol/samognoy/samognoy_gas = 1)
// 	maximum_temperature = T0C + 90
// 	result_amount = 1
// 	mix_message = ""
// 	//reaction_sound = null




/datum/reagent/concentrate/solid
	reagent_state = LIQUID
	metabolism = REM * 5
	var/mood_bonus = 10

// /datum/reagent/concentrate/solid/affect_ingest(var/mob/living/carbon/human/M, var/alien, var/removed)
// 	for(var/datum/wish/concentrate/W in M.wishes)
// 		if(W.name == "concentrate_wish")
// 			M.add_event("concentrate", /datum/happiness_event/concentrate)
// 			if(W.concentrate_desired == type)
// 				M.add_event("desired_condentrate", /datum/happiness_event/concentrate_desired)


/datum/reagent/concentrate/solid/white
	name = "White Solid Concentrate"
	description = "White liquid."
	taste_description = "white solid concentrate"
	color = "#ffffff"
	mood_bonus = 10

/datum/reagent/concentrate/solid/black
	name = "Black Solid Concentrate"
	description = "Black liquid."
	taste_description = "black solid concentrate"
	color = "#000000"
	mood_bonus = 15

/datum/reagent/concentrate/solid/red
	name = "Red Solid Concentrate"
	description = "Red liquid."
	taste_description = "red solid concentrate"
	color = "#FF0000"
	mood_bonus = 20

// /datum/reagent/concentrate/solid/red/affect_ingest(var/mob/living/carbon/human/M, var/alien, var/removed)
// 	..(M, alien, removed)
// 	M.add_event("red_condentrate", /datum/happiness_event/concentrate_red)


/datum/reagent/concentrate/solid/green
	name = "Green Solid Concentrate"
	description = "Green liquid."
	taste_description = "green solid concentrate"
	color = "#00FF00"
	mood_bonus = 30

/datum/reagent/concentrate/solid/violet
	name = "Violet Solid Concentrate"
	description = "Violet liquid."
	taste_description = "violet solid concentrate"
	color = "#44338f"
	mood_bonus = 30

/datum/reagent/concentrate/solid/blue
	name = "Blue Solid Concentrate"
	description = "Blue liquid."
	taste_description = "blue solid concentrate"
	color = "#33568f"
	mood_bonus = 30
