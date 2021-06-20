/datum/wish/round_wish
	name = "round_wish"
	description = ""
	// success_event = /datum/happiness_event/round_wish
	success_message = "<span class='info'>� �������� ��� ������ �������.</span>\n"


/datum/wish/round_wish/erp
	name = "erp_wish"


/datum/wish/round_wish/erp/targeted
	var/mob/living/carbon/human/target = null


/datum/wish/round_wish/erp/targeted/New(var/mob/living/carbon/human/holder)
	..(holder)

	var/list/mob/living/carbon/human/possible_targets = list()
	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(H != holder)
			possible_targets += H

	if(possible_targets.len)
		target = pick(possible_targets)

	if(target != null)
		description = "� ���� �������� [target.real_name]."
	else
		description = "� ���� ����-������ ��������."


/datum/wish/round_wish/erp/targeted/check(var/list/data)
	if(!target)
		return 1

	if(data["partner"] == target)
		return 1
	else
		return 0


/datum/wish/round_wish/red_concentrate
	name = "red_concentrate_wish"
	description = "� ���� ����������� ������� ����������"
	// success_event = /datum/happiness_event/round_wish
	success_message = "<span class='info'>� �������� ��� ������ �������.</span>\n"

/datum/wish/round_wish/punch_targeted
	name = "punch_targeted_wish"
	description = "� ���� ������� ����-��, �� �� ���� ����"
	// success_event = /datum/happiness_event/round_wish
	success_message = "<span class='info'>� �������� ��� ������ �������.</span>\n"
	var/mob/living/carbon/human/target = null

/datum/wish/round_wish/punch_targeted/New(var/mob/living/carbon/human/holder)
	..(holder)

	var/list/mob/living/carbon/human/possible_targets = list()
	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(H != holder)
			possible_targets += H

	if(possible_targets.len)
		target = pick(possible_targets)

	if(target != null)
		description = "� ���� �������."
	else
		description = "� ���� ����-������ �������."

/datum/wish/round_wish/punch_targeted/check(var/list/data)
	if(!target)
		return 1

	if(data["target"] == target)
		return 1
	else
		return 0
