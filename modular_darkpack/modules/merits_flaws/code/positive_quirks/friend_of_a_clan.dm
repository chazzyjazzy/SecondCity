GLOBAL_LIST_INIT(main_vampire_clans, list(\
	VAMPIRE_CLAN_BANU_HAQIM,\
	VAMPIRE_CLAN_BRUJAH,\
	VAMPIRE_CLAN_GANGREL,\
	VAMPIRE_CLAN_GIOVANNI,\
	VAMPIRE_CLAN_LASOMBRA,\
	VAMPIRE_CLAN_MALKAVIAN,\
	VAMPIRE_CLAN_SETITE,\
	VAMPIRE_CLAN_NOSFERATU,\
	VAMPIRE_CLAN_TOREADOR,\
	VAMPIRE_CLAN_TREMERE,\
	VAMPIRE_CLAN_TZIMISCE,\
	VAMPIRE_CLAN_VENTRUE\
))

/datum/quirk/darkpack/clan_friendship
	name = "Clan Friendship"
	desc = "One Clan besides your own has a particular liking for you. Perhaps in the past you've done their entire Clan or an important Elder a valuable favor, or maybe the Clan simply likes the way you operate - either way, the feeling is mutual, as you are now one of their most ardent supporters in a bond of genuine trust and friendship. All members of this clan, upon examining your character, will know of your friendship to their blood - but be warned. Elders and leadership of your own clan will have different reactions based on their suspicion, or delight, at your closeness."
	value = 4
	mob_trait = TRAIT_CLAN_FRIENDSHIP
	icon = FA_ICON_SMILE
	gain_text = span_notice("You've become the friend of a large clan. You should meet up with them if you need help.")
	lose_text = span_notice("You feel as though you've burned some bridges...")
	allowed_splats = list(SPLAT_KINDRED, SPLAT_GHOUL)
	failure_message = "You feel as though you've burned some bridges..."
	var/clan_friendship

/datum/preference/choiced/clan_friendship
	category = PREFERENCE_CATEGORY_MANUALLY_RENDERED
	savefile_key = "clan_friendship"
	savefile_identifier = PREFERENCE_CHARACTER

/datum/preference/choiced/clan_friendship/init_possible_values()
	return GLOB.main_vampire_clans

/datum/preference/choiced/clan_friendship/create_default_value()
	return VAMPIRE_CLAN_BRUJAH

/datum/preference/choiced/clan_friendship/is_accessible(datum/preferences/preferences)
	. = ..()
	if (!.)
		return FALSE
	return /datum/quirk/darkpack/clan_friendship::name in preferences.all_quirks

/datum/preference/choiced/clan_friendship/apply_to_human(mob/living/carbon/human/target, value)
	var/datum/quirk/darkpack/clan_friendship/friendship_quirk_datum = target.get_quirk(/datum/quirk/darkpack/clan_friendship)
	if(!friendship_quirk_datum)
		return
	friendship_quirk_datum.clan_friendship = value || VAMPIRE_CLAN_BRUJAH

/datum/quirk_constant_data/clan_friendship
	associated_typepath = /datum/quirk/darkpack/clan_friendship
	customization_options = list(/datum/preference/choiced/clan_friendship)

/datum/quirk/darkpack/clan_friendship/add(client/client_source)
	clan_friendship = client_source?.prefs.read_preference(/datum/preference/choiced/clan_friendship) || VAMPIRE_CLAN_BRUJAH

