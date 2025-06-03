SMODS.Atlas {
    key = 'rezzies', -- All the rezzies alternates
    path = "rezzies.png",
    px = 71,
    py = 95
}

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
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.3,
                        blockable = false,
                        func = function()
                            -- I'm sorry for how this works but i'm very high right now and didn't want to figure it out better then this
                            local rezzyRando = pseudorandom(pseudoseed("rezzy_tail"), 1 , 300)
                            local rezzyChoice = 'j_ocs_rezzy_chips'
                            if rezzyRando > 298 then
                                rezzyChoice = 'j_ocs_rezzy_legend'
                            elseif rezzyRando > 280 then
                                rezzyChoice = 'j_ocs_rezzy_x'
                            elseif rezzyRando > 200 then
                                rezzyChoice =  'j_ocs_rezzy_cash'
                            elseif rezzyRando > 100 then
                                rezzyChoice = 'j_ocs_rezzy_mult'
                            end
                            _card = SMODS.add_card({
                                set = "Joker",
                                area = G.jokers,
                                key = rezzyChoice
                            })
                            _card.ability.extra.rezzymainval = pseudorandom(pseudoseed("rezzy_tail"), _card.ability.extra.rezzyminval, _card.ability.extra.rezzymaxval)
                            return true
                        end
                    }))
                    return true
                end
            }))
        end
    end
}

function rezzyloc(self, info_queue, card)
    info_queue[#info_queue+1] = G.P_CENTERS.j_ocs_rezzy_tail 
    return { vars = {card.ability.extra.rezzymainval} }
end

function rezzypool(self)
    if next(SMODS.find_card("j_ring_master")) then
        return true
    elseif next(SMODS.find_card("j_ocs_rezzy_chips")) or next(SMODS.find_card("j_ocs_rezzy_mult")) or next(SMODS.find_card("j_ocs_rezzy_cash")) or next(SMODS.find_card("j_ocs_rezzy_x")) or next(SMODS.find_card("j_ocs_rezzy_legend")) then
        return false
    else
        return true
    end
end

function rezzyremove(self, card, from_debuff)
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
    remove_from_deck = rezzyremove,
    in_pool = rezzypool,
    loc_vars = rezzyloc,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = card.ability.extra.rezzymainval
            }
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
    remove_from_deck = rezzyremove,
    in_pool = rezzypool,
    loc_vars = rezzyloc,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.rezzymainval
            }
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
    remove_from_deck = rezzyremove,
    in_pool = rezzypool,
    loc_vars = rezzyloc,
    calc_dollar_bonus = function(self,card)
        local bonus = card.ability.extra.rezzymainval
        if bonus > 0 then return bonus end
    end
}

-- X Rated Rezzy
SMODS.Joker{
    key = "rezzy_x",
    rarity = 3,
    atlas = 'rezzies',
    blueprint_compat = true,
    config = {extra = {rezzymainval = 11,rezzyminval = 11, rezzymaxval = 35}},
    pos = {x = 1, y = 0},
    cost = 6,
    remove_from_deck = rezzyremove,
    in_pool = rezzypool,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.j_ocs_rezzy_tail
        return { vars = {card.ability.extra.rezzymainval * .1} }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.rezzymainval * .1
            }
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
    remove_from_deck = rezzyremove,
    in_pool = rezzypool,
    loc_vars = rezzyloc,
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

-- Write index information
OCS.J.Rezzies = {
    "j_ocs_rezzy_tail",
    "j_ocs_rezzy_chips",
    "j_ocs_rezzy_mult",
    "j_ocs_rezzy_cash",
    "j_ocs_rezzy_x",
    "j_ocs_rezzy_legend"
}

-- Append rezzies to central index
UTIL.appendList(OCS.J.AllJokers, OCS.J.Rezzies)
