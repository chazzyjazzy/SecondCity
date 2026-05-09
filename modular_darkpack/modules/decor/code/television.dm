/obj/machinery/status_display/evac/tv
	name = "\improper TV"
	desc = "A slightly battered looking TV. Various infomercials play on a loop, accompanied by a jaunty tune."
	icon = 'modular_darkpack/modules/decor/icons/television.dmi'
	icon_state = "tv_off"

/obj/machinery/status_display/evac/tv/receive_signal(datum/signal/signal)
	if(signal.data["command"] != "greenscreen")
		return
	var/datum/weakref/display_ref = signal.data["display"]
	var/obj/effect/abstract/greenscreen_display/new_display = display_ref?.resolve()
	if(istype(new_display))
		if(isnull(speakers))
			speakers = new(src)
			speakers.name = "[name] speakers"
			speakers.special_channels |= RADIO_SPECIAL_CENTCOM
			speakers.set_frequency(FREQ_STATUS_DISPLAYS)
		new_display.pixel_y = -12 // shift down to fit TV screen region
		LAZYOR(active_displays, new_display)
	set_display_with_priority(SD_GREENSCREEN, DISPLAY_PRIORITY_MESSAGE, force_override = TRUE)
	update()

/obj/structure/fluff/tv/order
	name = "order screen"
	desc = "A slightly battered looking TV. It shows a menu to order from."
	icon = 'modular_darkpack/modules/decor/icons/restaurant.dmi'
	icon_state = "order1"

/obj/structure/fluff/tv/order/one
	icon_state = "order1"

/obj/structure/fluff/tv/order/two
	icon_state = "order2"

/obj/structure/fluff/tv/order/three
	icon_state = "order3"

/obj/structure/fluff/tv/order/four
	icon_state = "order4"

/obj/structure/fluff/tv/order/random

/obj/structure/fluff/tv/order/random/Initialize(mapload)
	. = ..()
	icon_state = "order[rand(1,4)]"
