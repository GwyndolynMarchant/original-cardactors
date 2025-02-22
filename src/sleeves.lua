SMODS.Atlas {
	key = "sleeves",
	px = 73,
	py = 95,
	path = "OCs-sleeve.png"
}

CardSleeves.Sleeve {
	key = "sleeve_oc",
    atlas = "sleeves",  -- you will need to create an atlas yourself
    pos = { x = 0, y = 0 },
    apply = function(self)
		G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					SMODS.add_card({
						set = "Joker",
						area = G.jokers,
						key = pseudorandom_element(globals.OC_jokers, pseudoseed("ocjokers")),
						no_edition = true
					})
					sendDebugMessage(CardSleeves.Sleeve.get_current_deck_key())
					if CardSleeves.Sleeve.get_current_deck_key() == "b_ocs_deck_cardactors" then
						SMODS.add_card({
							set = "Joker",
							area = G.jokers,
							key = pseudorandom_element(globals.OC_textured, pseudoseed("ocjokers")),
							no_edition = true
						})
					end
					return true
				end
			end,
		}))
    end,
    loc_vars = function(self)
    	local key = self.key
    	if self.get_current_deck_key() == "b_ocs_deck_cardactors" then
    		key = self.key .. "_alt"
    	end
    	return { key = key }
    end
}