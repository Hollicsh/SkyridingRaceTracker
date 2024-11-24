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

L["race-tracker"] = "Race-Tracker"
L["race-tracker.name"] = "Race-Tracker aktivieren"
L["race-tracker.tooltip"] = "Aktiviert oder deaktiviert den Race-Tracker während des Himmelsreiterrennen."
L["race-tracker-mode.name"] = "Modus"
L["race-tracker-mode.tooltip"] = "Legt fest, ob die Zeit beim Rennen als Timer oder Countdown angezeigt werden soll."
L["race-tracker-mode.value.0"] = "Timer"
L["race-tracker-mode.value.1"] = "Countdown - Medaillenzeit"
L["race-tracker-mode.value.2"] = "Countdown - persönliche Bestzeit"
L["race-tracker-background.name"] = "Hintergrund"
L["race-tracker-background.tooltip"] = "Legt fest, ob ein Hintergrund für den Race-Tracker verwendet werden soll."
L["race-tracker-background-type.name"] = "Hintergrundvariante"
L["race-tracker-background-type.tooltip"] = "Legt fest, welche Hintergrundvariante für den Race-Tracker verwendet werden soll."
L["race-tracker-background-type.value.0"] = "Hintergrundvariante 1"
L["race-tracker-background-type.value.1"] = "Hintergrundvariante 2"
L["race-tracker-horizontal-shift.name"] = "Horizontale Verschiebung"
L["race-tracker-horizontal-shift.tooltip"] = "Gibt die relative horizontale Position des Race-Tracker zur Bildschirmmitte an."
L["race-tracker-vertical-shift.name"] = "Vertikale Verschiebung"
L["race-tracker-vertical-shift.tooltip"] = "Gibt die relative vertikale Position des Race-Tracker zur Bildschirmmitte an."
L["race-tracker-fadeout-delay.name"] = "Ausblendeverzögerung"
L["race-tracker-fadeout-delay.tooltip"] = "Bestimmt die Zeit nach einem Rennen, bis der Race-Tracker ausgeblendet wird."

L["race-time-overview"] = "Rennzeitenübersicht"
L["race-time-overview.name"] = "Rennzeitenübersicht aktivieren"
L["race-time-overview.tooltip"] = "Aktiviert oder deaktiviert die Rennzeitenübersicht neben dem Questfenster."

L["other-options"] = "sonstige Optionen"
L["debug.name"] = "Debugmodus aktivieren"
L["debug.tooltip"] = "Aktiviert oder deaktiviert den Debugmodus."
