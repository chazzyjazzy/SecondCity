/obj/item/vampirebook
	name = "a book"
	desc = "So full of knowledge"
	icon_state = "book"
	icon = 'modular_darkpack/modules/books/icons/books.dmi'
	ONFLOOR_ICON_HELPER('modular_darkpack/modules/books/icons/books_onfloor.dmi')
	w_class = WEIGHT_CLASS_SMALL
	var/quote = "Hm... This book is boring."
	COOLDOWN_DECLARE(read)
	abstract_type = /obj/item/vampirebook

/obj/item/vampirebook/proc/get_quotes()
	return list("Hm... this book is boring.")

/obj/item/vampirebook/proc/read_book(mob/living/carbon/human/user)
	var/list/quotes = get_quotes()
	if(!length(quotes))
		return FALSE
	quote = tgui_input_list(user, "Choose a passage to recite:", "Read Aloud", quotes)
	if(isnull(quote))
		return FALSE
	return TRUE

/obj/item/vampirebook/attack_self(mob/living/carbon/human/user)
	if(!COOLDOWN_FINISHED(src, read))
		return
	if(!read_book(user))
		return
	user.say(quote)
	var/original_icon_state = icon_state
	icon_state = "[original_icon_state]-1"
	COOLDOWN_START(src, read, 10 SECONDS)
	spawn(10 SECONDS)
		icon_state = original_icon_state

/obj/item/vampirebook/lilith
	name = "dark mother's revelations"
	icon_state = "revelationsofdarkmother"

/obj/item/vampirebook/lilith/get_quotes()
	return GLOB.bahari_quotes

/obj/item/vampirebook/noddist
	name = "book of Nod"
	icon_state = "bookofnod"

/obj/item/vampirebook/noddist/get_quotes()
	return GLOB.noddist_quotes

/obj/item/vampirebook/quran
	name = "Quran"
	icon_state = "quran"

/obj/item/vampirebook/quran/get_quotes()
	return GLOB.quran_quotes
