local addonName, SRT = ...

SRT.localization = setmetatable({},{__index=function(self,key)
        geterrorhandler()("Skyriding Race Timer: Missing entry for '" .. tostring(key) .. "'")
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

L["display"] = "Race Display"
L["display.name"] = "Enable 'Race Display'"
L["display.tooltip"] = "Activates or deactivates the 'Race Display' during the skyriding race."
L["display-mode.name"] = "Display Mode"
L["display-mode.tooltip"] = "Defines whether the time should be displayed as a timer or countdown during the race."
L["display-mode.value.0"] = "Timer"
L["display-mode.value.1"] = "Countdown - Medal Time"
L["display-mode.value.2"] = "Countdown - Personal Best Time"
L["display-background.name"] = "Display Background"
L["display-background.tooltip"] = "Defines whether a background should be used for the race time."
L["display-horizontal-shift.name"] = "Horizontal Shift of the Display"
L["display-horizontal-shift.tooltip"] = "Defines the relative horizontal position of the race display to the centre of the screen."
L["display-vertical-shift.name"] = "Vertical Shift of the Display"
L["display-vertical-shift.tooltip"] = "Defines the relative vertical position of the race display to the centre of the screen."
L["display-fadeout-delay.name"] = "Fade-out Delay"
L["display-fadeout-delay.tooltip"] = "Defines the time after a race until the display fades out."

L["overview"] = "Race Time Overview"
L["overview.name"] = "Enable 'Race Time Overview'"
L["overview.tooltip"] = "Activates or deactivates the 'Race Time Overview' next to the quest window."

L["other-options"] = "Other Options"
L["debug.name"] = "Enable 'Debug Mode'"
L["debug.tooltip"] = "Activates or deactivates the 'Debug Mode'."
