/obj/item/vampirebook/religious
	abstract_type = /obj/item/vampirebook/religious
	var/quote

/obj/item/vampirebook/religious/proc/get_quotes()
	return list()

/obj/item/vampirebook/religious/on_read(mob/living/carbon/human/user)
	var/list/quotes = get_quotes()
	if(!length(quotes))
		return FALSE
	quote = tgui_input_list(user, "Choose a passage to recite:", "Read Aloud", quotes)
	if(isnull(quote))
		return FALSE
	user.say(quote)
	return TRUE

/obj/item/vampirebook/religious/lilith
	name = "dark mother's revelations"
	icon_state = "revelationsofdarkmother"

/obj/item/vampirebook/religious/lilith/get_quotes()
	return GLOB.bahari_quotes

/obj/item/vampirebook/religious/noddist
	name = "book of Nod"
	icon_state = "bookofnod"

/obj/item/vampirebook/religious/noddist/get_quotes()
	return GLOB.noddist_quotes

/obj/item/vampirebook/religious/quran
	name = "Quran"
	icon_state = "quran"

/obj/item/vampirebook/religious/quran/get_quotes()
	return GLOB.quran_quotes
