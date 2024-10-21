local _, SRT = ...

if GetLocale() ~= "deDE" then return end

local L = SRT.localization

L["time"] = "Zeit"
L["seconds"] = "Sekunden"
L["gold-time"] = "|T616373:0|t Goldzeit: %s Sek."
L["silver-time"] = "|T616375:0|t Silberzeit: %s Sek."
L["bronze-time"] = "|T616372:0|t Bronzezeit"
L["no-time"] = "keine Zeit verfügbar"
