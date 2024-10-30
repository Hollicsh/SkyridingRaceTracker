local _, SRT = ...

if GetLocale() ~= "deDE" then return end

local L = SRT.localization

L["time"] = "Zeit: %.1f Sekunden"
L["seconds"] = "Sekunden"
L["gold-time"] = "|T616373:0|t Goldzeit: %s Sek."
L["silver-time"] = "|T616375:0|t Silberzeit: %s Sek."
L["bronze-time"] = "|T616372:0|t Bronzezeit"
L["no-time"] = "keine Medaillenzeit verfügbar"

L["personal-best-time"] = "persönliche Bestzeit: %s Sek."
L["personal-best-time-no-race"] = "kein Rennen bisher absolviert"
L["personal-best-time-not-available"] = "persönliche Bestzeit nicht abrufbar"
L["personal-best-time-faild"] = "neue persönliche Bestzeit verfehlt"

L["display-mode.name"] = "Anzeigemodus"
L["display-mode.tooltip"] = "Legt fest, ob die Zeit beim Rennen als Timer oder Countdown angezeigt werden soll."
L["display-mode.value.0"] = "Timer"
L["display-mode.value.1"] = "Countdown - Medaillenzeit"
L["display-mode.value.2"] = "Countdown - persönliche Bestzeit"
L["display-background.name"] = "Anzeigehintergrund"
L["display-background.tooltip"] = "Legt fest, ob ein Hintergrund für die Rennzeit verwendet werden soll."
L["fadeout-delay.name"] = "Ausblendeverzögerung"
L["fadeout-delay.tooltip"] = "Bestimmt die Zeit nach einem Rennen bis die Anzeige ausgeblendet wird."
L["debug.name"] = "Debugmodus"
L["debug.tooltip"] = "Aktiviere oder deaktiviere den Debugmodus."

L["reload.popup"] = "Möchtest du die Benutzeroberfläche neu laden, um die Änderung anzuwenden?"