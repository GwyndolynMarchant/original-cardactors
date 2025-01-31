SMODS.Atlas {
    -- Key for code to find it with
    key = "ocjokers",
    -- The name of the file, for the code to pull the atlas from
    path = "oc-jokers.png",
    -- Width of each sprite in 1x size
    px = 71,
    -- Height of each sprite in 1x size
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
    -- This text needs to be replaced with localization stuff
    loc_txt = {
      name = 'Billie\'s blunder',
      text = {
        [1] = '{C:green}#1# in #2#{} chance to upgrade played {C:attention}High Card{}',
        [2] = 'Odds increase by {C:attention}#3#{} each hand, and',
        [3] = 'reset at success or end of round.'
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
    calculate = function(self, card, context)      
      if context.before and context.scoring_name == "High Card" then 
        if pseudorandom("billiesblunder") < card.ability.extra.current_odds / card.ability.extra.odds then
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

