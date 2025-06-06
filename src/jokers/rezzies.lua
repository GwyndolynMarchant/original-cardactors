SMODS.Atlas {
    key = 'rezzies', -- All the rezzies alternates
    path = "rezzies.png",
    px = 71,
    py = 95
}

REZZY = {}

REZZY.create = function(key)
    _card = SMODS.add_card({
        set = "Joker",
        area = G.jokers,
        key = key
    })
    _card.ability.extra.rezzymainval = pseudorandom(pseudoseed("rezzy_tail"), _card.ability.extra.rezzyminval, _card.ability.extra.rezzymaxval)
    return true
end

-- Rezzy Tail
SMODS.Joker{
    key = "rezzy_tail",
    rarity = 1,
    atlas = 'rezzies',
    blueprint_compat = false,
    pos = {x = 1, y = 1},
    cost = 0,
    in_pool = function(self)
        return false
    end,
    calculate = function(self, card, context)
        if context.end_of_round and not context.repetition and not context.individual and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('tarot1')
                    card.T.r = -0.2
                    card:juice_up(0.3, 0.4)
                    card.states.drag.is = true
                    card.children.center.pinch.x = true
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.3,
                        blockable = false,
                        func = function()
                            G.jokers:remove_card(card)
                            card:remove()
                            card = nil
                            return true
                        end
                    }))
                    if UTIL.E.GetEditionFromCard(card) == "negative" then
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.3,
                            blockable = false,
                            func = function () return REZZY.create('j_ocs_rezzy_offworld') end
                        }))
                    elseif UTIL.E.GetEditionFromCard(card) == "ocs_graceful" then
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.3,
                            blockable = false,
                            func = function () return REZZY.create('j_ocs_rezzy_graceful') end
                        }))
                    else
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.3,
                            blockable = false,
                            func = function()
                                -- I'm sorry for how this works but i'm very high right now and didn't want to figure it out better then this
                                local rezzyRando = pseudorandom(pseudoseed("rezzy_tail"), 1 , 300)
                                if rezzyRando > 298 then
                                    return REZZY.create('j_ocs_rezzy_legend')
                                elseif rezzyRando > 280 then
                                    return REZZY.create('j_ocs_rezzy_x')
                                elseif rezzyRando > 200 then
                                    return REZZY.create('j_ocs_rezzy_cash')
                                elseif rezzyRando > 100 then
                                    return REZZY.create('j_ocs_rezzy_mult')
                                else
                                    return REZZY.create('j_ocs_rezzy_chips')
                                end
                            end
                        }))
                    end
                    return true
                end
            }))
        end
    end
}

REZZY.localization = function (self, info_queue, card)
    info_queue[#info_queue+1] = G.P_CENTERS.j_ocs_rezzy_tail 
    return { vars = {card.ability.extra.rezzymainval} }
end

REZZY.pool = function (self)
    if next(SMODS.find_card("j_ring_master")) then
        return true
    else
        for i,v in ipairs(OCS.J.Rezzies) do
            if next(SMODS.find_card(v)) then return false end
        end
        return true
    end
end

REZZY.remove = function (self, card, from_debuff)
    if not from_debuff then
        G.E_MANAGER:add_event(Event({
            func = function() 
                SMODS.add_card({
                    set = "Joker",
                    area = G.jokers,
                    key = 'j_ocs_rezzy_tail'
                })
                return true 
            end
        }))
    end
end

-- Chippy Rezzy
SMODS.Joker{
    key = "rezzy_chips",
    rarity = 1,
    atlas = 'rezzies',
    blueprint_compat = true,
    config = {extra = {rezzymainval = 10,rezzyminval = 10, rezzymaxval = 100}},
    pos = {x = 0, y = 0},
    cost = 3,
    remove_from_deck = REZZY.remove,
    in_pool = REZZY.pool,
    loc_vars = REZZY.localization,
    calculate = function(self, card, context)
        if context.joker_main then
            return { chips = card.ability.extra.rezzymainval }
        end
    end
}

-- Rhythm Rezzy
SMODS.Joker{
    key = "rezzy_mult",
    rarity = 1,
    atlas = 'rezzies',
    blueprint_compat = true,
    config = {extra = {rezzymainval = 4,rezzyminval = 4, rezzymaxval = 20}},
    pos = {x = 2, y = 0},
    cost = 3,
    remove_from_deck = REZZY.remove,
    in_pool = REZZY.pool,
    loc_vars = REZZY.localization,
    calculate = function(self, card, context)
        if context.joker_main then
            return { mult = card.ability.extra.rezzymainval }
        end
    end
}

-- Ritzy Rezzy
SMODS.Joker{
    key = "rezzy_cash",
    rarity = 2,
    atlas = 'rezzies',
    blueprint_compat = true,
    config = {extra = {rezzymainval = 2,rezzyminval = 2, rezzymaxval = 10}},
    pos = {x = 0, y = 1},
    cost = 4,
    remove_from_deck = REZZY.remove,
    in_pool = REZZY.pool,
    loc_vars = REZZY.localization,
    calc_dollar_bonus = function(self,card)
        local bonus = card.ability.extra.rezzymainval
        if bonus > 0 then return bonus end
    end
}

REZZY.localization_x = function(self, info_queue, card)
    info_queue[#info_queue+1] = G.P_CENTERS.j_ocs_rezzy_tail
    return { vars = {card.ability.extra.rezzymainval * .1} }
end

-- X Rated Rezzy
SMODS.Joker{
    key = "rezzy_x",
    rarity = 3,
    atlas = 'rezzies',
    blueprint_compat = true,
    config = {extra = {rezzymainval = 11,rezzyminval = 11, rezzymaxval = 35}},
    pos = {x = 1, y = 0},
    cost = 6,
    remove_from_deck = REZZY.remove,
    in_pool = REZZY.pool,
    loc_vars = REZZY.localization_x,
    calculate = function(self, card, context)
        if context.joker_main then
            return { xmult = card.ability.extra.rezzymainval * .1 }
        end
    end
}

-- Rezzy of Legend
SMODS.Joker{
    key = "rezzy_legend",
    rarity = 4,
    atlas = 'rezzies',
    blueprint_compat = true,
    config = {extra = {rezzymainval = 1,rezzyminval = 1, rezzymaxval = 3}},
    pos = {x = 3, y = 0},
    cost = 10,
    soul_pos = {x = 3, y = 1 },
    remove_from_deck = REZZY.remove,
    in_pool = REZZY.pool,
    loc_vars = REZZY.localization,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.repetition and not context.repetition_only then
            return {
                message = 'Again!',
                repetitions = card.ability.extra.rezzymainval,
                card = context.other_card
            }
        end
    end
}

-- Offworld Rezzy
SMODS.Joker{
    key = "rezzy_offworld",
    rarity = "ocs_alien",
    atlas = 'rezzies',
    blueprint_compat = true,
    config = {extra = {rezzymainval = 11,rezzyminval = 11, rezzymaxval = 35}},
    pos = {x = 4, y = 0},
    soul_pos = {x = 4, y = 1 },
    cost = 12,
    remove_from_deck = REZZY.remove,
    in_pool = REZZY.pool,
    loc_vars = REZZY.localization_x,
    calculate = function(self, card, context)
        if context.joker_main then
            return { xchips = card.ability.extra.rezzymainval * .1 }
        end
    end
}

SMODS.Joker {
    key = "rezzy_graceful",
    rarity = 3,
    atlas = 'rezzies',
    blueprint_compat = false,
    config = {extra = {rezzymainval = 2,rezzyminval = 2, rezzymaxval = 4}},
    pos = {x = 2, y = 1},
    cost = 6,
    remove_from_deck = REZZY.remove,
    in_pool = REZZY.pool,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.rezzymainval }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            score_mod_chosen = pseudorandom_element({"chips", "mult", "xmult", "dollars"}, pseudoseed("graceful"))
            score_mod_amount = pseudorandom(pseudoseed("graceful"), OCS.E.Graceful.score_mod_min[score_mod_chosen], OCS.E.Graceful.score_mod_max[score_mod_chosen]) * self.config.extra.rezzymainval
            if score_mod_chosen == "chips"   then return { chips   = score_mod_amount } end
            if score_mod_chosen == "mult"    then return { mult    = score_mod_amount } end
            if score_mod_chosen == "xmult"   then return { xmult   = score_mod_amount } end
            if score_mod_chosen == "dollars" then return { dollars = score_mod_amount } end
        end
    end
}

UTIL.appendList(OCS.J.Ungraceful, { "j_ocs_rezzy_graceful" })

-- Write index information
OCS.J.Rezzies = {
    "j_ocs_rezzy_tail",
    "j_ocs_rezzy_chips",
    "j_ocs_rezzy_mult",
    "j_ocs_rezzy_cash",
    "j_ocs_rezzy_x",
    "j_ocs_rezzy_legend",
    "j_ocs_rezzy_offworld",
    "j_ocs_rezzy_graceful",
}

-- Append rezzies to central index
UTIL.appendList(OCS.J.AllJokers, OCS.J.Rezzies)
