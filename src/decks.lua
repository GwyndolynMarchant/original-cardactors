local global = require('global')

SMODS.Atlas {
	key = "decks",
	px = 71,
	py = 95,
	path = "OCs-deck.png"
}

SMODS.Back {
	key = "deck_cardactors",
	loc_txt = {
		name = "Original Cardactors",
		text = { "Begin with","an OC joker." }
	},
	atlas = "decks",
	pos = { x = 0, y = 0 },
	apply = function(self)
		G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					SMODS.add_card({
						set = "Joker",
						area = G.jokers,
						key = pseudorandom_element(global.OC_jokers),
						no_edition = true
					})
					return true
				end
			end,
		}))
    end
}