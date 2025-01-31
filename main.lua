-- Mod Icon
SMODS.Atlas {
  key = 'modicon',
  path = "OC-tag.png",
  px = 34,
  py = 34
}

mod_dir = ''..SMODS.current_mod.path
ocConfig = SMODS.current_mod.config

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