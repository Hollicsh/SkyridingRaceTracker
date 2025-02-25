local addonName, skyridingRaceTracker = ...

skyridingRaceTracker.COLOR_GOLD_FONT = "ffF2E699"
skyridingRaceTracker.COLOR_SILVER_FONT = "ffC0C0C0"
skyridingRaceTracker.COLOR_BRONZE_FONT = "ffCD7F32"
skyridingRaceTracker.MEDIA_PATH = "Interface\\AddOns\\" .. addonName .. "\\media\\"

skyridingRaceTracker.addonVersion = C_AddOns.GetAddOnMetadata(addonName, "Version")
skyridingRaceTracker.difficultyOrder = {"NORMAL", "ADVANCED", "REVERSE", "CHALLENGE", "CHALLENGE_REVERSE", "STORM_GRYPHON"}

local raceDataTable = skyridingRaceTracker.raceDataTable

skyridingRaceTracker.sortedRaceDataTable = {}
local sortedRaceDataTable = skyridingRaceTracker.sortedRaceDataTable

-----------------
--- Data Sort ---
-----------------

for raceID, dataWrapper in pairs(raceDataTable) do
    local order, zoneID, modes = unpack(dataWrapper)
    table.insert(sortedRaceDataTable, {raceID = raceID, order = order, zoneID = zoneID, modes = modes})
end

table.sort(sortedRaceDataTable, function(a, b)
    return a.order < b.order
end)