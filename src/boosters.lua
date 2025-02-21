SMODS.Atlas {
	key = "oc_booster",
	px = 71,
	py = 95,
	path = "OC-booster.png"
}

SMODS.Booster({
	key = "actors",
	loc_txt = {
        name = "Characters Pack",
        group_name = "Characters Pack",
        text = {
            "Choose {C:attention}#1#{} of {C:attention}#2#{} OCs",
        }
    },
	atlas = "oc_booster",
	pos = { x = 0, y = 0 },
    -- weight = 1,
    config = { extra = 4, choose = 1 },
    -- group_key = 'original_characters',
    -- kind = "ocs_pack",
    create_card = function(self, card, i)
        local cardlist = get_usable_oc_cards()
        return {set = "Joker", area = G.jokers, key = pseudorandom_element(cardlist, pseudoseed("ocspack")),  skip_materialize = true}
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.config.center.config.choose, card.ability.extra } }
    end,
	ease_background_colour = function(self)
		ease_colour(G.C.DYN_UI.MAIN, globals.OC_colors.pink)
		ease_background_colour({ new_colour = globals.OC_colors.pink, special_colour = globals.OC_colors.black, contrast = 4 })
	end
})

SMODS.Sound({
  key = "music_OCs",
  path = "music-OCs.ogg",
  select_music_track = function()
    return (
      G.pack_cards and G.pack_cards.cards and SMODS.OPENED_BOOSTER and SMODS.OPENED_BOOSTER.config.center.key == "p_ocs_actors"
    )
  end,
  volume = 1.3,
  pitch = 1.3
})