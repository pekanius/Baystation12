/mob/living/simple_animal/hostile/samosbor
	var/list/loot = list()
	minbodytemp = 223		//Below -50 Degrees Celcius
	maxbodytemp = 323	//Above 50 Degrees Celcius


/mob/living/simple_animal/hostile/samosbor/death(gibbed, deathmessage, show_dead_message)
	..(gibbed, deathmessage, show_dead_message)

	for(var/loot_item in loot)
		new loot_item(src.loc)

	qdel(src)
	return

/datum/ai_holder/simple_animal/melee/samosbor/heavy

/datum/ai_holder/simple_animal/melee/samosbor/heavy/find_target()
	. = ..()
	if(.)
		playsound(src, 'sound/samosbor/scream1.ogg', 100, 1)

/datum/ai_holder/simple_animal/melee/heavy/engage_target()
	. =..()
	var/mob/living/L = .
	if(istype(L))
		if(prob(12))
			L.Weaken(3)
			L.visible_message("<span class='danger'>[src] ����������� [L] � ���</span>")
/mob/living/simple_animal/hostile/samosbor/heavy
	name = "ugliness"
	desc = ""
	icon = 'icons/samosbor/creatures.dmi'
	icon_state = "heavy"
	icon_living = "heavy"
	health = 35
	maxHealth = 35
	harm_intent_damage = 5
	natural_weapon = /obj/item/natural_weapon/claws/strong
	faction = "samosbor"
	can_pry = TRUE
	break_stuff_probability = 5
	flash_vulnerability = 0
	bleed_colour = COLOR_GREEN
	status_flags = CANPUSH
	attack_sound = 'sound/hallucinations/growl1.ogg'
	attacktext = "rips"

	ai_holder_type = /datum/ai_holder/simple_animal/melee/samosbor/heavy

/mob/living/simple_animal/hostile/samosbor/heavy/Life()
	if(prob(5))
		playsound(src, 'sound/samosbor/scream1.ogg', 100, 1)

/mob/living/simple_animal/hostile/samosbor/heavy/Allow_Spacemove(var/check_drift = 0)
	return 1

/mob/living/simple_animal/hostile/samosbor/kosti
	name = "kosti"
	desc = ""
	icon = 'icons/samosbor/creatures.dmi'
	icon_state = "kosti"
	icon_living = "kosti"
	health = 10
	maxHealth = 10
	harm_intent_damage = 5
	natural_weapon = /obj/item/natural_weapon/bite/weak
	faction = "samosbor"
	can_pry = FALSE
	flash_vulnerability = 0
	bleed_colour = COLOR_BLACK
	pass_flags = PASS_FLAG_TABLE
	attack_sound = 'sound/hallucinations/growl1.ogg'
	attacktext = "bites"

	ai_holder_type = /datum/ai_holder/simple_animal/melee/evasive

/mob/living/simple_animal/melee/samosbor/kosti/Life()
	..()

	if(prob(15))
		for(var/atom/A in view(5))
			A.samosbor += 5
			A.samosbor_act()
