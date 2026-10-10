/datum/reagent
	var/kindred_metabolizes = FALSE

/datum/reagent/proc/can_metabolize_liverless(mob/living/carbon/owner)
	if(self_consuming)
		return TRUE
	if(!owner || !HAS_TRAIT(owner, TRAIT_DRINKS_BLOOD))
		return FALSE
	return kindred_metabolizes
