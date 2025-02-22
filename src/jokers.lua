SMODS.Atlas {
    key = "ocjokers", -- Standalone OC jokers
    path = "oc-jokers.png",
    px = 71,
    py = 95
}

SMODS.Joker {
    
    key = 'billiesblunder',
    config = {
        extra = {
            odds = 4,
            current_odds = 0,
        }
    },

    -- Note that in the tet #1# is the first variable here, #2# is the second, etc
    loc_vars = function(self, info_queue, card)
      return { vars = { card.ability.extra.current_odds, card.ability.extra.odds,''..(G.GAME and G.GAME.probabilities.normal or 1) } }
    end,
    rarity = 2,
    atlas = 'ocjokers',
    pos = { x = 0, y = 0 },
    cost = 4,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    calculate = function(self, card, context)      
      if context.before and context.scoring_name == "High Card" then 
        if pseudorandom(pseudoseed("billiesblunder")) < card.ability.extra.current_odds / card.ability.extra.odds then
            if not context.blueprint then
                card.ability.extra.current_odds = 0
            end
            return {
                card = card,
                level_up = true,
                message = "I can't stop winning!"
              }
        elseif not context.blueprint then
            card.ability.extra.current_odds = card.ability.extra.current_odds + G.GAME.probabilities.normal
            return {
                message = "Just one more...",
                colour = G.C.GREEN,
                card = card
              }
        end
      end
      if context.end_of_round and not context.repetition and context.game_over == false and not context.blueprint then
        card.ability.extra.current_odds = 0
        return {
            card = card,
            message = "Reset"
          }
      end
    end

}

SMODS.Atlas {
    key = 'junebug', -- June, Balatro Genius alternates
    path = "junebug.png",
    px = 71,
    py = 95
}

SMODS.Joker{

    key = 'geniusjunebug',
    config = {
        extra = {
            xmult_mod = .25,
        }
    },

    loc_txt = {
      name = 'June, Balatro Genius',
      text = {
        [1] = "Gives {X:mult,C:white} X#1# {} Mult.",
        [2] = "Increased by {X:mult,C:white} X#2# {} for the",
        [3] = 'highest stake June has defeated.'
      }
    },

    loc_vars = function(self, info_queue, card)
      return { vars = { (get_joker_win_sticker(self,true) + 1) * (card.ability.extra.xmult_mod) + 1, card.ability.extra.xmult_mod} }
    end,

    rarity = 2,
    atlas = 'junebug',
    pos = { x = 0, y = 0 }, -- TODO: Dynamically change X based on stake beaten
    cost = 5,
    eternal_compat = true,
    perishable_compat = true,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.joker_main then
            local xmult = (get_joker_win_sticker(self,true) + 1) * (card.ability.extra.xmult_mod) + 1
            return {
                mult_mod = xmult,
                message = localize { type = 'variable', key = 'a_mult', vars = { xmult } }
            }
        end
    end
}

SMODS.Atlas {
    key = 'rezzies', -- June, Balatro Genius alternates
    path = "rezzies.png",
    px = 71,
    py = 95
}


SMODS.Joker{
    key = "rezzytail",
    rarity = 1,
    atlas = 'rezzies',
    blueprint_compat = false,
    pos = {x = 1, y = 1},
    cost = 0,
    loc_txt = {
      name = 'Rezzy Tail',
      text = {
        [1] = "Regenerates into a random Rezzy",
        [2] = "with random values at end of round"
      }
    },
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


SMODS.Joker{
    key = "rezzychips",
    rarity = 1,
    atlas = 'rezzies',
    blueprint_compat = true,
    config = {extra = {rezzymainval = 10,rezzyminval = 10, rezzymaxval = 100}},
    pos = {x = 0, y = 0},
    cost = 3,
    loc_txt = {
      name = 'Chippy Rezzy',
      text = {
        [1] = "{C:chips}+#1#{} chips.",
        [2] = "Generates a Tail when ",
        [3] = 'destroyed or sold'
      }
    },
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
        if next(SMODS.find_card("showman")) then
            return true
        elseif next(SMODS.find_card("rezzychips")) or next(SMODS.find_card("rezzymult")) or next(SMODS.find_card("rezzycash")) or next(SMODS.find_card("rezzyx")) or next(SMODS.find_card("rezzylegend")) then
            return false
        end
        return true
    end,
    loc_vars = function(self, info_queue, card)
      return { vars = {card.ability.extra.rezzymainval} }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = card.ability.extra.rezzymainval
            }
        end
    end
}

SMODS.Joker{
    key = "rezzymult",
    rarity = 1,
    atlas = 'rezzies',
    blueprint_compat = true,
    config = {extra = {rezzymainval = 4,rezzyminval = 4, rezzymaxval = 20}},
    pos = {x = 2, y = 0},
    cost = 3,
    loc_txt = {
      name = 'Rhythm Rezzy',
      text = {
        [1] = "{C:mult}+#1#{} mult.",
        [2] = "Generates a Tail when ",
        [3] = 'destroyed or sold'
      }
    },
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
        if next(SMODS.find_card("showman")) then
            return true
        elseif next(SMODS.find_card("rezzychips")) or next(SMODS.find_card("rezzymult")) or next(SMODS.find_card("rezzycash")) or next(SMODS.find_card("rezzyx")) or next(SMODS.find_card("rezzylegend")) then
            return false
        end
        return true
    end,
    loc_vars = function(self, info_queue, card)
      return { vars = {card.ability.extra.rezzymainval} }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.rezzymainval
            }
        end
    end
}

SMODS.Joker{
    key = "rezzycash",
    rarity = 2,
    atlas = 'rezzies',
    blueprint_compat = true,
    config = {extra = {rezzymainval = 2,rezzyminval = 2, rezzymaxval = 10}},
    pos = {x = 0, y = 1},
    cost = 4,
    loc_txt = {
      name = 'Ritzy Rezzy',
      text = {
        [1] = "Earn {C:money}+#1#{} at",
        [2] = "end of round.",
        [3] = "Generates a Tail when ",
        [4] = 'destroyed or sold'
      }
    },
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
        if next(SMODS.find_card("showman")) then
            return true
        elseif next(SMODS.find_card("rezzychips")) or next(SMODS.find_card("rezzymult")) or next(SMODS.find_card("rezzycash")) or next(SMODS.find_card("rezzyx")) or next(SMODS.find_card("rezzylegend")) then
            return false
        end
        return true
    end,
    loc_vars = function(self, info_queue, card)
      return { vars = {card.ability.extra.rezzymainval} }
    end,
    calc_dollar_bonus = function(self,card)
        local bonus = card.ability.extra.rezzymainval
        if bonus > 0 then return bonus end
    end
}

SMODS.Joker{
    key = "rezzyx",
    rarity = 3,
    atlas = 'rezzies',
    blueprint_compat = true,
    config = {extra = {rezzymainval = 11,rezzyminval = 11, rezzymaxval = 35}},
    pos = {x = 1, y = 0},
    cost = 6,
    loc_txt = {
      name = 'X Rated Rezzy',
      text = {
        [1] = "{X:mult,C:white} X#1# {} Mult",
        [2] = "Generates a Tail when ",
        [3] = 'destroyed or sold'
      }
    },
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
        if next(SMODS.find_card("showman")) then
            return true
        elseif next(SMODS.find_card("rezzychips")) or next(SMODS.find_card("rezzymult")) or next(SMODS.find_card("rezzycash")) or next(SMODS.find_card("rezzyx")) or next(SMODS.find_card("rezzylegend")) then
            return false
        end
        return true
    end,
    loc_vars = function(self, info_queue, card)
      return { vars = {card.ability.extra.rezzymainval * 0.1} }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.rezzymainval * .1
            }
        end
    end
}

SMODS.Joker{
    key = "rezzylegend",
    rarity = 4,
    atlas = 'rezzies',
    blueprint_compat = true,
    config = {extra = {rezzymainval = 1,rezzyminval = 1, rezzymaxval = 3}},
    pos = {x = 3, y = 0},
    cost = 10,
    soul_pos = {x = 3, y = 1 },
    loc_txt = {
      name = 'Rezzy of Legend',
      text = {
        [1] = "Retrigger all played cards {C:chips}+#1#{} times.",
        [2] = "Generates a Tail when ",
        [3] = 'destroyed or sold'
      }
    },
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
        if next(SMODS.find_card("showman")) then
            return true
        elseif next(SMODS.find_card("rezzychips")) or next(SMODS.find_card("rezzymult")) or next(SMODS.find_card("rezzycash")) or next(SMODS.find_card("rezzyx")) or next(SMODS.find_card("rezzylegend")) then
            return false
        end
        return true
    end,
    loc_vars = function(self, info_queue, card)
      return { vars = {card.ability.extra.rezzymainval} }
    end,
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
