AltTexture({
  key = 'vampire_bat', -- the key of the texture
  set = 'Joker', -- define the object type that you are retexturing, see wiki for full list of types
  path = 'vampire.png', -- the filename of your spritesheet, saved in assets/1x AND assets/2x
  keys = {
    'j_vampire'
  },
  loc_txt = {
    name = 'Vampire Batgirl',
    text = {'The vampire is changed','into an anthro batgirl!'}
  }
})

TexturePack({
  key = 'OCs', -- the key of the texture
  textures = {'ocs_vampire_bat'}, -- a table of keys of your AltTexture objects
  loc_txt = {
    name = 'Original Cardactors',
    text = {'Replacement art','by Hellgnoll'}
  }
})