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
        if context.end_of_round == true and game_over == false then
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
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    -- We can just use SMODS.add_card to handle emplacement etc for us.
                                    SMODS.add_card({
                                        set = "Joker",
                                        area = G.jokers,
                                        key = 'j_ocs_rezzychips'
                                    })
                                    return true
                                end
                            }))
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
    config = {extra = {rezzymainval = 1,rezzyminval = 1, rezzymaxval = 100}},
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