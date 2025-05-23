SMODS.Atlas {
    key = 'rezzies', -- All the rezzies alternates
    path = "rezzies.png",
    px = 71,
    py = 95
}

-- Rezzy Tail
SMODS.Joker{
    key = "rezzytail",
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
                            local rezzyRando = pseudorandom(pseudoseed("rezzytail"), 1 , 300)
                            local rezzyChoice = 'j_ocs_rezzychips'
                            if rezzyRando > 298 then
                                rezzyChoice = 'j_ocs_rezzylegend'
                            elseif rezzyRando > 280 then
                                rezzyChoice = 'j_ocs_rezzyx'
                            elseif rezzyRando > 200 then
                                rezzyChoice =  'j_ocs_rezzycash'
                            elseif rezzyRando > 100 then
                                rezzyChoice = 'j_ocs_rezzymult'
                            end
                            _card = SMODS.add_card({
                                set = "Joker",
                                area = G.jokers,
                                key = rezzyChoice
                            })
                            _card.ability.extra.rezzymainval = pseudorandom(pseudoseed("rezzytail"), _card.ability.extra.rezzyminval, _card.ability.extra.rezzymaxval)
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
    info_queue[#info_queue+1] = G.P_CENTERS.j_ocs_rezzytail 
    return { vars = {card.ability.extra.rezzymainval} }
end

-- Chippy Rezzy
SMODS.Joker{
    key = "rezzychips",
    rarity = 1,
    atlas = 'rezzies',
    blueprint_compat = true,
    config = {extra = {rezzymainval = 10,rezzyminval = 10, rezzymaxval = 100}},
    pos = {x = 0, y = 0},
    cost = 3,
    remove_from_deck = function(self, card, from_debuff)
        if not from_debuff then
            G.E_MANAGER:add_event(Event({
                func = function() 
                    SMODS.add_card({
                        set = "Joker",
                        area = G.jokers,
                        key = 'j_ocs_rezzytail'
                    })
                    return true 
                end
            }))
        end
    end,
    in_pool = function(self)
        if next(SMODS.find_card("j_ring_master")) then
            return true
        elseif next(SMODS.find_card("j_ocs_rezzychips")) or next(SMODS.find_card("j_ocs_rezzymult")) or next(SMODS.find_card("j_ocs_rezzycash")) or next(SMODS.find_card("j_ocs_rezzyx")) or next(SMODS.find_card("j_ocs_rezzylegend")) then
            return false
        end
        return true
    end,
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
    key = "rezzymult",
    rarity = 1,
    atlas = 'rezzies',
    blueprint_compat = true,
    config = {extra = {rezzymainval = 4,rezzyminval = 4, rezzymaxval = 20}},
    pos = {x = 2, y = 0},
    cost = 3,
    remove_from_deck = function(self, card, from_debuff)
        if not from_debuff then
            G.E_MANAGER:add_event(Event({
                func = function() 
                    SMODS.add_card({
                        set = "Joker",
                        area = G.jokers,
                        key = 'j_ocs_rezzytail'
                    })
                    return true 
                end
            }))
        end
    end,
    in_pool = function(self)
        if next(SMODS.find_card("j_ring_master")) then
            return true
        elseif next(SMODS.find_card("j_ocs_rezzychips")) or next(SMODS.find_card("j_ocs_rezzymult")) or next(SMODS.find_card("j_ocs_rezzycash")) or next(SMODS.find_card("j_ocs_rezzyx")) or next(SMODS.find_card("j_ocs_rezzylegend")) then
            return false
        end
        return true
    end,
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
    key = "rezzycash",
    rarity = 2,
    atlas = 'rezzies',
    blueprint_compat = true,
    config = {extra = {rezzymainval = 2,rezzyminval = 2, rezzymaxval = 10}},
    pos = {x = 0, y = 1},
    cost = 4,
    remove_from_deck = function(self, card, from_debuff)
        if not from_debuff then
            G.E_MANAGER:add_event(Event({
                func = function() 
                    SMODS.add_card({
                        set = "Joker",
                        area = G.jokers,
                        key = 'j_ocs_rezzytail'
                    })
                    return true 
                end
            }))
        end
    end,
    in_pool = function(self)
        if next(SMODS.find_card("j_ring_master")) then
            return true
        elseif next(SMODS.find_card("j_ocs_rezzychips")) or next(SMODS.find_card("j_ocs_rezzymult")) or next(SMODS.find_card("j_ocs_rezzycash")) or next(SMODS.find_card("j_ocs_rezzyx")) or next(SMODS.find_card("j_ocs_rezzylegend")) then
            return false
        end
        return true
    end,
    loc_vars = rezzyloc,
    calc_dollar_bonus = function(self,card)
        local bonus = card.ability.extra.rezzymainval
        if bonus > 0 then return bonus end
    end
}

-- X Rated Rezzy
SMODS.Joker{
    key = "rezzyx",
    rarity = 3,
    atlas = 'rezzies',
    blueprint_compat = true,
    config = {extra = {rezzymainval = 11,rezzyminval = 11, rezzymaxval = 35}},
    pos = {x = 1, y = 0},
    cost = 6,
    remove_from_deck = function(self, card, from_debuff)
        if not from_debuff then
            G.E_MANAGER:add_event(Event({
                func = function() 
                    SMODS.add_card({
                        set = "Joker",
                        area = G.jokers,
                        key = 'j_ocs_rezzytail'
                    })
                    return true 
                end
            }))
        end
    end,
    in_pool = function(self)
        if next(SMODS.find_card("j_ring_master")) then
            return true
        elseif next(SMODS.find_card("j_ocs_rezzychips")) or next(SMODS.find_card("j_ocs_rezzymult")) or next(SMODS.find_card("j_ocs_rezzycash")) or next(SMODS.find_card("j_ocs_rezzyx")) or next(SMODS.find_card("j_ocs_rezzylegend")) then
            return false
        end
        return true
    end,
    loc_vars = rezzyloc,
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
    key = "rezzylegend",
    rarity = 4,
    atlas = 'rezzies',
    blueprint_compat = true,
    config = {extra = {rezzymainval = 1,rezzyminval = 1, rezzymaxval = 3}},
    pos = {x = 3, y = 0},
    cost = 10,
    soul_pos = {x = 3, y = 1 },
    remove_from_deck = function(self, card, from_debuff)
        if not from_debuff then
            G.E_MANAGER:add_event(Event({
                func = function() 
                    SMODS.add_card({
                        set = "Joker",
                        area = G.jokers,
                        key = 'j_ocs_rezzytail'
                    })
                    return true 
                end
            }))
        end
    end,
    in_pool = function(self)
        if next(SMODS.find_card("j_ring_master")) then
            return true
        elseif next(SMODS.find_card("j_ocs_rezzychips")) or next(SMODS.find_card("j_ocs_rezzymult")) or next(SMODS.find_card("j_ocs_rezzycash")) or next(SMODS.find_card("j_ocs_rezzyx")) or next(SMODS.find_card("j_ocs_rezzylegend")) then
            return false
        end
        return true
    end,
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