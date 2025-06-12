SMODS.Rarity {
    key = "alien",
    badge_colour = G.C.BLACK,
    default_weight = 0.01
}

SMODS.ObjectType { key = "aliens" }

SMODS.Joker {
    key = "blackle",
    atlas = "ocjokers",
    pos = { x = 0, y = 1 },
    soul_pos = {x = 1, y = 1 },
    rarity = "ocs_alien",
    cost = 50,
    blueprint_compat = false,
    eternal_compat = false,
    pools = {
        ["alljokers"] = true,
        ["aliens"] = true
    },
    calculate = function(self, card, context)
        if context.joker_main then 
            G.STATE = G.STATES.GAME_OVER
            G.STATE_COMPLETE = false
        end
    end,
}

SMODS.Joker {
    key = "qcc",
    atlas = "ocjokers",
    pos = { x = 2, y = 1 },
    soul_pos = {x = 3, y = 1 },
    rarity = "ocs_alien",
    cost = 15,
    blueprint_compat = true,
    pools = {
        ["alljokers"] = true,
        ["aliens"] = true
    },
    calculate = function(self, card, context)
        if context.joker_main then return { mult = #SMODS.mod_list } end
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = { #SMODS.mod_list }, }
    end
}