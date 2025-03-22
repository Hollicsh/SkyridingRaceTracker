local _, SkyridingRaceTracker = ...

if GetLocale() ~= "ruRU" then return end

local L = SkyridingRaceTracker.localization

L["time"] = "Время: %.1f секунд"
L["gold-time"] = "|T616373:0|t Время на золото: %s сек."
L["silver-time"] = "|T616375:0|t Время на серебро: %s сек."
L["bronze-time"] = "|T616372:0|t Время на бронзу"
L["no-time"] = "нет времени на получение медали"

L["seconds-long"] = "Секунды"
L["seconds-short"] = "сек."

L["button-close"] = "Закрыть"
L["button-zone-overview"] = "Обзор зоны"

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

L["race-tracker"] = "Race Tracker"
L["race-tracker.name"] = "Включить Race Tracker"
L["race-tracker.tooltip"] = "Активирует или деактивирует Race Tracker во время гонки на Драконах."
L["race-tracker-mode.name"] = "Режим"
L["race-tracker-mode.tooltip"] = "Определяет, должно ли время отображаться в виде таймера или обратного отсчета во время гонки."
L["race-tracker-mode.value.0"] = "Таймер"
L["race-tracker-mode.value.1"] = "Обратный отсчет - Время медалей"
L["race-tracker-mode.value.2"] = "Обратный отсчет - Личный рекорд"
L["race-tracker-background.name"] = "Фон"
L["race-tracker-background.tooltip"] = "Определяет, следует ли использовать фон для Race Tracker."
L["race-tracker-background-type.name"] = "Тип фона"
L["race-tracker-background-type.tooltip"] = "Определяет, какой тип фона будет использоваться для Reace Tracker."
L["race-tracker-background-type.value.0"] = "Тип фона 1"
L["race-tracker-background-type.value.1"] = "Тип фона 2"
L["race-tracker-horizontal-shift.name"] = "Горизонтальное смещение"
L["race-tracker-horizontal-shift.tooltip"] = "Определяет относительное горизонтальное положение Race Tracker относительно центра экрана."
L["race-tracker-vertical-shift.name"] = "Вертикальное смещение"
L["race-tracker-vertical-shift.tooltip"] = "Определяет относительное вертикальное положение Race Tracker относительно центра экрана."
L["race-tracker-fadeout-delay.name"] = "Задержка затухания"
L["race-tracker-fadeout-delay.tooltip"] = "Определяет время после гонки, по истечении которого Race Tracker погаснет."

L["race-time-overview"] = "Обзор времени гонки"
L["race-time-overview.name"] = "Включить обзор времени гонки"
L["race-time-overview.tooltip"] = "Активирует или деактивирует обзор времени гонки рядом с окном квеста."

L["other-options"] = "Другое настройки"
L["debug.name"] = "Включить режим отладки"
L["debug.tooltip"] = "Активирует или деактивирует режим отладки."
