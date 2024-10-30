local _, SRT = ...

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

L["personal-best-time"] = "Personal Best Time: %s sec"
L["personal-best-time-no-race"] = "no race completed so far"
L["personal-best-time-not-available"] = "personal best time not available"
L["personal-best-time-faild"] = "new personal best time failed"

L["display-mode.name"] = "Display mode"
L["display-mode.tooltip"] = "Defines whether the time should be displayed as a timer or countdown during the race."
L["display-mode.value.0"] = "Timer"
L["display-mode.value.1"] = "Countdown - Medal Time"
L["display-mode.value.2"] = "Countdown - Personal Best Time"
L["display-background.name"] = "Display background"
L["display-background.tooltip"] = "Defines whether a background should be used for the race time."
L["fadeout-delay.name"] = "Fade-out delay"
L["fadeout-delay.tooltip"] = "Determines the time after a race until the display fades out."
L["debug.name"] = "Debug mode"
L["debug.tooltip"] = "Activate or deactivate the debug mode."

L["reload.popup"] = "Do you want to reload the UI to apply the change?"
