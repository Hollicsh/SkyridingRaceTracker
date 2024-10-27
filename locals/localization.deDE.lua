local _, SRT = ...

if GetLocale() ~= "deDE" then return end

local L = SRT.localization

L["time"] = "Zeit"
L["seconds"] = "Sekunden"
L["gold-time"] = "|T616373:0|t Goldzeit: %s Sek."
L["silver-time"] = "|T616375:0|t Silberzeit: %s Sek."
L["bronze-time"] = "|T616372:0|t Bronzezeit"
L["no-time"] = "keine Rennzeit verfügbar"

L["display-mode.name"] = "Anzeigemodus"
L["display-mode.tooltip"] = "Legt fest, ob die Zeit beim Rennen als Timer oder Countdown angezeigt werden soll."
L["display-background.name"] = "Anzeigehintergrund"
L["display-background.tooltip"] = "Legt fest, ob ein Hintergrund für die Rennzeit verwendet werden soll."
L["fadeout-delay.name"] = "Ausblendeverzögerung"
L["fadeout-delay.tooltip"] = "Bestimmt die Zeit nach einem Rennen bis die Anzeige ausgeblendet wird."
L["debug.name"] = "Debugmodus"
L["debug.tooltip"] = "Aktiviere oder deaktiviere den Debugmodus."