MOOF = {}

MOOF.raw_num = function ()
    local n = 0
    for _, value in ipairs(G.P_CENTER_POOLS["moofs"]) do
        local m = SMODS.find_card(value, false)
        n = n + #m
    end
    return n
end

MOOF.num = function ()
    return math.max(0, (MOOF.raw_num() - 1))
end

MOOF.pool = function (self)
    return next(SMODS.find_card("j_ring_master")) and true or false
end

MOOF.calc_internal = function (card, suffix)
    return card.ability.extra["base_"..suffix] + (card.ability.extra["addt_"..suffix] * MOOF.num())
end

MOOF.loc_vars_internal = function (card, suffix)
    return {
        card.ability.extra["base_"..suffix] + (card.ability.extra["addt_"..suffix] * MOOF.num()),
        card.ability.extra["addt_"..suffix],
        card.ability.extra["base_"..suffix]
    }
end

SMODS.ObjectType { key = "moofs" }

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
            addt_xmult = 1.0,
        }
    },
    pools = {
        ["alljokers"] = true,
        ["moofs"] = true
    },
    calculate = function(self, card, context)
        if context.joker_main then
            return { xmult = MOOF.calc_internal(card, "xmult") }
        end
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = MOOF.loc_vars_internal(card, "xmult") }
    end,
    in_pool = MOOF.pool,
}

SMODS.Joker {
    key = "moof_torch",
    rarity = 1,
    atlas = "ocjokers",
    blueprint_compat = false,
    pos = { x = 3, y = 0 },
    cost = 3,
    config = {
        extra = {
            base_mult = 4,
            addt_mult = 8,
        }
    },
    pools = {
        ["alljokers"] = true,
        ["moofs"] = true
    },
    calculate = function(self, card, context)
        if context.joker_main then
            return { mult = MOOF.calc_internal(card, "mult") }
        end
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = MOOF.loc_vars_internal(card, "mult") }
    end,
    in_pool = MOOF.pool,
}