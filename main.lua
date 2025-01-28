--Load Sprites file
local malverk, load_error = SMODS.load_file("src/texture-malverk.lua")
if load_error then
  sendDebugMessage ("The error is: "..load_error)
else
  malverk()
end
