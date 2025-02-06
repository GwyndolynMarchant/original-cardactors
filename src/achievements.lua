SMODS.Achievement {
	key = "hyena",
	unlock_condition = function(self, args)
		local blunder = SMODS.find_card("j_ocs_billiesblunder", true)
		local fist = SMODS.find_card("j_raised_fist", true)
		local todo = SMODS.find_card("j_todo_list", true)

		-- Remember that LUA indices start at 1!!
		return (blunder[1] and fist[1] and todo[1])
	end
}