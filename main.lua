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
  },
  OC_textured = {
    'j_vampire',
    'j_raised_fist',
    'j_todo_list'
  }
}


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

-- Load Decks
local decks, load_error = SMODS.load_file("src/decks.lua")
if load_error or decks == nil then
  sendDebugMessage("The error is: "..load_error)
else
  decks()
end

-- Load Jokers
local ocJokers, load_error = SMODS.load_file("src/jokers.lua")
if load_error or ocJokers == nil then
  sendDebugMessage("The error is: "..load_error)
else
  ocJokers()
end

-- Load Achievements
local achievements, load_error = SMODS.load_file("src/achievements.lua")
if load_error or achievements == nil then
  sendDebugMessage("The error is: "..load_error)
else
  achievements()
end

local otherstuff, load_error = SMODS.load_file("src/otherstuff.lua")
if load_error or otherstuff == nil then
  sendDebugMessage("The error is: "..load_error)
else
  otherstuff()
end


-- REQUIRES: Malverk. Load replacement textures.
if (SMODS.Mods["malverk"] or {}).can_load then
  local malverk, load_error = SMODS.load_file("src/texture-malverk.lua")
  if load_error or malverk == nil then
    sendDebugMessage("The error is: "..load_error)
  else
    malverk()
  end
end


-- REQUIRES: CardSleeves. Load Sleeves
if (SMODS.Mods["CardSleeves"] or {}).can_load then
  local sleeves, load_error = SMODS.load_file("src/sleeves.lua")
  if load_error or sleeves == nil then
    sendDebugMessage("The error is: "..load_error)
  else
    sleeves()
  end
end
