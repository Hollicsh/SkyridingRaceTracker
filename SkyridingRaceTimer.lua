local _, SRT = ...

SRT.raceTimer = {}
SRT.timerFrame = {}

local L = SRT.localization
local raceTimeTable = SRT.data.raceTimeTable

local raceQuestId = 0
local raceGoldTime = 0
local raceSilverTime = 0

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

local function CheckRaceQuest(questId)
    local t = raceTimeTable[questId]

    if t == nil then
        return false
    else
        SRT:PrintDebug("Race quest found: " .. C_QuestLog.GetTitleForQuestID(questId) .. " (" .. questId ..")")

        return true
    end
end

---------------------
--- Main funtions ---
---------------------

local frame = CreateFrame("Frame")

function frame:OnEvent(event, ...)
	self[event](self, event, ...)
end

function frame:ADDON_LOADED(_, addOnName)
    if addOnName == "SkyridingRaceTimer" then
        SRT:LoadOptions()
        SRT:LoadTimerFrame()

        SRT:PrintDebug("Addon fully loaded.")
    end
end

function frame:UNIT_AURA(_, unitTarget, updateInfo)
    if unitTarget == "player" then
        if CheckRaceAura() then
            if not isRaceActive then
                isRaceActive = true
                SRT:StartRaceTimer(raceQuestId, GetTime(), raceGoldTime, raceSilverTime)
            end
        else
            if isRaceActive then
                isRaceActive = false
                SRT:HideRaceTimer()
            end
        end
    end
end

function frame:QUEST_ACCEPTED(_, questId)
    if CheckRaceQuest(questId) then
        raceQuestId = questId
        raceGoldTime = raceTimeTable[raceQuestId][1]
        raceSilverTime = raceTimeTable[raceQuestId][2]
        SRT:ShowRaceTimer(raceQuestId, raceGoldTime)
    end
end

function frame:QUEST_REMOVED(_, questId, wasReplayQuest)
    if CheckRaceQuest(questId) then
        raceQuestId = 0
        raceGoldTime = 0
        raceSilverTime = 0
    end
end

frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("UNIT_AURA")
frame:RegisterEvent("QUEST_ACCEPTED")
frame:RegisterEvent("QUEST_REMOVED")
frame:SetScript("OnEvent", frame.OnEvent)
