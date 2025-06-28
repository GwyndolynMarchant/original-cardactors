SMODS.Achievement {
	key = "hyena",
	unlock_condition = function(self, args)
		if 	next(SMODS.find_card("j_ocs_billiesblunder", true))
		and next(SMODS.find_card("j_raised_fist", true))
		and next(SMODS.find_card("j_todo_list", true))
		then
			return true
		else
			return false
		end
	end
}