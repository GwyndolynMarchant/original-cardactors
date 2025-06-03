function find_number_moofs()
    local n = 0
    for _, value in ipairs(OCS.J.Moofs()) do
        local m = SMODS.find_card(value, false)
        n = n + #m
    end
    return n
end

SMODS.Joker{
    key = "moof_dama",
    rarity = 1,
    atlas = 'ocjokers',
    blueprint_compat = false,
    pos = {x = 2, y = 0},
    cost = 3,
    config = {
        extra = {
            base_xmult = 1.5,
            addt_xmult = 1.0
        }
    },
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.base_xmult + (card.ability.extra.addt_xmult * (math.max(0, (find_number_moofs() - 1))))
            }
        end
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.base_xmult + (card.ability.extra.addt_xmult * (math.max(0, (find_number_moofs() - 1)))),
                card.ability.extra.addt_xmult,
                card.ability.extra.base_xmult
            }
        }
    end,
    in_pool = function(self)
        return next(SMODS.find_card("j_ring_master")) and true or false
    end
}

-- Write index information
OCS.J.Moofs = {
    "j_ocs_moof_dama"
}

-- Append moofs to central index
UTIL.appendList(OCS.J.AllJokers, OCS.J.Moofs)