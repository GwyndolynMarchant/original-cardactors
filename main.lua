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
OCS = {
  J = {
    AllJokers = {},
    Rezzies = {},
    Moofs = {},
    Aliens = {},
    Malverk = {},
    Booster = {},
    Deck = {}
  },
  Color = {
    pink = HEX('D500B8'),
    black = HEX('000000')
  },
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

-- Required libraries
loadModule("lib/baliatro.lua") -- Image loading for shaders
loadModule("lib/util.lua") -- Generic functions

-- Main mod modules
loadModule("src/jokers.lua") -- Load Jokers, FIRST
loadModule("src/decks.lua") -- Load Decks
loadModule("src/achievements.lua") -- Load Achievements
loadModule("src/boosters.lua") -- Load Boosters
loadModule("src/vouchers.lua") -- Load Vouchers
loadModule("src/editions.lua") -- Load Editions
loadModule("src/spectrals.lua") -- Load Spectrals

-- REQUIRES: Malverk. Load replacement textures.
if (SMODS.Mods["malverk"] or {}).can_load then
  loadModule("src/texture-malverk.lua")
end

-- REQUIRES: CardSleeves. Load Sleeves, AFTER Decks
if (SMODS.Mods["CardSleeves"] or {}).can_load then
  loadModule("src/sleeves.lua")
end
