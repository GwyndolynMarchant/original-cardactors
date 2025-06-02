-- Mod Icon
SMODS.Atlas {
  key = 'modicon',
  path = "OC-tag.png",
  px = 34,
  py = 34
}

mod_dir = ''..SMODS.current_mod.path
ocConfig = SMODS.current_mod.config

-- Global lists necessary for module interoperability
globals = {
  OC_jokers = {
    'j_ocs_billiesblunder',
    'j_ocs_geniusjunebug',
    'j_ocs_rezzytail',
    'j_ocs_rezzychips',
    'j_ocs_rezzymult',
    'j_ocs_rezzycash',
    'j_ocs_rezzyx',
    'j_ocs_rezzylegend',
    'j_ocs_sybilthroat',
    'j_ocs_robomoof'
  },
  OC_textured = {
    'j_vampire',
    'j_raised_fist',
    'j_todo_list',
    'j_ring_master'
  },
  OC_colors = {
    pink = HEX('D500B8'),
    black = HEX('000000')
  }
}

function loadModule(module)
  -- Load Decks
  local modFunction, load_error = SMODS.load_file(module)
  if load_error or modFunction == nil then
    sendDebugMessage("The error is: "..load_error)
  else
    modFunction()
  end
end

function get_usable_oc_cards()
  local _joker_list = {}
  for k, v in pairs(globals.OC_jokers) do
    if v ~= 'j_ocs_rezzyx' and v ~= 'j_ocs_rezzylegend' then
      table.insert(_joker_list, v)
    end
  end
  for k, v in pairs(globals.OC_textured) do
    table.insert(_joker_list, v)
  end
  return _joker_list
end


-- Required libraries
loadModule("lib/baliatro.lua") -- Image loading for shaders
loadModule("lib/util.lua") -- Generic functions

-- Main mod modules
loadModule("src/decks.lua") -- Load Decks
loadModule("src/jokers.lua") -- Load Jokers
loadModule("src/achievements.lua") -- Load Achievements
loadModule("src/boosters.lua") -- Load Boosters
loadModule("src/vouchers.lua") -- Load Vouchers
loadModule("src/editions.lua") -- Load Editions
loadModule("src/spectrals.lua") -- Load Spectrals

-- REQUIRES: Malverk. Load replacement textures.
if (SMODS.Mods["malverk"] or {}).can_load then
  loadModule("src/texture-malverk.lua")
end

-- REQUIRES: CardSleeves. Load Sleeves
if (SMODS.Mods["CardSleeves"] or {}).can_load then
  loadModule("src/sleeves.lua")
end
