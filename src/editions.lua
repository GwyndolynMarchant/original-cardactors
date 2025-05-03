SMODS.Shader {
	key = "graceful",
	path = "graceful.fs"
}

SMODS.Edition {
	key = "graceful",
	shader = "graceful",
	loc_txt = {
		name = "Graceful",
		label = "Graceful",
		text = {
			"WIP"
		},
	},
	get_weight = function(self)
		return 0
	end
}