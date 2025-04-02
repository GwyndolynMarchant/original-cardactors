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
	pos = { x = 0, y = 0 },
	config = { extra = {joker_slots = 1}},
	unlocked = true,
	discovered = false,
	requires = {'v_ocs_btech'},
	calculate = function(self, voucher, context)
		if context.create_card then
			local card = context.card
			local is_joker = card.ability.set == "Joker"
			if card and is_joker and not card.edition then
	            G.CONTROLLER.locks[lock] = true
                context.card.temp_edition = true
                local edition = poll_edition(pseudoseed("balinaverse"), nil, false, true)
                context.card:set_edition(edition, true, true)
                context.card.ability.couponed = true
                context.card.temp_edition = nil
                G.CONTROLLER.locks[lock] = nil
                return true
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