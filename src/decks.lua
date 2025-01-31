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
	calculate = function (self, back, context)
		-- TODO: Actual code
	end
}