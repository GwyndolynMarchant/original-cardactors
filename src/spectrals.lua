SMODS.Atlas {
    key = "ocspectrals", -- Standalone OC jokers
    path = "oc-spectrals.png",
    px = 71,
    py = 95
}

SMODS.Consumable {
	key = "install",
	set = "Spectral",
	atlas = "ocspectrals",
	pos = { x = 0, y = 0 },
	can_use = function(self, card)
		return UTIL.xor((G.hand.highlighted and #G.hand.highlighted == 1), (G.jokers.highlighted and #G.jokers.highlighted == 1))
	end,
	use = function(self, card, area, copier)
		local choice = nil
		if G.hand.highlighted and #G.hand.highlighted == 1 then
	    	choice = G.hand.highlighted[1]
	    elseif G.jokers.highlighted and #G.jokers.highlighted == 1 then
	    	choice = G.jokers.highlighted[1]
		else
	    	choice = G.hand.cards[1]
	    end
	    choice:set_edition("e_ocs_graceful")
	end
}

SMODS.Consumable {
	key = "launch",
	set = "Spectral",
	atlas = "ocspectrals",
	pos = { x = 1, y = 0 },
	can_use = function(self, card) return true end,
	use = function(self, card, area, copier)
		-- TODO: CRASHES WHEN ENCOUNTERING GRACEFUL CARDS
		if next(G.hand.cards) then SMODS.destroy_cards(G.hand.cards) end
		if next(G.jokers.cards) then SMODS.destroy_cards(G.jokers.cards) end
		if next(G.consumeables.cards) then SMODS.destroy_cards(G.consumeables.cards) end
		SMODS.add_card({
			set = "Joker",
			area = G.jokers,
			rarity = "ocs_alien"
		})
	end
}