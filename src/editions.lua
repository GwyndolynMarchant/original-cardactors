BALIATRO.Image {
	key = "graceful-shine",
	path = "graceful-shine.png",
}

SMODS.Shader {
	key = "graceful",
	path = "graceful.fs",
    send_vars = function (sprite, card)
        return {
            overlay = BALIATRO.Images['ocs_graceful-shine'].image
        }
    end,
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
	in_shop = false,
}