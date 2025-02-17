local addonName, skyridingRaceTracker = ...

skyridingRaceTracker.COLOR_GOLD_FONT = "ffF2E699"
skyridingRaceTracker.COLOR_SILVER_FONT = "ffC0C0C0"
skyridingRaceTracker.COLOR_BRONZE_FONT = "ffCD7F32"
skyridingRaceTracker.MEDIA_PATH = "Interface\\AddOns\\" .. addonName .. "\\media\\"

skyridingRaceTracker.addonVersion = C_AddOns.GetAddOnMetadata(addonName, "Version")
skyridingRaceTracker.difficultyOrder = {"NORMAL", "ADVANCED", "REVERSE", "CHALLENGE", "CHALLENGE_REVERSE", "STORM_GRYPHON"}

skyridingRaceTracker.raceDataTable = {}
local raceDataTable = skyridingRaceTracker.raceDataTable

skyridingRaceTracker.sortedRaceDataTable = {}
local sortedRaceDataTable = skyridingRaceTracker.sortedRaceDataTable

-- Dragonflight
-- The Waking Shores Z1 (Die Küste des Erwachens)
-- Ruby Lifeshrine Loop R1 (Rubinlebensschrein-Schleife) - R-11.0.5
raceDataTable[190123] = {
    100101, 2022, {
        NORMAL            = {66679, 2042, 373495, 53, 56},
        ADVANCED          = {66692, 2044, 373578, 52, 57},
        REVERSE           = {72052, 2154, 392228, 50, 55},
        CHALLENGE         = {75776, 2421, 409713, 54, 57},
        CHALLENGE_REVERSE = {75777, 2422, 409738, 57, 60},
        STORM_GRYPHON     = {77777, 2664, 420742, 65, 70} -- !!!
    }
}
-- Wild Preserve Slalom R2 (Wildreservat-Slalom) - R-11.0.5
raceDataTable[190473] = {
    100102, 2022, {
        NORMAL            = {66721, 2048, 374088, 42, 45},
        ADVANCED          = {66722, 2049, 374091, 40, 45},
        REVERSE           = {72705, 2176, 396710, 41, 46},
        CHALLENGE         = {75778, 2423, 409758, 48, 51},
        CHALLENGE_REVERSE = {75779, 2424, 409759, 49, 52}
    }
}
-- Emberflow Flight R3 (Glutstrom-Flug) - R-11.0.5
raceDataTable[190519] = {
    100103, 2022, {
        NORMAL            = {66727, 2052, 374182, 50, 53},
        ADVANCED          = {66728, 2053, 374183, 44, 49},
        REVERSE           = {72707, 2177, 396714, 45, 50},
        CHALLENGE         = {75780, 2425, 409760, 50, 53},
        CHALLENGE_REVERSE = {75781, 2426, 409761, 51, 54}
    }
}
-- Apex Canopy River Run R4 (Flusslauf des Hohen Blätterdachs) - R-11.0.7
raceDataTable[190551] = {
    100104, 2022, {
        NORMAL            = {66732, 2054, 374244, 52, 55},
        ADVANCED          = {66733, 2055, 374246, 45, 50},
        REVERSE           = {72734, 2178, 396934, 48, 53},
        CHALLENGE         = {75782, 2427, 409762, 53, 56},
        CHALLENGE_REVERSE = {75783, 2428, 409763, 53, 56}
    }
}
-- Uktulut Coaster R5 (Uktuluter Küstenachter) - R-11.0.7
raceDataTable[190667] = {
    100105, 2022, {
        NORMAL            = {66777, 2056, 374412, 45, 48},
        ADVANCED          = {66778, 2057, 374414, 40, 45},
        REVERSE           = {72739, 2179, 396943, 43, 48},
        CHALLENGE         = {75785, 2429, 409766, 46, 49},
        CHALLENGE_REVERSE = {75786, 2430, 409768, 48, 51}
    }
}
-- Wingrest Roundabout R6 (Schwingenrastkreisel) - R-11.0.5
raceDataTable[190753] = {
    100106, 2022, {
        NORMAL            = {66786, 2058, 374592, 53, 56},
        ADVANCED          = {66787, 2059, 374593, 53, 58},
        REVERSE           = {72740, 2180, 396960, 56, 61},
        CHALLENGE         = {75787, 2431, 409774, 60, 63},
        CHALLENGE_REVERSE = {75788, 2432, 409775, 60, 63}
    }
}
-- Flashfrost Flyover R7 (Blitzfrost-Überflug) - R-11.0.5
raceDataTable[190326] = {
    100107, 2022, {
        NORMAL            = {66710, 2046, 373851, 63, 66},
        ADVANCED          = {66712, 2047, 373857, 61, 66},
        REVERSE           = {72700, 2181, 396688, 60, 65},
        CHALLENGE         = {75789, 2433, 409778, 64, 67},
        CHALLENGE_REVERSE = {75790, 2434, 409780, 69, 74}
    }
}
-- Wild Preserve Circuit R8 (Wildreservat-Parcours) - R-11.0.7
raceDataTable[190503] = {
    100108, 2022, {
        NORMAL            = {66725, 2050, 374143, 40, 43},
        ADVANCED          = {66726, 2051, 374144, 38, 43},
        REVERSE           = {72706, 2182, 396712, 41, 46},
        CHALLENGE         = {75791, 2435, 409782, 43, 46},
        CHALLENGE_REVERSE = {75792, 2436, 409783, 44, 47}
    }
}

-- Ohn'ahran Plains Z2 (Ebenen von Ohn'ahra)
-- Sundapple Copse Circuit R1 (Sonnentüpfelhainstrecke)
raceDataTable[190928] = {
    100201, 2023, {
        NORMAL            = {66835, 2060, 000000, 49, 52},
        ADVANCED          = {66836, 2061, 000000, 41, 46},
        REVERSE           = {72801, 2183, 000000, 45, 50},
        CHALLENGE         = {75793, 2437, 000000, 51, 54},
        CHALLENGE_REVERSE = {75794, 2439, 000000, 50, 53}
    }
}
-- Fen Flythrough R2 (Moor-Durchflug) - R-11.0.5
raceDataTable[191121] = {
    100202, 2023, {
        NORMAL            = {66877, 2062, 000000, 48, 51},
        ADVANCED          = {66878, 2063, 000000, 41, 46},
        REVERSE           = {72802, 2184, 000000, 47, 52},
        CHALLENGE         = {75795, 2440, 000000, 50, 53},
        CHALLENGE_REVERSE = {75796, 2441, 000000, 50, 53},
        STORM_GRYPHON     = {77785, 2665, 000000, 82, 87} -- !!!
    }
}
-- Ravine River Run R3 (Schluchtflusslauf)
raceDataTable[191165] = {
    100203, 2023, {
        NORMAL            = {66880, 2064, 000000, 49, 52},
        ADVANCED          = {66681, 2065, 000000, 47, 52},
        REVERSE           = {72803, 2185, 000000, 46, 51},
        CHALLENGE         = {75797, 2442, 000000, 50, 53},
        CHALLENGE_REVERSE = {75798, 2443, 000000, 51, 54}
    }
}
-- Emerald Garden Ascent R4 (Smaragdgärtenaufstieg)
raceDataTable[191247] = {
    100204, 2023, {
        NORMAL            = {66885, 2066, 000000, 63, 66},
        ADVANCED          = {66886, 2067, 000000, 55, 60},
        REVERSE           = {72805, 2186, 000000, 57, 62},
        CHALLENGE         = {75799, 2444, 000000, 66, 69},
        CHALLENGE_REVERSE = {75800, 2445, 000000, 66, 69}
    }
}
-- Maruukai Dash R5 (Maruukaispurt) - R-11.0.5
raceDataTable[191422] = {
    100205, 2023, {
        NORMAL            = {66921, 2069, 000000, 25, 28},
        CHALLENGE         = {75801, 2446, 000000, 24, 27}
    }
}
-- Mirror of the Sky Dash R6 (Spurt zum Spiegel des Himmels) - R-11.0.5
raceDataTable[191511] = {
    100206, 2023, {
        NORMAL            = {66933, 2070, 000000, 26, 29},
        CHALLENGE         = {75802, 2447, 000000, 27, 30}
    }
}
-- River Rapids Route R7 (Stromschnellenstrecke)
raceDataTable[196092] = {
    100207, 2023, {
        NORMAL            = {70710, 2119, 000000, 48, 51},
        ADVANCED          = {70711, 2120, 000000, 43, 48},
        REVERSE           = {72807, 2187, 000000, 44, 49},
        CHALLENGE         = {75803, 2448, 000000, 52, 55},
        CHALLENGE_REVERSE = {75804, 2449, 000000, 52, 55}
    }
}

-- Azure Span Z3 (Das Azurblaue Gebirge)
-- Azure Span Sprint R1 (Sprint des Azurblauen Gebirges)
raceDataTable[191572] = {
    100301, 2024, {
        NORMAL            = {66946, 2074, 000000, 63, 66},
        ADVANCED          = {66947, 2075, 000000, 58, 63},
        REVERSE           = {72796, 2188, 000000, 60, 65},
        CHALLENGE         = {75805, 2450, 000000, 67, 70},
        CHALLENGE_REVERSE = {75806, 2451, 000000, 69, 72}
    }
}
-- Azure Span Slalom R2 (Slalom des Azurblauen Gebirges)
raceDataTable[191947] = {
    100302, 2024, {
        NORMAL            = {67002, 2076, 000000, 58, 61},
        ADVANCED          = {67003, 2077, 000000, 56, 61},
        REVERSE           = {72799, 2189, 000000, 53, 58},
        CHALLENGE         = {75807, 2452, 000000, 55, 58},
        CHALLENGE_REVERSE = {75808, 2453, 000000, 55, 58}
    }
}
-- Vakthros Ascent R3 (Vakthrosaufstieg) - R-11.0.5
raceDataTable[192115] = {
    100303, 2024, {
        NORMAL            = {67031, 2078, 000000, 58, 61},
        ADVANCED          = {67032, 2079, 000000, 56, 61},
        REVERSE           = {72794, 2190, 000000, 56, 61},
        CHALLENGE         = {75809, 2454, 000000, 63, 66},
        CHALLENGE_REVERSE = {75810, 2455, 000000, 64, 67},
        STORM_GRYPHON     = {77786, 2666, 000000, 120, 125} -- !!!
    }
}
-- Iskaara Tour R4 (Iskaara-Tour)
raceDataTable[192886] = {
    100304, 2024, {
        NORMAL            = {67296, 2083, 000000, 75, 78},
        ADVANCED          = {67297, 2084, 000000, 70, 75},
        REVERSE           = {72800, 2191, 000000, 67, 72},
        CHALLENGE         = {75811, 2456, 000000, 78, 81},
        CHALLENGE_REVERSE = {75812, 2457, 000000, 79, 82}
    }
}
-- Frostland Flyover R5 (Frostland-Überflug)
raceDataTable[192945] = {
    100305, 2024, {
        NORMAL            = {67565, 2085, 000000, 76, 79},
        ADVANCED          = {67566, 2086, 000000, 72, 77},
        REVERSE           = {72795, 2192, 000000, 69, 74},
        CHALLENGE         = {75813, 2458, 000000, 85, 88},
        CHALLENGE_REVERSE = {75815, 2459, 000000, 83, 86}
    }
}
-- Archive Ambit R6 (Archivring)
raceDataTable[193027] = {
    100306, 2024, {
        NORMAL            = {67741, 2089, 000000, 91, 94},
        ADVANCED          = {67742, 2090, 000000, 81, 86},
        REVERSE           = {72797, 2193, 000000, 76, 81},
        CHALLENGE         = {75816, 2460, 000000, 90, 93},
        CHALLENGE_REVERSE = {75817, 2461, 000000, 92, 95}
    }
}

-- Thaldraszus Z4 (Thaldraszus)
-- Flowing Forest Flight R1 (Flug des Wallenden Walds)
raceDataTable[192555] = {
    100401, 2025, {
        NORMAL            = {67095, 2080, 000000, 49, 52},
        ADVANCED          = {67096, 2081, 000000, 40, 45},
        REVERSE           = {72793, 2194, 000000, 41, 46},
        CHALLENGE         = {75820, 2462, 000000, 47, 50},
        CHALLENGE_REVERSE = {75821, 2463, 000000, 46, 49}
    }
}
-- Tyrhold Trial R2 (Tyrhold-Tournee) - R-11.0.5
raceDataTable[193651] = {
    100402, 2025, {
        NORMAL            = {69957, 2092, 000000, 81, 84},
        ADVANCED          = {69958, 2093, 000000, 75, 80},
        REVERSE           = {72792, 2195, 000000, 59, 64},
        CHALLENGE         = {75822, 2464, 000000, 58, 61},
        CHALLENGE_REVERSE = {75823, 2465, 000000, 63, 66},
        STORM_GRYPHON     = {77784, 2667, 000000, 80, 85} -- !!!
    }
}
-- Cliffside Circuit R3 (Klippenrundstrecke) - R-11.0.5
raceDataTable[193911] = {
    100403, 2025, {
        NORMAL            = {70051, 2096, 382632, 69, 72},
        ADVANCED          = {70052, 2097, 382652, 66, 71},
        REVERSE           = {72760, 2196, 396997, 69, 74},
        CHALLENGE         = {75824, 2466, 409861, 81, 84},
        CHALLENGE_REVERSE = {75825, 2467, 409862, 80, 83}
    }
}
-- Academy Ascent R4 (Akademieaufstieg)
raceDataTable[193951] = {
    100404, 2025, {
        NORMAL            = {70059, 2098, 000000, 54, 57},
        ADVANCED          = {70060, 2099, 000000, 52, 57},
        REVERSE           = {72754, 2197, 000000, 53, 58},
        CHALLENGE         = {75826, 2468, 000000, 65, 68},
        CHALLENGE_REVERSE = {75827, 2469, 000000, 65, 68}
    }
}
-- Garden Gallivant R5 (Gartenpromenade)
raceDataTable[194348] = {
    100405, 2025, {
        NORMAL            = {70157, 2101, 000000, 61, 64},
        ADVANCED          = {70158, 2102, 000000, 54, 59},
        REVERSE           = {72769, 2198, 000000, 57, 62},
        CHALLENGE         = {75784, 2470, 000000, 60, 63},
        CHALLENGE_REVERSE = {75828, 2471, 000000, 64, 67}
    }
}
-- Caverns Criss-Cross R6 (Kreuz und quer durch die Höhlen)
raceDataTable[194372] = {
    100406, 2025, {
        NORMAL            = {70161, 2103, 000000, 50, 53},
        ADVANCED          = {70163, 2104, 000000, 45, 50},
        REVERSE           = {72750, 2199, 000000, 47, 52},
        CHALLENGE         = {75829, 2472, 000000, 56, 59},
        CHALLENGE_REVERSE = {75830, 2473, 000000, 54, 57}
    }
}

-- Forbidden Reach Z5 (Die Verbotene Insel)
-- Stormsunder Crater Circuit R1 (Sturmrisskrater-Rundflug) - R-11.0.5
raceDataTable[200183] = {
    100501, 2151, {
        NORMAL            = {73017, 2201, 000000, 43, 46},
        ADVANCED          = {73018, 2207, 000000, 42, 47},
        REVERSE           = {73019, 2213, 000000, 42, 47},
        CHALLENGE         = {75954, 2474, 000000, 45, 48},
        CHALLENGE_REVERSE = {75955, 2475, 000000, 44, 47},
        STORM_GRYPHON     = {77787, 2668, 000000, 92, 97} -- !!!
    }
}
-- Morqut Ascent R2 (Morqutaufstieg)
raceDataTable[200212] = {
    100502, 2151, {
        NORMAL            = {73020, 2202, 000000, 52, 55},
        ADVANCED          = {73023, 2208, 000000, 49, 54},
        REVERSE           = {73024, 2214, 000000, 52, 57},
        CHALLENGE         = {75956, 2476, 000000, 50, 53},
        CHALLENGE_REVERSE = {75957, 2477, 000000, 50, 53}
    }
}
-- Aerie Chasm Cruise R3 (Nistklufttour)
raceDataTable[200236] = {
    100503, 2151, {
        NORMAL            = {73025, 2203, 000000, 53, 56},
        ADVANCED          = {73027, 2209, 000000, 50, 55},
        REVERSE           = {73028, 2215, 000000, 50, 55},
        CHALLENGE         = {75958, 2478, 000000, 53, 56},
        CHALLENGE_REVERSE = {75959, 2479, 000000, 52, 55}
    }
}
-- Southern Reach Route R4 (Südinselroute)
raceDataTable[200247] = {
    100504, 2151, {
        NORMAL            = {73029, 2204, 000000, 70, 73},
        ADVANCED          = {73030, 2210, 000000, 68, 73},
        REVERSE           = {73032, 2216, 000000, 63, 68},
        CHALLENGE         = {75960, 2480, 000000, 70, 63},
        CHALLENGE_REVERSE = {75961, 2481, 000000, 68, 71}
    }
}
-- Caldera Coaster R5 (Kalderakurven)
raceDataTable[200316] = {
    100505, 2151, {
        NORMAL            = {73033, 2205, 000000, 58, 61},
        ADVANCED          = {73034, 2211, 000000, 52, 57},
        REVERSE           = {73052, 2217, 000000, 49, 54},
        CHALLENGE         = {75962, 2482, 000000, 55, 58},
        CHALLENGE_REVERSE = {75963, 2483, 000000, 53, 56}
    }
}
-- Forbidden Reach Rush R6 (Verbotene-Insel-Eile)
raceDataTable[200417] = {
    100506, 2151, {
        NORMAL            = {73061, 2206, 000000, 59, 62},
        ADVANCED          = {73062, 2212, 000000, 56, 61},
        REVERSE           = {73065, 2218, 000000, 57, 62}, -- xxx
        CHALLENGE         = {75964, 2484, 000000, 60, 63},
        CHALLENGE_REVERSE = {75965, 2485, 000000, 60, 63}
    }
}

-- Zaralek Cavern Z6 (Zaralekhöhle)
-- Crystal Circuit R1 (Kristallkreisel) - R-11.0.5
raceDataTable[202524] = {
    100601, 2133, {
        NORMAL            = {74839, 2246, 000000, 63, 68},
        ADVANCED          = {74842, 2252, 000000, 55, 60},
        REVERSE           = {74882, 2258, 000000, 53, 58},
        CHALLENGE         = {75972, 2486, 000000, 57, 60},
        CHALLENGE_REVERSE = {75973, 2487, 000000, 58, 61},
        STORM_GRYPHON     = {77793, 2669, 000000, 95, 100} -- !!!
    }
}
-- Caldera Cruise R2 (Kalderarundflug)
raceDataTable[202676] = {
    100602, 2133, {
        NORMAL            = {74889, 2247, 000000, 75, 80},
        ADVANCED          = {74899, 2253, 000000, 68, 73},
        REVERSE           = {74925, 2259, 000000, 68, 73},
        CHALLENGE         = {75974, 2488, 000000, 72, 75},
        CHALLENGE_REVERSE = {75975, 2489, 000000, 72, 75}
    }
}
-- Brimstone Scramble R3 (Schwefelhast)
raceDataTable[202749] = {
    100603, 2133, {
        NORMAL            = {74939, 2248, 000000, 69, 72},
        ADVANCED          = {74943, 2254, 000000, 64, 69},
        REVERSE           = {74944, 2260, 000000, 64, 69},
        CHALLENGE         = {75976, 2490, 000000, 69, 72},
        CHALLENGE_REVERSE = {75977, 2491, 000000, 71, 74}
    }
}
-- Shimmering Slalom R4 (Schimmerslalom)
raceDataTable[202772] = {
    100604, 2133, {
        NORMAL            = {74951, 2249, 000000, 75, 80},
        ADVANCED          = {74954, 2255, 000000, 70, 75},
        REVERSE           = {74956, 2261, 000000, 70, 75},
        CHALLENGE         = {75978, 2492, 000000, 79, 82},
        CHALLENGE_REVERSE = {75979, 2493, 000000, 75, 78}
    }
}
-- Loamm Roamm R5 (Loamm-Jagd)
raceDataTable[202795] = {
    100605, 2133, {
        NORMAL            = {74972, 2250, 000000, 55, 60},
        ADVANCED          = {74975, 2256, 000000, 50, 55},
        REVERSE           = {74977, 2262, 000000, 48, 53},
        CHALLENGE         = {75980, 2494, 000000, 53, 56},
        CHALLENGE_REVERSE = {75981, 2495, 000000, 52, 55}
    }
}
-- Sulfur Sprint R6 (Schwefelsprint)
raceDataTable[202973] = {
    100606, 2133, {
        NORMAL            = {75035, 2251, 000000, 64, 67},
        ADVANCED          = {75042, 2257, 000000, 58, 63},
        REVERSE           = {75043, 2263, 000000, 57, 62},
        CHALLENGE         = {75982, 2496, 000000, 67, 70},
        CHALLENGE_REVERSE = {75983, 2497, 000000, 65, 68}
    }
}

-- Emerald Dream Z7 (Der Smaragdgrüne Traum)
-- Ysera Invitational R1 (Ysera-Einladungsturnier)
raceDataTable[210023] = {
    100701, 2200, {
        NORMAL            = {77841, 2676, 000000, 98, 103},
        ADVANCED          = {77842, 2682, 000000, 87, 90},
        REVERSE           = {77843, 2688, 000000, 87, 90},
        CHALLENGE         = {77844, 2694, 000000, 95, 98},
        CHALLENGE_REVERSE = {77845, 2695, 000000, 97, 100}
    }
}
-- Smoldering Sprint R2 (Qualmende Querele)
raceDataTable[210310] = {
    100702, 2200, {
        NORMAL            = {77983, 2677, 000000, 80, 85},
        ADVANCED          = {77984, 2683, 000000, 73, 76},
        REVERSE           = {77985, 2689, 000000, 73, 76}, -- xxx
        CHALLENGE         = {77986, 2696, 000000, 79, 82},
        CHALLENGE_REVERSE = {77987, 2697, 000000, 80, 83}
    }
}
-- Viridescent Venture R3 (Grünliche Gaudi)
raceDataTable[210412] = {
    100703, 2200, {
        NORMAL            = {77996, 2678, 000000, 78, 83},
        ADVANCED          = {77997, 2684, 000000, 64, 67},
        REVERSE           = {77998, 2690, 000000, 64, 67},
        CHALLENGE         = {77999, 2698, 000000, 73, 76},
        CHALLENGE_REVERSE = {78000, 2699, 000000, 73, 76}
    }
}
-- Shoreline Switchback R4 (Uferumkehr) - R-11.0.5
raceDataTable[210497] = {
    100704, 2200, {
        NORMAL            = {78016, 2679, 000000, 73, 78},
        ADVANCED          = {78017, 2685, 000000, 63, 66},
        REVERSE           = {78018, 2691, 000000, 62, 65},
        CHALLENGE         = {78019, 2700, 000000, 70, 73},
        CHALLENGE_REVERSE = {78020, 2701, 000000, 70, 73}
    }
}
-- Canopy Concours R5 (Baumkronenbagatelle)
raceDataTable[210784] = {
    100705, 2200, {
        NORMAL            = {78102, 2680, 000000, 105, 110},
        ADVANCED          = {78103, 2686, 000000, 93, 96},
        REVERSE           = {78104, 2692, 000000, 96, 99},
        CHALLENGE         = {78105, 2702, 000000, 105, 108},
        CHALLENGE_REVERSE = {78106, 2703, 000000, 105, 108}
    }
}
-- Emerald Amble R6 (Smaragdspaziergang)
raceDataTable[210861] = {
    100706, 2200, {
        NORMAL            = {78115, 2681, 000000, 84, 89},
        ADVANCED          = {78116, 2687, 000000, 70, 73},
        REVERSE           = {78117, 2693, 000000, 70, 73},
        CHALLENGE         = {78118, 2704, 000000, 73, 76},
        CHALLENGE_REVERSE = {78119, 2705, 000000, 73, 76}
    }
}

-- The War Withina
-- Isle of Dorn Z1 (Insel von Dorn)
-- Dornogal Drift R1 (Dornogaldrift) - R-11.0.5
raceDataTable[219542] = {
    110101, 2248, {
        NORMAL   = {80219, 2923, 439233, 48, 53},
        ADVANCED = {80225, 2929, 439241, 43, 46},
        REVERSE  = {80231, 2935, 439248, 43, 46}
    }
}
-- Storm Watch's Survey R2 (Sturmpostenstudie) - R-11.0.5
raceDataTable[219544] = {
    110102, 2248, {
        NORMAL   = {80220, 2924, 439234, 63, 68},
        ADVANCED = {80226, 2930, 439243, 60, 63},
        REVERSE  = {80232, 2936, 439249, 62, 65}
    }
}
-- Basin Bypass R3 (Beckenbypass) - R-11.0.5
raceDataTable[219547] = {
    110103, 2248, {
        NORMAL   = {80221, 2925, 439235, 58, 63},
        ADVANCED = {80227, 2931, 439244, 54, 57},
        REVERSE  = {80233, 2937, 439250, 57, 60}
    }
}
-- The Wold Ways R4 (Die Holtzwege) - R-11.0.5
raceDataTable[219548] = {
    110104, 2248, {
        NORMAL   = {80222, 2926, 439236, 68, 73},
        ADVANCED = {80228, 2932, 439245, 68, 71},
        REVERSE  = {80234, 2938, 439251, 70, 73}
    }
}
-- Thunderhead Trail R5 (Donnerkopfdreh) - R-11.0.5
raceDataTable[219549] = {
    110105, 2248, {
        NORMAL   = {80223, 2927, 439238, 70, 75},
        ADVANCED = {80229, 2933, 439246, 66, 69},
        REVERSE  = {80235, 2939, 439252, 66, 69}
    }
}
-- Orecreg's Doglegs R6 (Erzgrubenecken) - R-11.0.5
raceDataTable[219550] = {
    110106, 2248, {
        NORMAL   = {80224, 2928, 439239, 65, 70},
        ADVANCED = {80230, 2934, 439247, 61, 64},
        REVERSE  = {80236, 2940, 439254, 61, 64}
    }
}

-- The Ringing Deeps Z2 (Die Schallenden Tiefen)
-- Earthenworks Weave R1 (Erdwerkeweberei) - R-11.0.5
raceDataTable[219551] = {
    110201, 2214, {
        NORMAL 	 = {80237, 2941, 439257, 52, 57},
        ADVANCED = {80244, 2947, 439265, 49, 52},
        REVERSE  = {80250, 2953, 439271, 50, 53}
    }
}
-- Ringing Deeps Ramble R2 (Schallende-Tiefen-Spektakel) - R-11.0.5
raceDataTable[219552] = {
    110202, 2214, {
        NORMAL 	 = {80238, 2942, 439258, 57, 62},
        ADVANCED = {80245, 2948, 439266, 53, 56},
        REVERSE  = {80251, 2954, 439272, 53, 56}
    }
}
-- Chittering Concourse R3 (Zirpendes Zusammentreffen) - R-11.0.5
raceDataTable[219553] = {
    110203, 2214, {
        NORMAL 	 = {80239, 2943, 439260, 56, 61},
        ADVANCED = {80246, 2949, 439267, 53, 56},
        REVERSE  = {80252, 2955, 439273, 54, 57}
    }
}
-- Cataract River Cruise R4 (Kataraktflussfahrt) - R-11.0.5
raceDataTable[219554] = {
    110204, 2214, {
        NORMAL 	 = {80240, 2944, 439261, 60, 65},
        ADVANCED = {80247, 2950, 439268, 58, 61},
        REVERSE  = {80253, 2956, 439274, 57, 60}
    }
}
-- Taelloch Twist R5 (Taellochtrick) - R-11.0.5
raceDataTable[219555] = {
    110205, 2214, {
        NORMAL 	 = {80242, 2945, 439262, 47, 52},
        ADVANCED = {80248, 2951, 439269, 43, 46},
        REVERSE  = {80254, 2957, 439275, 44, 47}
    }
}
-- Opportunity Point Amble R6 (Chancenspitzenchance) - R-11.0.5
raceDataTable[219556] = {
    110206, 2214, {
        NORMAL 	 = {80243, 2946, 439263, 77, 82},
        ADVANCED = {80249, 2952, 439270, 71, 74},
        REVERSE  = {80255, 2958, 439276, 72, 75}
    }
}

-- Hallowfall Z3 (Heilsturz)
-- Dunelle's Detour R1 (Dunelles gute Güte) - R-11.0.5
raceDataTable[219557] = {
    110301, 2215, {
        NORMAL    = {80256, 2959, 439277, 65, 70},
        ADVANCED  = {80265, 2965, 439286, 62, 65},
        REVERSE   = {80271, 2971, 439292, 64, 67}
    }
}
-- Tenir's Traversal R2 (Tenirs Traversale) - R-11.0.5
raceDataTable[219558] = {
    110302, 2215, {
        NORMAL    = {80257, 2960, 439278, 65, 70},
        ADVANCED  = {80266, 2966, 439287, 60, 63},
        REVERSE   = {80272, 2972, 439293, 63, 66}
    }
}
-- Light's Redoubt Descent R3 (Lichtschanzensturz) - R-11.0.5
raceDataTable[219559] = {
    110303, 2215, {
        NORMAL    = {80258, 2961, 439281, 63, 68},
        ADVANCED  = {80267, 2967, 439288, 62, 65},
        REVERSE   = {80273, 2973, 439294, 62, 65}
    }
}
-- Stillstone Slalom R4 (Stillsteinslalom) - R-11.0.5
raceDataTable[219560] = {
    110304, 2215, {
        NORMAL    = {80259, 2962, 439282, 56, 61},
        ADVANCED  = {80268, 2968, 439289, 54, 57},
        REVERSE   = {80274, 2974, 439295, 56, 59}
    }
}
-- Mereldar Meander R5 (Mereldarmäander) - R-11.0.5
raceDataTable[219561] = {
    110305, 2215, {
        NORMAL    = {80260, 2963, 439283, 76, 81},
        ADVANCED  = {80269, 2969, 439290, 71, 74},
        REVERSE   = {80275, 2975, 439296, 71, 74}
    }
}
-- Velhan's Venture R6 (Velhans Vorstoß) - R-11.0.5
raceDataTable[219562] = {
    110306, 2215, {
        NORMAL    = {80261, 2964, 439284, 55, 60},
        ADVANCED  = {80270, 2970, 439291, 50, 53},
        REVERSE   = {80276, 2976, 439298, 50, 53}
    }
}

-- Azj-Kahet Z5 (Azj-Kahet)
-- City of Threads Twist R1 (Stadt-der-Fäden-Sause) - R-11.0.5
raceDataTable[219564] = {
    110501, 2255, {
        NORMAL    = {80277, 2977, 439300, 78, 83},
        ADVANCED  = {80283, 2983, 439307, 74, 77},
        REVERSE   = {80289, 2989, 439316, 74, 77}
    }
}
-- Maddening Deep Dip R2 (Tiefenrausch des Wahnsinns) - R-11.0.5
raceDataTable[219565] = {
    110502, 2255, {
        NORMAL    = {80278, 2978, 439301, 58, 63},
        ADVANCED  = {80284, 2984, 439308, 54, 57},
        REVERSE   = {80290, 2990, 439317, 56, 59}
    }
}
-- The Weaver's Wing R3 (Der Wind der Weberin) - R-11.0.5
raceDataTable[219567] = {
    110503, 2255, {
        NORMAL    = {80279, 2979, 439302, 54, 59},
        ADVANCED  = {80285, 2985, 439309, 51, 54},
        REVERSE   = {80291, 2991, 439318, 50, 53}
    }
}
-- Rak-Ahat Rush R4 (Rak-Ahat-Rausch) - R-11.0.5
raceDataTable[219568] = {
    110504, 2255, {
        NORMAL    = {80280, 2980, 439303, 70, 75},
        ADVANCED  = {80286, 2986, 439310, 66, 69},
        REVERSE   = {80292, 2992, 439319, 66, 69}
    }
}
-- Pit Plunge R5 (Grubengerangel) - R-11.0.5
raceDataTable[219569] = {
    110505, 2255, {
        NORMAL    = {80281, 2981, 439304, 63, 68},
        ADVANCED  = {80287, 2987, 439311, 61, 64},
        REVERSE   = {80293, 2993, 439320, 61, 64}
    }
}
-- Siegehold Scuttle R6 (Belagerungsfestenbestrebung) - R-11.0.5
raceDataTable[219570] = {
    110506, 2255, {
        NORMAL    = {80282, 2982, 439305, 70, 75},
        ADVANCED  = {80288, 2988, 439313, 66, 69},
        REVERSE   = {80294, 2994, 439321, 63, 66}
    }
}

-- Undermine Z6 (Lorenhall)
-- Skyrocketing Sprint R1 (Raktenrennen) - PTR-11.1.0
raceDataTable[231793] = {
    110601, 2346, {
        NORMAL    = {85071, 3119, 466395, 32, 42},
        REVERSE   = {85096, 3121, 466619, 32, 42}
    }
}
-- The Heaps Leap R2 (Haldenhpüfer) - PTR-11.1.0
raceDataTable[231879] = {
    110602, 2346, {
        NORMAL    = {85097, 3122, 466624, 33, 43},
        REVERSE   = {85098, 3123, 466626, 33, 43}
    }
}
-- Scrapshop Shot R3 (Schrottladenchance) - PTR-11.1.0
raceDataTable[231893] = {
    110603, 2346, {
        NORMAL    = {85099, 3124, 466629, 36, 46},
        REVERSE   = {85100, 3125, 466631, 36, 46}
    }
}
-- Rags to Riches Rush R4 (Tellerwäschertriumph) - PTR-11.1.0
raceDataTable[231900] = {
    110604, 2346, {
        NORMAL    = {85101, 3126, 466632, 40, 50},
        REVERSE   = {85102, 3127, 466634, 40, 50}
    }
}
-- Breakneck Bolt R5 (Halsbrecherblitz) - PTR-11.1.0
raceDataTable[233917] = {
    110605, 2346, {
        NORMAL    = {85900, 3181, 471625, 35, 40},
        REVERSE   = {85901, 3182, 471626, 35, 40}
    }
}
-- Junkyard Jaunt R6 (Schrottplatzspurt) - PTR-11.1.0
raceDataTable[233918] = {
    110606, 2346, {
        NORMAL    = {85902, 3183, 471627, 35, 40},
        REVERSE   = {85903, 3184, 471628, 35, 40}
    }
}
-- Casino Cruise R7 (Casinokurs) - PTR-11.1.0
raceDataTable[233919] = {
    110607, 2346, {
        NORMAL    = {85904, 3185, 471629, 30, 35},
        REVERSE   = {85905, 3186, 471630, 30, 35}
    }
}
-- Sandy Scuttle R8 (Grundgekrabbel) - PTR-11.1.0
raceDataTable[233920] = {
    110608, 2346, {
        NORMAL    = {85906, 3187, 471631, 33, 38},
        REVERSE   = {85907, 3188, 471632, 33, 38}
    }
}

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