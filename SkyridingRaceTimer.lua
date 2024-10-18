-- Frame erstellen, um Events zu überwachen
local frame = CreateFrame("Frame")

-- Variablen, um die Startzeit zu speichern und den Timer anzuzeigen
local raceStartTime = nil
local isRaceActive = false
local timerFrame = nil

-- Zauber-ID des Flugrennens (muss korrekt angepasst werden)
local raceSpellId = 369968  -- Beispiel-Zauber-ID, anpassen an das Flugrennen

-- Funktion, um den Timer anzuzeigen
local function ShowRaceTime()
    if not timerFrame then
        -- Einfaches Textfeld erstellen, um die Zeit anzuzeigen
        timerFrame = CreateFrame("Frame", nil, UIParent)
        timerFrame:SetSize(200, 50)
        timerFrame:SetPoint("CENTER", 0, 200)

        local timerText = timerFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
        timerText:SetPoint("CENTER", 0, 0)
        timerFrame.timerText = timerText
    end

    -- Aktualisiere den Timertext basierend auf der verstrichenen Zeit
    local elapsedTime = GetTime() - raceStartTime
    timerFrame.timerText:SetText(string.format("Zeit: %.1f Sekunden", elapsedTime))

    -- Zeige das Frame an
    timerFrame:Show()
end

-- Funktion, um den Timer zu verstecken, wenn das Rennen endet
local function HideRaceTime()
    if timerFrame then
        timerFrame:Hide()
    end
end

-- Funktion, um zu überprüfen, ob der Spieler die Renn-Aura hat
local function CheckRaceAura()
    -- Durchläuft alle Buffs auf dem Spieler und sucht nach dem spezifischen Renn-Buff

	for i = 1, 40 do
        local aura = C_UnitAuras.GetAuraDataByIndex("player", i)
        if aura == nil then
            break  -- Wenn kein Buff vorhanden ist, breche die Schleife ab
        end

        -- Überprüfe, ob der Renn-Buff aktiv ist
        if aura.spellId == raceSpellId then
            return true
        end
    end

    return false
end

-- Event-Handler-Funktion, um auf UNIT_AURA zu reagieren
local function OnEvent(self, event, unit)
    if unit == "player" then

        if CheckRaceAura() then
            if not isRaceActive then
                -- Rennen beginnt
                raceStartTime = GetTime()
                isRaceActive = true
                ShowRaceTime()
            end
        else

            if isRaceActive then
                -- Rennen endet
                isRaceActive = false
                --HideRaceTime()
            end
        end
    end
end

-- Event-Handler registrieren
frame:RegisterEvent("UNIT_AURA")

-- Event-Handler mit dem Frame verknüpfen
frame:SetScript("OnEvent", OnEvent)

-- Timer regelmäßig aktualisieren, wenn das Rennen läuft
frame:SetScript("OnUpdate", function(self, elapsed)
    if isRaceActive then
        ShowRaceTime()
    end
end)

