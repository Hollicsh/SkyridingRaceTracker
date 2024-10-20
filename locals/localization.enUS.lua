local _, SRT = ...

SRT.localization = setmetatable({},{__index=function(self,key)
        geterrorhandler()("Skyriding Race Timer: Missing entry for '" .. tostring(key) .. "'")
        return key
    end})

local L = SRT.localization

L["time"] = "Time"
L["seconds"] = "Seconds"