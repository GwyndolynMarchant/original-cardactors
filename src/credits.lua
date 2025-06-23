function UI_TEXT_BOX(title, colour, scale)
	return
		{ n = G.UIT.R, config = {
			align = "cm",
		}, nodes = {
			{ n=G.UIT.T, config = {
				text = title,
				colour = colour,
				scale = scale
			}}
		}}
end

UI_SPRITE_INDEXES = {
	j_ocs_geniusjunebug = {
		atlas = 'junebug',
		pos = { x = 9, y = 0 }
	},
	j_ocs_billiesblunder = {
    	atlas = 'ocjokers',
    	pos = { x = 0, y = 0 },
	},
	j_ocs_rezzy_mult = {
		atlas = 'rezzies',
    	pos = {x = 2, y = 0},
	},
	j_ocs_viz_hoard = {
	    atlas = 'ocjokers',
	    pos = { x = 0, y = 2 },
	}
}

function UI_SPRITE(sprite_key, height)
	return
		{ n = G.UIT.R, config = {
			align = "cm",
		}, nodes = {
			{ n = G.UIT.O, config = {
				object = Sprite(
					0, 0, height*(71/95), height,
					G.ASSET_ATLAS["ocs_" .. UI_SPRITE_INDEXES[sprite_key].atlas],
					UI_SPRITE_INDEXES[sprite_key].pos)
			}}
		}}
end

function UI_CREDIT_LABEL(title, name, card_key, size)
	return
		{ n = G.UIT.C, config = {
			align = "cm",
			padding = 0.1 * size,
			minw = 5 * size,
			minh = 2 * size,
			outline = 1.0 * size,
			outline_colour = G.C.UI.TEXT_INACTIVE,
			r = 0.1,
		}, nodes = {
			UI_SPRITE(card_key, 2 * size),
			UI_TEXT_BOX(title, OCS.C.PINK, 0.4 * size),
			UI_TEXT_BOX(name, G.C.UI.TEXT_LIGHT, 0.6 * size),
		}}
end

SMODS.current_mod.extra_tabs = function()
	return {
		{
			label = 'Credits',
			tab_definition_function = function()
				return
					{ n = G.UIT.ROOT, config = {
						align = "tm",
						colour = G.C.BLACK,
						r = 0.1,
						emboss = 0.1,
					}, nodes = {
						{ n=G.UIT.C, config={
							align = "cm",
							padding = 0.01
						}, nodes = {
							{ n=G.UIT.R, config={
								align = "cm",
								padding = 0.2,
							}, nodes = {
								UI_CREDIT_LABEL("Lead Designer", "JuniperTheory", "j_ocs_geniusjunebug", 1),
								UI_CREDIT_LABEL("Lead Developer", "Hellgnoll", "j_ocs_billiesblunder", 1),
							}},
							{ n=G.UIT.R, config={
								align = "cm",
								padding = 0.1,
							}, nodes = {
								UI_CREDIT_LABEL("Music", "Ms Rezzy Crimes", "j_ocs_rezzy_mult", 0.7),
								UI_CREDIT_LABEL("Tester", "Drakkenlupen", "j_ocs_viz_hoard", 0.7),
							}},
						}}
					}}
			end,
		},
	}
end