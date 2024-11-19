local addonName, SRT = ...

local L = SRT.localization
local raceDataTable = SRT.raceDataTable

local raceQuestID = -1
local raceGoldTime = -1
local raceSilverTime = -1
local racePersonalTime = -1

local isRaceActive = false

----------------------
--- Local funtions ---
----------------------

local function CheckRaceAura()
	for i = 1, 40 do
        local aura = C_UnitAuras.GetAuraDataByIndex("player", i)
        if aura == nil then
            break
        end

        if aura.spellId == 369968 then
            return true
        end
    end

    return false
end

local function CheckRaceQuest(questID)
    for _, modes in pairs(raceDataTable) do
        for mode, data in pairs(modes) do
            if data[1] == questID then
                return true
            end
        end
    end

    return false
end

local function GetRaceData(questID)
    for _, modes in pairs(raceDataTable) do
        for mode, data in pairs(modes) do
            if data[1] == questID then
                return {
                    mode = mode,
                    questID = data[1],
                    raceTime = data[2],
                    goldTime = data[3],
                    silverTime = data[4]
                }
            end
        end
    end

    return nil
end

--------------
--- Frames ---
--------------

local skyridingRaceTrackerFrame = CreateFrame("Frame", "SkyridingRaceTracker")

---------------------
--- Main funtions ---
---------------------

function skyridingRaceTrackerFrame:OnEvent(event, ...)
	self[event](self, event, ...)
end

function skyridingRaceTrackerFrame:ADDON_LOADED(_, addOnName)
    if addOnName == addonName then
        SRT:LoadOptions()
        SRT:PrintDebug("Addon fully loaded.")
    end
end

function skyridingRaceTrackerFrame:UNIT_AURA(_, unitTarget, updateInfo)
    if unitTarget == "player" then
        if SRT.options["race-tracker"] and CheckRaceAura() then
            if not isRaceActive then
                isRaceActive = true
                SRT:StartRaceTracker(raceQuestID, GetTime(), raceGoldTime, raceSilverTime, racePersonalTime)
            end
        else
            if isRaceActive then
                isRaceActive = false
                SRT:HideRaceTracker()
            end
        end
    end
end

function skyridingRaceTrackerFrame:QUEST_ACCEPTED(_, questID)
    local result = GetRaceData(questID)

    if result ~= nil then
        SRT:PrintDebug("Event 'QUEST_ACCEPTED' fired. Payload: " .. C_QuestLog.GetTitleForQuestID(questID) .. " (" .. questID ..")")

        if SRT.options["race-tracker"] then
            raceQuestID = result.questID
            raceGoldTime = result.goldTime
            raceSilverTime = result.silverTime

            if result.raceTime ~= 0 then
                racePersonalTime = C_CurrencyInfo.GetCurrencyInfo(result.raceTime).quantity / 1000
            end

            SRT:ShowRaceTracker(raceQuestID, raceGoldTime, racePersonalTime)
        else
            SRT:PrintDebug("No race tracker requested.")
        end
    end
end

function skyridingRaceTrackerFrame:QUEST_REMOVED(_, questID, wasReplayQuest)
    if CheckRaceQuest(questID) then
        SRT:PrintDebug("Event 'QUEST_REMOVED' fired. Payload: " .. C_QuestLog.GetTitleForQuestID(questID) .. " (" .. questID ..")")
        raceQuestID = -1
        raceGoldTime = -1
        raceSilverTime = -1
        racePersonalTime = -1
    end
end

GossipFrame:HookScript("OnShow",function()
    if UnitExists("target") and SRT.options["race-time-overview"] then
		local npcID = select(6, strsplit("-", tostring(UnitGUID("target"))))
        npcID = tonumber(npcID)

        SRT:PrintDebug("npcID: " .. npcID)

        if raceDataTable[npcID] ~= nil then
            SRT:ShowRaceTimeOverview(npcID)
        end
    end
end)

GossipFrame:HookScript("OnHide",function()
    SRT:HideRaceTimeOverview()
end)

skyridingRaceTrackerFrame:RegisterEvent("ADDON_LOADED")
skyridingRaceTrackerFrame:RegisterEvent("UNIT_AURA")
skyridingRaceTrackerFrame:RegisterEvent("QUEST_ACCEPTED")
skyridingRaceTrackerFrame:RegisterEvent("QUEST_REMOVED")
skyridingRaceTrackerFrame:SetScript("OnEvent", skyridingRaceTrackerFrame.OnEvent)
