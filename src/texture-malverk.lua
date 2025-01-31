AltTexture({
  key = 'vampire_bat',
  set = 'Joker',
  path = 'vampire.png',
  keys = { 'j_vampire' },
})

-- TODO: Cannot get this working right now. Eremel says the code looks right...
-- AltTexture({
--   key = 'smol_blind',
--   set = 'Blind',
--   path = 'smol_blind.png',
--   frames = 21,
--   keys = { 'bl_small' },
--   loc_txt = {
--     name = 'Smol Blind',
--     text = {'The blind is smol','uwu'}
--   }
-- })

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

TexturePack({
  key = 'OCs',
  textures = {
    'ocs_vampire_bat',
    -- 'ocs_smol_blind', -- TODO: Broken
    'ocs_billie_fist',
    'ocs_todo_hyena'
  },
  localization = true
})