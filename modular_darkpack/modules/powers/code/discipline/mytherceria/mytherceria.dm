/datum/discipline/mytherceria
	name = "Mytherceria"
	desc = "Command fae-like powers to beguile and ensorcell your foes."
	icon_state = "mytherceria"
	clan_restricted = TRUE
	power_type = /datum/discipline_power/mytherceria

/datum/discipline_power/mytherceria
	name = "Mytherceria power name"
	desc = "Mytherceria power description"

	activate_sound = 'modular_darkpack/modules/deprecated/sounds/kiasyd.ogg'

/datum/discipline_power/mytherceria/folderol
	name = "Folderol"
	desc = "Detect if a target is deliberately lying."
	level = 1
	check_flags = DISC_CHECK_CONSCIOUS
	target_type = TARGET_PLAYER
	vitae_cost = 0
	cooldown_length = 1 TURNS
	range = 7

/datum/discipline_power/mytherceria/folderol/activate(mob/living/target)
	. = ..()
	var/mob/living/L = target

	SEND_SOUND(L, sound(activate_sound, 0, 0, 50)) // LOOK OUT! THERE'S A FAIRY!

	var/response_w = tgui_input_list(L, "Does your character believe your last statement to be the truth?", "Folderol", list("Yes", "No"))

	if(response_w == "Yes")
		to_chat(owner, span_notice("[L] is not intentionally lying."))
	else
		to_chat(owner, span_notice("[L] is LYING!"))
	log_directed_talk(owner, target, "[owner] used Folderol on [target]. Response: [response_w]", LOG_SAY, "Folderol")
	return


/datum/discipline_power/mytherceria/fae_sight
	name = "Fae Sight"
	desc = "Sense non-vampiric, non-ghostly magic around yourself."
	level = 2
	check_flags = DISC_CHECK_CONSCIOUS
	vitae_cost = 0
	duration_length = 1 SCENES
	cancelable = TRUE

/datum/discipline_power/mytherceria/fae_sight/activate()
	. = ..()
	var/datum/atom_hud/data/auspex_aura/target_hud = GLOB.huds[DATA_HUD_AUSPEX_AURAS]
	target_hud.show_to(owner)

	var/list/heard = orange(DEFAULT_SIGHT_DISTANCE, owner)
	for(var/mob/living/hearer in heard)
		if(!HAS_TRAIT(src, TRAIT_FORCED_EMOTION))
			hearer.apply_status_effect(/datum/status_effect/question_emotion)

/datum/discipline_power/mytherceria/fae_sight/deactivate()
	. = ..()
	var/datum/atom_hud/data/auspex_aura/target_hud = GLOB.huds[DATA_HUD_AUSPEX_AURAS]
	target_hud.hide_from(owner)

/datum/discipline_power/mytherceria/aura_absorbtion
	name = "Aura Absorbtion"
	desc = "Absorb the aura of whatever you examine, making it more difficult for those around to "
	level = 3
	check_flags = DISC_CHECK_CONSCIOUS
	vitae_cost = 0
	target_type = TARGET_LIVING | TARGET_OBJ

/datum/status_effect/confusion/chanjelin_ward/on_creation(mob/living/new_owner, duration = INFINITY)
	return ..()

/datum/discipline_power/mytherceria/chanjelin_ward
	name = "Chanjelin Ward"
	desc = "Place a ward that confuses and befuddles your foes."

	level = 4
	check_flags = DISC_CHECK_CAPABLE | DISC_CHECK_DIRECT_SEE
	target_type = TARGET_MOB | TARGET_OBJ | TARGET_TURF | TARGET_SELF
	vitae_cost = 0
	cooldown_length = 4 TURNS

/datum/discipline_power/mytherceria/chanjelin_ward/pre_activation_checks(atom/target)
	var/activate_time = max(3 TURNS - (owner.st_get_stat(STAT_DEXTERITY) + owner.st_get_stat(STAT_OCCULT)), 1 SECONDS) // realtime gameplay concession
	to_chat(owner, span_notice("You begin inscribing a ward on [target]."))
	if(!do_after(owner, activate_time, target, interaction_key = "chanjelin_ward", max_interact_count = 1))
		to_chat(owner, span_warning("You decide not to finish the ward and erase your progress."))
		return FALSE
	. = ..()

/datum/discipline_power/mytherceria/chanjelin_ward/activate(atom/target)
	. = ..()
	AddElement(/datum/element/chanjelin_ward, user, target)

/datum/discipline_power/mytherceria/the_riddle_phantastique
	name = "The Riddle Phantastique"
	desc = "Place a ward that confuses and befuddles your foes."

	level = 5
	check_flags = DISC_CHECK_DIRECT_SEE
	target_type = TARGET_HUMAN
	vitae_cost = 0
	cooldown_length = 4 TURNS
	range = 2
	/datum/storyteller_roll/riddle_phantastique/riddle_roll

/datum/storyteller_roll/riddle_phantastique
	bumper_text = "the riddle phantastique"
	applicable_stats = list(STAT_MANIPULATION, STAT_OCCULT)
	
