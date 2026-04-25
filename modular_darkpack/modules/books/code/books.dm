/obj/item/vampirebook

	name = "a book"
	desc = "So full of knowledge"
	icon_state = "book"
	icon = 'modular_darkpack/modules/books/icons/books.dmi'
	ONFLOOR_ICON_HELPER('modular_darkpack/modules/books/icons/books_onfloor.dmi')
	w_class = WEIGHT_CLASS_SMALL
	COOLDOWN_DECLARE(read)
	abstract_type = /obj/item/vampirebook

/obj/item/vampirebook/proc/on_read(mob/living/carbon/human/user)
	return

/obj/item/vampirebook/attack_self(mob/living/carbon/human/user)
	if(!COOLDOWN_FINISHED(src, read))
		return
	if(!on_read(user))
		return
	var/original_icon_state = icon_state
	icon_state = "[original_icon_state]-1"
	COOLDOWN_START(src, read, 10 SECONDS)
	spawn(10 SECONDS)
		icon_state = original_icon_state

