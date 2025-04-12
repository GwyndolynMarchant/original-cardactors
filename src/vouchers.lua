SMODS.Atlas {
	key = "ocvouchers",
	path = "oc-vouchers.png",
    px = 71,
    py = 95
}

SMODS.Voucher {
	key = "btech",
	atlas = "ocvouchers",
	pos = { x = 0, y = 0 },
	config = { extra = {joker_slots = 1}},
	unlocked = true,
	discovered = false,
	redeem = function(self)
		G.E_MANAGER:add_event(Event({ 
            func = function()
				G.jokers.config.card_limit = G.jokers.config.card_limit + self.config.extra.joker_slots
				local _card = SMODS.add_card({set = "Joker", area = G.jokers, key = "j_ring_master", stickers = {'eternal'}})
		        return true
            end
        }))
	end,
	unredeem = function(self)
		G.E_MANAGER:add_event(Event({ 
            func = function()
				G.jokers.config.card_limit = G.jokers.config.card_limit - self.config.extra.joker_slots
		        return true
            end
        }))
	end,
}

SMODS.Voucher {
	key = "bverse",
	atlas = "ocvouchers",
	pos = { x = 1, y = 0 },
	config = { extra = {joker_slots = 1}},
	unlocked = true,
	discovered = false,
	requires = {'v_ocs_btech'},
	calculate = function(self, voucher, context)
		if context.starting_shop or context.reroll_shop then
			sendDebugMessage("Context for starting or re-rolling shop")
			if G.shop_jokers ~= nil then sendDebugMessage("Shop jokers are present...") end
			for _,shop_joker in ipairs(G.shop_jokers.cards) do
				-- sendDebugMessage("Shop Joker: " .. shop_joker.config.center.key)
				for _,hand_joker in ipairs(G.jokers.cards) do
					-- sendDebugMessage("Hand Joker: " .. hand_joker.config.center.key)
					if shop_joker.config.center.key == hand_joker.config.center.key then
						if not shop_joker.edition then
							sendDebugMessage("Duplicate found!")
							local edition = poll_edition(pseudoseed("balinaverse"), nil, false, true)
							shop_joker:set_edition(edition, true, true)
							shop_joker.ability.couponed = true
							shop_joker.temp_edition = nil
							shop_joker:juice_up() -- TODO: Not sure if there's a way we can replicate the vanilla generation effect?
						end
					end
				end
			end
		end
	end,
	redeem = function(self)
		G.E_MANAGER:add_event(Event({ 
            func = function()
				G.jokers.config.card_limit = G.jokers.config.card_limit + self.config.extra.joker_slots
		        return true
            end
        }))
	end,
	unredeem = function(self)
		G.E_MANAGER:add_event(Event({ 
            func = function()
				G.jokers.config.card_limit = G.jokers.config.card_limit - self.config.extra.joker_slots
		        return true
            end
        }))
	end
}