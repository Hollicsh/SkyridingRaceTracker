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
L["not-time"] = "no time available"
