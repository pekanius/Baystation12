/datum/wish/concentrate
	name = "concentrate_wish"
	description = ""
	// success_event = /datum/happiness_event/concentrate_desired
	var/list/concentrate_types = list(
		/datum/reagent/concentrate/solid/red,
		/datum/reagent/concentrate/solid/blue,
		/datum/reagent/concentrate/solid/green,
	)

	var/list/color_translation = list(
		/datum/reagent/concentrate/solid/red = "�������",
		/datum/reagent/concentrate/solid/blue = "�������",
		/datum/reagent/concentrate/solid/green = "������",
	)
	var/concentrate_desired = null
	success_message = "<span class='info'>� ���� �������� ����������.</span>\n"


/datum/wish/concentrate/New(var/mob/living/carbon/human/holder)
	..(holder)

	var/picked = pick(concentrate_types)

	src.concentrate_desired = picked

	var/rus_name = color_translation[picked]


	description = "<span class='info'>����� ���� [rus_name] ����������.</span>"
