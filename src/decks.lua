SMODS.Atlas {
	key = "decks",
	px = 71,
	py = 95,
	path = "OCs-deck.png"
}

-- Set up which Jokers can appear in decks ---------------
for _, v in ipairs(OCS.J.AllJokers) do
  if v ~= 'j_ocs_rezzy_legend' then
    table.insert(OCS.J.Deck, v)
  end
end
-------------------------------------------------------------

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
						key = pseudorandom_element(OCS.J.Deck, pseudoseed("ocsdeck")),
						no_edition = true
					})
					return true
				end
			end,
		}))
    end
}