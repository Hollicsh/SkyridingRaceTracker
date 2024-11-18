local _, SRT = ...

if GetLocale() ~= "deDE" then return end

local L = SRT.localization

L["time"] = "Zeit: %.1f Sekunden"
L["seconds"] = "Sekunden"
L["gold-time"] = "|T616373:0|t Goldzeit: %s Sek."
L["silver-time"] = "|T616375:0|t Silberzeit: %s Sek."
L["bronze-time"] = "|T616372:0|t Bronzezeit"
L["no-time"] = "keine Medaillenzeit abrufbar"

L["race-normal"] = "Normal"
L["race-advanced"] = "Fortgeschritten"
L["race-reverse"] = "Umgekehrt"
L["race-challenge"] = "Herausforderung"
L["race-challenge-reverse"] = "Umgekehrte Herausforderung"
L["race-storm-gryphon"] = "Sturmgreif"

L["personal-best-time"] = "persönliche Bestzeit: %s Sek."
L["personal-best-time-no-race"] = "kein Rennen bisher absolviert"
L["personal-best-time-not-available"] = "persönliche Bestzeit nicht abrufbar"
L["personal-best-time-faild"] = "neue persönliche Bestzeit verfehlt"

L["display"] = "Rennanzeige"
L["display.name"] = "'Rennanzeige' aktivieren"
L["display.tooltip"] = "Aktiviert oder deaktiviert die 'Rennanzeige' während des Himmelsreiterrennen."
L["display-mode.name"] = "Anzeigemodus"
L["display-mode.tooltip"] = "Legt fest, ob die Zeit beim Rennen als Timer oder Countdown angezeigt werden soll."
L["display-mode.value.0"] = "Timer"
L["display-mode.value.1"] = "Countdown - Medaillenzeit"
L["display-mode.value.2"] = "Countdown - persönliche Bestzeit"
L["display-horizontal-shift.name"] = "Horizontale Verschiebung der Anzeige"
L["display-horizontal-shift.tooltip"] = "Gibt die relative horizontale Position der Rennanzeige zur Bildschirmmitte an."
L["display-vertical-shift.name"] = "Vertikale Verschiebung der Anzeige"
L["display-vertical-shift.tooltip"] = "Gibt die relative vertikale Position der Rennanzeige zur Bildschirmmitte an."
L["display-background.name"] = "Anzeigehintergrund"
L["display-background.tooltip"] = "Legt fest, ob ein Hintergrund für die Rennzeit verwendet werden soll."
L["display-fadeout-delay.name"] = "Ausblendeverzögerung"
L["display-fadeout-delay.tooltip"] = "Bestimmt die Zeit nach einem Rennen, bis die Anzeige ausgeblendet wird."

L["overview"] = "Rennzeiten Übersicht"
L["overview.name"] = "'Rennzeiten Übersicht' aktivieren"
L["overview.tooltip"] = "Aktiviert oder deaktiviert die 'Rennzeiten Übersicht' neben dem Questfenster."

L["other-options"] = "sonstige Optionen"
L["debug.name"] = "'Debugmodus' aktivieren"
L["debug.tooltip"] = "Aktiviert oder deaktiviert den 'Debugmodus'."
