local _, SkyridingRaceTracker = ...

SkyridingRaceTracker.localization = setmetatable({},{__index=function(self,key)
        geterrorhandler()("Skyriding Race Tracker: Missing entry for '" .. tostring(key) .. "'")
        return key
    end})

local L = SkyridingRaceTracker.localization

L["time"] = "Time: %.1f Seconds"
L["gold-time"] = "|T616373:0|t Gold Time: %s sec"
L["silver-time"] = "|T616375:0|t Silver Time: %s sec"
L["bronze-time"] = "|T616372:0|t Bronze Time"
L["no-time"] = "No Medal Time Available"

L["gliding-speed"] = "Current Racing Speed: %s%%"

L["seconds-long"] = "Seconds"
L["seconds-short"] = "sec"

L["button-close"] = "Close"
L["button-zone-overview"] = "Zone Overview"

L["race-normal"] = "Normal"
L["race-advanced"] = "Advanced"
L["race-reverse"] = "Reverse"
L["race-challenge"] = "Challenge"
L["race-challenge-reverse"] = "Reverse Challenge"
L["race-storm-gryphon"] = "Storm Gryphon"

L["personal-best-time"] = "Personal Best Time: %s sec"
L["personal-best-time-no-race"] = "No Race Completed So Far"
L["personal-best-time-not-available"] = "Personal Best Time Not Available"
L["personal-best-time-failed"] = "New Personal Best Time Failed"

L["race-tracker"] = "Race Tracker"
L["race-tracker.name"] = "Enable Race Tracker"
L["race-tracker.tooltip"] = "Activates or deactivates the Race Tracker during the skyriding race."
L["race-tracker-mode.name"] = "Mode"
L["race-tracker-mode.tooltip"] = "Defines whether the time should be displayed as a timer or countdown during the race."
L["race-tracker-mode.value.0"] = "Timer"
L["race-tracker-mode.value.1"] = "Countdown - Medal Time"
L["race-tracker-mode.value.2"] = "Countdown - Personal Best Time"
L["race-tracker-gliding-speed.name"] = "Race Speed"
L["race-tracker-gliding-speed.tooltip"] = "Defines whether the race speed should be displayed during the race. This display only works for dragon- and skyrider races."
L["race-tracker-background.name"] = "Background"
L["race-tracker-background.tooltip"] = "Defines whether a background should be used for the Race Tracker."
L["race-tracker-background-type.name"] = "Background Type"
L["race-tracker-background-type.tooltip"] = "Defines which background type is to be used for the Reace Tracker."
L["race-tracker-background-type.value.0"] = "Background Type 1"
L["race-tracker-background-type.value.1"] = "Background Type 2"
L["race-tracker-horizontal-shift.name"] = "Horizontal Shift"
L["race-tracker-horizontal-shift.tooltip"] = "Defines the relative horizontal position of the Race Tracker to the centre of the screen."
L["race-tracker-vertical-shift.name"] = "Vertical Shift"
L["race-tracker-vertical-shift.tooltip"] = "Defines the relative vertical position of the Race Tracker to the centre of the screen."
L["race-tracker-fadeout-delay.name"] = "Fade-out Delay"
L["race-tracker-fadeout-delay.tooltip"] = "Defines the time after a race until the Race Tracker fades out."

L["race-time-overview"] = "Race Time Overview"
L["race-time-overview.name"] = "Enable Race Time Overview"
L["race-time-overview.tooltip"] = "Activates or deactivates the Race Time Overview next to the quest window."

L["other-options"] = "Other Options"
L["debug.name"] = "Enable Debug Mode"
L["debug.tooltip"] = "Activates or deactivates the Debug Mode."
