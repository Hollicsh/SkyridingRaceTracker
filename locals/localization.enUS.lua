local addonName, SRT = ...

SRT.localization = setmetatable({},{__index=function(self,key)
        geterrorhandler()("Skyriding Race Tracker: Missing entry for '" .. tostring(key) .. "'")
        return key
    end})

local L = SRT.localization

L["time"] = "Time: %.1f Seconds"
L["gold-time"] = "|T616373:0|t Gold Time: %s sec"
L["silver-time"] = "|T616375:0|t Silver Time: %s sec"
L["bronze-time"] = "|T616372:0|t Bronze Time"
L["no-time"] = "no medal time available"

L["race-normal"] = "Normal"
L["race-advanced"] = "Advanced"
L["race-reverse"] = "Reverse"
L["race-challenge"] = "Challenge"
L["race-challenge-reverse"] = "Reverse Challenge"
L["race-storm-gryphon"] = "Storm Gryphon"

L["personal-best-time"] = "Personal Best Time: %s sec"
L["personal-best-time-no-race"] = "no race completed so far"
L["personal-best-time-not-available"] = "personal best time not available"
L["personal-best-time-faild"] = "new personal best time failed"

L["race-tracker"] = "Race Tracker"
L["race-tracker.name"] = "Enable Race Tracker"
L["race-tracker.tooltip"] = "Activates or deactivates the Race Tracker during the skyriding race."
L["race-tracker-mode.name"] = "Mode"
L["race-tracker-mode.tooltip"] = "Defines whether the time should be displayed as a timer or countdown during the race."
L["race-tracker-mode.value.0"] = "Timer"
L["race-tracker-mode.value.1"] = "Countdown - Medal Time"
L["race-tracker-mode.value.2"] = "Countdown - Personal Best Time"
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
