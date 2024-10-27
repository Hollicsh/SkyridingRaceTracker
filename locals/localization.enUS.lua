local _, SRT = ...

SRT.localization = setmetatable({},{__index=function(self,key)
        geterrorhandler()("Skyriding Race Timer: Missing entry for '" .. tostring(key) .. "'")
        return key
    end})

local L = SRT.localization

L["time"] = "Time"
L["seconds"] = "Seconds"
L["gold-time"] = "|T616373:0|t Gold time: %s sec"
L["silver-time"] = "|T616375:0|t Silver time: %s sec"
L["bronze-time"] = "|T616372:0|t Bronze time"
L["no-time"] = "no race time available"

L["display-mode.name"] = "Display mode"
L["display-mode.tooltip"] = "Defines whether the time should be displayed as a timer or countdown during the race."
L["display-background.name"] = "Display background"
L["display-background.tooltip"] = "Defines whether a background should be used for the race time."
L["fadeout-delay.name"] = "Fade-out delay"
L["fadeout-delay.tooltip"] = "Determines the time after a race until the display fades out."
L["debug.name"] = "Debug mode"
L["debug.tooltip"] = "Activate or deactivate the debug mode."
