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

SMODS.Achievement {
	key = "vizday",
	unlock_condition = function(self, args)
		if  next(SMODS.find_card("j_ocs_viz_hoard", true))
		and next(SMODS.find_card("j_ocs_viz_gunpla", true))
		then
			return true
		else
			return false
		end
	end
}

SMODS.Achievement {
	key = "blackle",
	unlock_condition = function(self, args)
		if
			G.STATE == G.STATES.GAME_OVER
			and G.GAME.won == false
			and next(SMODS.find_card("j_ocs_blackle"))
		then
			return true
		else
			return false
		end
	end
}

SMODS.Achievement {
	key = "rezzy_evo_grace",
	unlock_condition = function(self, args)
		return OCS.A.REZZY.EVO.grace == true
	end
}

SMODS.Achievement {
	key = "rezzy_evo_alien",
	unlock_condition = function(self, args)
		return OCS.A.REZZY.EVO.alien == true
	end
}