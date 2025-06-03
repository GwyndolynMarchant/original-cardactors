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

TexturePack({
  key = 'OCs',
  textures = {
    'ocs_vampire_bat',
    'ocs_smol_blind',
    'ocs_billie_fist',
    'ocs_todo_hyena',
    'ocs_showgirl'
  },
  localization = true
})

-- Adding to index
OCS.J.Malverk = {
  'j_vampire',
  'j_raised_fist',
  'j_todo_list',
  'j_ring_master'
}