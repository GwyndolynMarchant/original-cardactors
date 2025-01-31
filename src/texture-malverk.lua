AltTexture({
  key = 'vampire_bat',
  set = 'Joker',
  path = 'vampire.png',
  keys = { 'j_vampire' },
  loc_txt = {
    name = 'Vampire - Batgirl',
    text = {'The vampire is changed','into an anthro batgirl!'}
  }
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
  loc_txt = {
    name = 'Raised Fist - Bilie Hellgnoll',
    text = {'The raised fist now','belongs to Billie Hellgnoll!'}
  }
})

AltTexture({
  key = 'todo_hyena',
  set = 'Joker',
  path = 'todo-hyena.png',
  keys = { 'j_todo_list' },
  loc_text = {
    name = 'To-do List - Hyena',
    text = {'The to-do list spells out','HYENA now'}
  }
})

TexturePack({
  key = 'OCs',
  textures = {
    'ocs_vampire_bat',
    -- 'ocs_smol_blind', -- TODO: Broken
    'ocs_billie_fist',
    'ocs_todo_hyena'
  },
  loc_txt = {
    name = 'Original Cardactors',
    text = {'Replacement art','by Hellgnoll'}
  }
})