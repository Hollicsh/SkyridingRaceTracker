local addonName, skyridingRaceTracker = ...

local L = skyridingRaceTracker.localization

function skyridingRaceTracker:LoadOptions()
    if (not SkyridingRaceTracker_Options_v2) then
        SkyridingRaceTracker_Options_v2 = {}
    end

    self.options = SkyridingRaceTracker_Options_v2

    local variableTable = self.options
    local category, layout = Settings.RegisterVerticalLayoutCategory("Skyriding Race Tracker")
    category.ID = "Skyriding Race Tracker"

    local parentSettingBackground

    layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(L["race-tracker"]))

    do
        local name = L["race-tracker.name"]
        local tooltip = L["race-tracker.tooltip"]
        local variable = "race-tracker"
        local defaultValue = true

        local setting = Settings.RegisterAddOnSetting(category, addonName .. "_" .. variable, variable, variableTable, Settings.VarType.Boolean, name, defaultValue)
        Settings.CreateCheckbox(category, setting, tooltip)
    end

    do
        local name = L["race-tracker-mode.name"]
        local tooltip = L["race-tracker-mode.tooltip"]
        local variable = "race-tracker-mode"
        local defaultValue = 0

        local function GetOptions()
            local container = Settings.CreateControlTextContainer()
            container:Add(0, L["race-tracker-mode.value.0"])
            container:Add(1, L["race-tracker-mode.value.1"])
            container:Add(2, L["race-tracker-mode.value.2"])
            return container:GetData()
        end

        local setting = Settings.RegisterAddOnSetting(category, addonName .. "_" .. variable, variable, variableTable, Settings.VarType.Number, name, defaultValue)
        Settings.CreateDropdown(category, setting, GetOptions, tooltip)
    end

    do
        local name = L["race-tracker-gliding-speed.name"]
        local tooltip = L["race-tracker-gliding-speed.tooltip"]
        local variable = "race-tracker-gliding-speed"
        local defaultValue = false

        local setting = Settings.RegisterAddOnSetting(category, addonName .. "_" .. variable, variable, variableTable, Settings.VarType.Boolean, name, defaultValue)
        Settings.CreateCheckbox(category, setting, tooltip)
    end

    do
        local name = L["race-tracker-background.name"]
        local tooltip = L["race-tracker-background.tooltip"]
        local variable = "race-tracker-background"
        local defaultValue = true

        local setting = Settings.RegisterAddOnSetting(category, variable, variable, variableTable, Settings.VarType.Boolean, name, defaultValue)
        parentSettingBackground = Settings.CreateCheckbox(category, setting, tooltip)
    end

    do
        local name = L["race-tracker-background-type.name"]
        local tooltip = L["race-tracker-background-type.tooltip"]
        local variable = "race-tracker-background-type"
        local defaultValue = 0

        local function GetOptions()
            local container = Settings.CreateControlTextContainer()
            container:Add(0, L["race-tracker-background-type.value.0"], "|T" .. skyridingRaceTracker.MEDIA_PATH .. "raceTrackerBackground-01.blp:16:64|t")
            container:Add(1, L["race-tracker-background-type.value.1"], "|T" .. skyridingRaceTracker.MEDIA_PATH .. "raceTrackerBackground-02.blp:16:64|t")
            return container:GetData()
        end

        local setting = Settings.RegisterAddOnSetting(category, addonName .. "_" .. variable, variable, variableTable, Settings.VarType.Number, name, defaultValue)
        local subSetting = Settings.CreateDropdown(category, setting, GetOptions, tooltip)

        subSetting:SetParentInitializer(parentSettingBackground, function() return self.options["race-tracker-background"] end)
    end

    do
        local name = L["race-tracker-horizontal-shift.name"]
        local tooltip = L["race-tracker-horizontal-shift.tooltip"]
        local variable = "race-tracker-horizontal-shift"
        local defaultValue = 0

        local minValue = -500
        local maxValue = 500
        local step = 10

        local setting = Settings.RegisterAddOnSetting(category, addonName .. "_" .. variable, variable, variableTable, Settings.VarType.Number, name, defaultValue)
        local options = Settings.CreateSliderOptions(minValue, maxValue, step)

        options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right)
        Settings.CreateSlider(category, setting, options, tooltip)
    end

    do
        local name = L["race-tracker-vertical-shift.name"]
        local tooltip = L["race-tracker-vertical-shift.tooltip"]
        local variable = "race-tracker-vertical-shift"
        local defaultValue = 200

        local minValue = -400
        local maxValue = 400
        local step = 10

        local setting = Settings.RegisterAddOnSetting(category, addonName .. "_" .. variable, variable, variableTable, Settings.VarType.Number, name, defaultValue)
        local options = Settings.CreateSliderOptions(minValue, maxValue, step)

        options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right)
        Settings.CreateSlider(category, setting, options, tooltip)
    end

    do
        local name = L["race-tracker-fadeout-delay.name"]
        local tooltip = L["race-tracker-fadeout-delay.tooltip"]
        local variable = "race-tracker-fadeout-delay"
        local defaultValue = 3

        local minValue = 1
        local maxValue = 10
        local step = 1

        local setting = Settings.RegisterAddOnSetting(category, addonName .. "_" .. variable, variable, variableTable, Settings.VarType.Number, name, defaultValue)
        local options = Settings.CreateSliderOptions(minValue, maxValue, step)

        options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right)
        Settings.CreateSlider(category, setting, options, tooltip)
    end

    layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(L["race-time-overview"]))

    do
        local name = L["race-time-overview.name"]
        local tooltip = L["race-time-overview.tooltip"]
        local variable = "race-time-overview"
        local defaultValue = true

        local setting = Settings.RegisterAddOnSetting(category, addonName .. "_" .. variable, variable, variableTable, Settings.VarType.Boolean, name, defaultValue)
        Settings.CreateCheckbox(category, setting, tooltip)
    end

    layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(L["other-options"]))

    do
        local name = L["debug.name"]
        local tooltip = L["debug.tooltip"]
        local variable = "debug"
        local defaultValue = false

        local setting = Settings.RegisterAddOnSetting(category, addonName .. "_" .. variable, variable, variableTable, Settings.VarType.Boolean, name, defaultValue)
        Settings.CreateCheckbox(category, setting, tooltip)
    end

    Settings.RegisterAddOnCategory(category)
end
