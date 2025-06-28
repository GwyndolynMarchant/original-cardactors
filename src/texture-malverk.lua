SMODS.ObjectType {
  key = "retextured",
  default = "j_raised_fist",
  cards = {
    "j_vampire",
    "j_raised_fist",
    "j_todo_list",
    "j_ring_master",
  }
}

AltTexture({
  key = 'vampire_bat',
  set = 'Joker',
  path = 'vampire.png',
  keys = { 'j_vampire' },
})

AltTexture({
  key = 'smol_blind',
  set = 'Blind',
  path = 'smol_blind.png',
  frames = 21,
  keys = { 'bl_small' },
})

AltTexture({
  key = 'billie_fist',
  set = 'Joker',
  path = 'billie-fist.png',
  keys = { 'j_raised_fist' },
})

AltTexture({
  key = 'todo_hyena',
  set = 'Joker',
  path = 'todo-hyena.png',
  keys = { 'j_todo_list' },
})

AltTexture({
  key = 'showgirl',
  set = 'Joker',
  path = 'showgirl.png',
  keys = { 'j_ring_master' },
})

AltTexture({
  key = 'suricrasia',
  set = 'Planet',
  path = 'suricrasia.png',
  keys = { 'c_eris' }
})

Malverk.badges.distant_planet = function(self, card, badges)
  badges[#badges + 1] = create_badge(localize('k_distant_planet'), G.C.SECONDARY_SET.Planet, nil, 1.2)
end

TexturePack({
  key = 'OCs',
  textures = {
    'ocs_vampire_bat',
    'ocs_smol_blind',
    'ocs_billie_fist',
    'ocs_todo_hyena',
    'ocs_showgirl',
    'ocs_suricrasia'
  },
  localization = true
})