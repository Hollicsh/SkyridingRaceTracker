local _, SRT = ...

if GetLocale() ~= "ruRU" then return end

local L = SRT.localization

-- Generel

L["addon.name"] = "Skyriding Race Tracker"
L["addon.version"] = "Version"

-- Addon specific

L["time"] = "Время: %.1f секунд"
L["gold-time"] = "|T616373:0|t Время на золото: %s сек."
L["silver-time"] = "|T616375:0|t Время на серебро: %s сек."
L["bronze-time"] = "|T616372:0|t Время на бронзу"
L["no-time"] = "нет времени на получение медали"

L["gliding-speed"] = "Текущая скорость гонки: %s%%"

L["seconds-long"] = "Секунды"
L["seconds-short"] = "сек."

L["button.close"] = "Закрыть"
L["button.zone-overview"] = "Обзор зоны"

L["title.zone-overview"] = "Zone Overview"

L["race-normal"] = "Обычный маршрут"
L["race-advanced"] = "Продвинутый маршрут"
L["race-reverse"] = "Обратный маршрут"
L["race-challenge"] = "Испытание"
L["race-challenge-reverse"] = "Испытание обратным маршрутом"
L["race-storm-gryphon"] = "Грифон бури"

L["personal-best-time"] = "Личное лучшее время: %s сек."
L["personal-best-time-no-race"] = "ни одна гонка пока не завершена"
L["personal-best-time-not-available"] = "личный рекорд недоступен"
L["personal-best-time-failed"] = "новый личный рекорд неудачный"

-- Options

L["info.description"] = "Description"
L["info.description.text"] = "The Skyriding Race Tracker is an addon to display the current race time during a skyriding race (Race Tracker) and provide an overview of all race times (Race Time Overview).\n\nThis addon is compatible with all race types such as dragonriding, skyriding, skyrocketing and breakneck (D.R.I.V.E.).\n\nIf you find a bug or have questions about the addon, you can contact me via Github or Curseforge. You can also help me with the translation via these two platforms. Thank you."

L["info.help"] = "Help"
L["info.help.text"] = "In case of problems after an update or if you want to, you can reset the options here."
L["info.help.reset-button.name"] = "Reset Options"
L["info.help.reset-button.desc"] = "Resets the options to the default values. This applies to all characters."
L["info.help.github-button.name"] = "Github"
L["info.help.github-button.desc"] = "Opens a popup window with a link to Github."
L["info.help.curseforge-button.name"] = "Curseforge"
L["info.help.curseforge-button.desc"] = "Opens a popup window with a link to Curseforge."

L["info.about"] = "About"
L["info.about.text"] = "|cffF2E699Game version:|r %s\n|cffF2E699Addon version:|r %s\n\n|cffF2E699Author:|r %s"

L["options"] = "Options"
L["options.general"] = "General Options"

L["options.race-tracker"] = "Race Tracker"
L["options.race-tracker.name"] = "Включить Race Tracker"
L["options.race-tracker.tooltip"] = "Активирует или деактивирует Race Tracker во время гонки на Драконах."
L["options.race-tracker-mode.name"] = "Режим"
L["options.race-tracker-mode.tooltip"] = "Определяет, должно ли время отображаться в виде таймера или обратного отсчета во время гонки."
L["options.race-tracker-mode.value.0"] = "Таймер"
L["options.race-tracker-mode.value.1"] = "Обратный отсчет - Время медалей"
L["options.race-tracker-mode.value.2"] = "Обратный отсчет - Личный рекорд"
L["options.race-tracker-gliding-speed.name"] = "Скорость гонки"
L["options.race-tracker-gliding-speed.tooltip"] = "Определяет, должна ли отображаться скорость гонки во время полёта. Это работает только для гонок на драконах и скайрайдерах."
L["options.race-tracker-background.name"] = "Фон"
L["options.race-tracker-background.tooltip"] = "Определяет, следует ли использовать фон для Race Tracker."
L["options.race-tracker-background-type.name"] = "Тип фона"
L["options.race-tracker-background-type.tooltip"] = "Определяет, какой тип фона будет использоваться для Reace Tracker."
L["options.race-tracker-background-type.value.0"] = "Тип фона 1"
L["options.race-tracker-background-type.value.1"] = "Тип фона 2"
L["options.race-tracker-horizontal-shift.name"] = "Горизонтальное смещение"
L["options.race-tracker-horizontal-shift.tooltip"] = "Определяет относительное горизонтальное положение Race Tracker относительно центра экрана."
L["options.race-tracker-vertical-shift.name"] = "Вертикальное смещение"
L["options.race-tracker-vertical-shift.tooltip"] = "Определяет относительное вертикальное положение Race Tracker относительно центра экрана."
L["options.race-tracker-fadeout-delay.name"] = "Задержка затухания"
L["options.race-tracker-fadeout-delay.tooltip"] = "Определяет время после гонки, по истечении которого Race Tracker погаснет."

L["options.race-time-overview"] = "Обзор времени гонки"
L["options.race-time-overview.name"] = "Включить обзор времени гонки"
L["options.race-time-overview.tooltip"] = "Активирует или деактивирует обзор времени гонки рядом с окном квеста."

L["options.other"] = "Other Options"
L["options.debug-mode.name"] = "Debug Mode"
L["options.debug-mode.tooltip"] = "Enabling the debug mode displays additional information in the chat."

-- Chat

L["chat.reset-options.success"] = "Options successfully reseted."

-- Dialog

L["dialog.copy-address.text"] = "To copy the link press CTRL + C."
L["dialog.reset-options.text"] = "Do you really want to reset the options?"
