BALIATRO.Image {
	key = "graceful-shine",
	path = "graceful-shine.png",
}

SMODS.Shader {
	key = "graceful",
	path = "graceful.fs",
    send_vars = function (sprite, card)
        return {
            overlay = BALIATRO.Images['ocs_graceful-shine'].image
        }
    end,
}

SMODS.Edition {
	key = "graceful",
	shader = "graceful",
	in_shop = false,
	config = {
		extra = {
			fresh = true,
			score_mod = { "chips", "mult", "xmult", "dollars" },
			score_mod_min = {
				chips = -5,
				mult = -1,
				xmult = 0.8,
				dollars = -2,
			},
			score_mod_max = {
				chips = 30,
				mult = 10,
				xmult = 2.0,
				dollars = 5,
			},
		},
	},
	loc_vars = function(self, info_queue, card)
		e = card.ability.config.extra.fresh and G.localization.misc.dictionary.e_waiting or G.localization.misc.dictionary.e_ready
		return {
			vars = {
				e,
				colours = {
					G.C.UI.TEXT_INACTIVE
				}
			}
		}
	end,
	on_apply = function(card)
		if not card.ability then card.ability = {} end
		if not card.ability.config then card.ability.config = {} end
		if not card.ability.config.extra then card.ability.config.extra = {} end
		card.ability.config.extra.fresh = true
	end,
	calculate = function(self, card, context)
		function spread(area, c)
			if c.ability and c.ability.config and c.ability.config.extra and c.ability.config.extra.fresh then return end
			i = UTIL.indexOf(area, c)
			if i == nil then return end
			if i > 1 and (i - 1) >= 1 then
				if UTIL.E.GetEditionFromCard(area[i-1]) ~= "ocs_graceful" then
					area[i-1]:set_edition("e_ocs_graceful")
				end
			end
			if i < #area and (i + 1) <= #area then
				if UTIL.E.GetEditionFromCard(area[i+1]) ~= "ocs_graceful" then
					area[i+1]:set_edition("e_ocs_graceful")
				end
			end
		end

		if context.destroy_card and context.cardarea == G.play then
			spread(G.hand.cards, card)
		end

		if context.final_scoring_step and context.cardarea == G.jokers then
			spread(context.cardarea.cards, card)
		end

		if context.after and card.ability and card.ability.config and card.ability.config.extra and card.ability.config.extra.fresh then
			card.ability.config.extra.fresh = false
		end

		-- Scoring
		if context.joker_main or context.main_scoring then
			score_mod_chosen = pseudorandom_element(self.config.extra.score_mod, pseudoseed("graceful"))
			score_mod_amount = pseudorandom(pseudoseed("graceful"), self.config.extra.score_mod_min[score_mod_chosen], self.config.extra.score_mod_max[score_mod_chosen])
			if score_mod_chosen == "chips"   then return { chips   = score_mod_amount } end
			if score_mod_chosen == "mult"    then return { mult    = score_mod_amount } end
			if score_mod_chosen == "xmult"   then return { xmult   = score_mod_amount } end
			if score_mod_chosen == "dollars" then return { dollars = score_mod_amount } end
		end
	end,
}