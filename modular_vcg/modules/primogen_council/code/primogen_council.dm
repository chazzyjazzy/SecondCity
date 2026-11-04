/datum/camarilla_tradition
	var/name
	var/tenet
	var/lenient
	var/harsh
	/// Which reading of the tradition the Prince holds to: "lenient", "default" or "harsh"
	var/stance = "default"
	var/enforcement = "Enforced"
	var/notes = ""

/datum/camarilla_tradition/proc/get_stance_text()
	switch(stance)
		if("lenient")
			return lenient
		if("harsh")
			return harsh
	return tenet

/datum/camarilla_tradition/masquerade
	name = "The Masquerade"
	tenet = "Never reveal the existence of Kindred to mortals."
	lenient = "Minor slips may be forgiven if they are quickly covered up."
	harsh = "Any breach, however small, is answered with destruction if it's repair is neglected."

/datum/camarilla_tradition/domain
	name = "The Domain"
	tenet = "A Kindred is responsible for their own domain, and others must respect it while within."
	lenient = "Domain holders may set their own rules within their domain as the Prince does in theirs - barring treason."
	harsh = "All domains belong to the Prince, and follow the Prince's rules, holders keep them only at the Prince's pleasure."

/datum/camarilla_tradition/progeny
	name = "The Progeny"
	tenet = "No Kindred may Embrace without the permission of their Elder, typically the Prince."
	lenient = "Primogen may permit Embraces within their own clan, and the creation of Ghouls may be undertaken freely."
	harsh = "Embraces, and the creation of Ghouls, are strictly banned within the Prince's domain."

/datum/camarilla_tradition/accounting
	name = "The Accounting"
	tenet = "A sire answers for their childer and their actions until the childer are released."
	lenient = "Childer answer for their own actions - always."
	harsh = "Sires share every punishment their childer earn, released or not. Elders of a clan lineage may face punishment for the actions of their entire clan."

/datum/camarilla_tradition/hospitality
	name = "The Hospitality"
	tenet = "Kindred entering the city must present themselves to its ruler, the Prince."
	lenient = "Primogen may receive newcomers of their own clan on the Prince's behalf."
	harsh = "Newcomers must present themselves to the Prince, their Primogen, and any other relevant Elders deemed necessary, or find themselves in violation of the Prince's law."

/datum/camarilla_tradition/destruction
	name = "The Destruction"
	tenet = "Only an Elder, typically the Prince, may call for the destruction or diablerie of another Kindred. Those outside the Camarilla are not protected by this tradition."
	lenient = "Primogen may destroy and diablerize junior members of their own clan."
	harsh = "The destruction or diablerie of another Kindred, Camarilla or not, is strictly prohibited in the Prince's domain unless in the most extreme circumstances -  all matters will be instead be resolved non-lethally."
