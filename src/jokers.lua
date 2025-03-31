SMODS.Atlas {
    key = "ocjokers", -- Standalone OC jokers
    path = "oc-jokers.png",
    px = 71,
    py = 95
}

-- Billie's Blunder
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

-- June, Balatro Genius
SMODS.Joker{
    key = 'geniusjunebug',
    config = {
        extra = {
            xmult_mod = .25,
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

loadModule("src/jokers/rezzies.lua")

SMODS.Joker{
    key = "sybilthroat",
    rarity = 3,
    atlas = 'ocjokers',
    blueprint_compat = false,
    config = { extra = { capcard = nil } },
    pos = {x = 1, y = 0},
    cost = 9,
    loc_vars = function(self, info_queue, card)
        if card.ability.extra.capcard == nil then
            return {
                vars = {
                    "None yet... ",
                    colours = {
                        G.C.UI.TEXT_INACTIVE
                    }
                }
            }
        else
            -- Get capture details
            local cap = card.ability.extra.capcard
            local edition     = cap.edition and cap.edition.type or "Default"
            local enhancement = cap.ability and cap.ability.name or "Default Base"

            -- Load localization names
            local a = edition     ~= "Default"      and G.localization.descriptions.Edition["e_" .. edition].name        .. " " or ""
            local b = enhancement ~= "Default Base" and G.localization.descriptions.Enhanced[cap.config.center.key].name .. " " or ""
            local z = cap.seal and " with " .. G.localization.descriptions.Other[string.lower(cap.seal) .. "_seal"].name or ""
            return {
                vars = {
                    a .. b .. G.localization.misc.ranks[cap.base.value] .. ' of ' .. G.localization.misc.suits_plural[cap.base.suit] .. z,
                    colours = {
                        G.C.SUITS[cap.base.suit]
                    }
                },
            }
        end
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if #G.play.cards == 1 then

                -- Copy the card
                card.ability.extra.capcard = {
                    edition = context.other_card.edition, -- Edition
                    base = {
                        suit = context.other_card.base.suit, -- Suit
                        value = context.other_card.base.value -- Rank
                    },
                    seal = context.other_card.seal, -- Seal

                    -- Enhancements
                    ability = copy_table(context.other_card.ability),
                    config = {
                        center = context.other_card.config.center
                    }
                }

                -- Destroy the captured card
                context.other_card:explode({G.C.GREEN})

                return {
                    message = "Captured!"
                }
            elseif card.ability.extra.capcard then
                -- Edition
                context.other_card:set_edition(card.ability.extra.capcard.edition)

                -- Seal
                context.other_card:set_seal(card.ability.extra.capcard.seal)

                -- Rank and Suit
                SMODS.change_base(context.other_card, card.ability.extra.capcard.base.suit, card.ability.extra.capcard.base.value)

                -- Enhancements 
                context.other_card:set_ability(card.ability.extra.capcard.config.center)
                context.other_card.ability.type = card.ability.extra.capcard.ability.type
                for k, v in pairs(card.ability.extra.capcard.ability) do
                    if type(v) == 'table' then 
                        context.other_card.ability[k] = copy_table(v)
                    else
                        context.other_card.ability[k] = v
                    end
                end

                -- Emphasize the changes
                context.other_card:juice_up()

                return {
                    message = "TF!"
                }
            end
        end 
    end
}

SMODS.Joker{
    key = "robomoof",
    rarity = 1,
    atlas = 'ocjokers',
    blueprint_compat = false,
    pos = {x = 2, y = 0},
    cost = 3
}