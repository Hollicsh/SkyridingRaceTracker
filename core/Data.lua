local addonName, SRT = ...

SRT.raceDataTable = {}
local raceDataTable = SRT.raceDataTable

SRT.MEDIA_PATH = "Interface\\AddOns\\" .. addonName .. "\\media\\"

-- Dragonflight
-- The Waking Shores (Die Küste des Erwachens)
-- Ruby Lifeshrine Loop 01 (Rubinlebensschrein-Schleife) - R-11.0.5
raceDataTable[190123] = {
    NORMAL            = {66679, 2042, 53, 56},
    ADVANCED          = {66692, 2044, 52, 57},
    REVERSE           = {72052, 2154, 50, 55},
    CHALLENGE         = {75776, 2421, 54, 57},
    CHALLENGE_REVERSE = {75777, 2422, 57, 60},
    STORM_GRYPHON     = {77777, 2664, 65, 70} -- !!!
}
-- Wild Preserve Slalom 02 (Wildreservat-Slalom) - R-11.0.5
raceDataTable[190473] = {
    NORMAL            = {66721, 2048, 42, 45},
    ADVANCED          = {66722, 2049, 40, 45},
    REVERSE           = {72705, 2176, 41, 46},
    CHALLENGE         = {75778, 2423, 48, 51},
    CHALLENGE_REVERSE = {75779, 2424, 49, 52}
}
-- Emberflow Flight 03 (Glutstrom-Flug) - R-11.0.5
raceDataTable[190519] = {
    NORMAL            = {66727, 2052, 50, 53},
    ADVANCED          = {66728, 2053, 44, 49},
    REVERSE           = {72707, 2177, 45, 50},
    CHALLENGE         = {75780, 2425, 50, 53},
    CHALLENGE_REVERSE = {75781, 2426, 51, 54}
}
-- Apex Canopy River Run 04 (Flusslauf des Hohen Blätterdachs)
raceDataTable[190551] = {
    NORMAL            = {66732, 2054, 52, 55},
    ADVANCED          = {66733, 2055, 45, 50},
    REVERSE           = {72734, 2178, 48, 53},
    CHALLENGE         = {75782, 2427, 53, 56},
    CHALLENGE_REVERSE = {75783, 2428, 53, 56}
}
-- Uktulut Coaster 05 (Uktuluter Küstenachter)
raceDataTable[190667] = {
    NORMAL            = {66777, 2056, 45, 48}, -- xxx
    ADVANCED          = {66778, 2057, 40, 45},
    REVERSE           = {72739, 2179, 43, 48},
    CHALLENGE         = {75785, 2429, 46, 49},
    CHALLENGE_REVERSE = {75786, 2430, 48, 51}
}
-- Wingrest Roundabout 06 (Schwingenrastkreisel) - R-11.0.5
raceDataTable[190753] = {
    NORMAL            = {66786, 2058, 53, 56},
    ADVANCED          = {66787, 2059, 53, 58},
    REVERSE           = {72740, 2180, 56, 61},
    CHALLENGE         = {75787, 2431, 60, 63},
    CHALLENGE_REVERSE = {75788, 2432, 60, 63}
}
-- Flashfrost Flyover 07 (Blitzfrost-Überflug) - R-11.0.5
raceDataTable[190326] = {
    NORMAL            = {66710, 2046, 63, 66},
    ADVANCED          = {66712, 2047, 61, 66},
    REVERSE           = {72700, 2181, 60, 65},
    CHALLENGE         = {75789, 2433, 64, 67},
    CHALLENGE_REVERSE = {75790, 2434, 69, 74}
}
-- Wild Preserve Circuit 08 (Wildreservat-Parcours)
raceDataTable[190503] = {
    NORMAL            = {66725, 2050, 40, 43},
    ADVANCED          = {66726, 2051, 38, 43},
    REVERSE           = {72706, 2182, 41, 46},
    CHALLENGE         = {75791, 2435, 43, 46},
    CHALLENGE_REVERSE = {75792, 2436, 44, 47}
}

-- Ohn'ahran Plains (Ebenen von Ohn'ahra)
-- Sundapple Copse Circuit 01 (Sonnentüpfelhainstrecke)
raceDataTable[190928] = {
    NORMAL            = {66835, 2060, 49, 52},
    ADVANCED          = {66836, 2061, 41, 46},
    REVERSE           = {72801, 2183, 45, 50},
    CHALLENGE         = {75793, 2437, 51, 54},
    CHALLENGE_REVERSE = {75794, 2439, 50, 53}
}
-- Fen Flythrough 02 (Moor-Durchflug) - R-11.0.5
raceDataTable[191121] = {
    NORMAL            = {66877, 2062, 48, 51},
    ADVANCED          = {66878, 2063, 41, 46},
    REVERSE           = {72802, 2184, 47, 52},
    CHALLENGE         = {75795, 2440, 50, 53},
    CHALLENGE_REVERSE = {75796, 2441, 50, 53},
    STORM_GRYPHON     = {77785, 2665, 82, 87} -- !!!
}
-- Ravine River Run 03 (Schluchtflusslauf)
raceDataTable[191165] = {
    NORMAL            = {66880, 2064, 49, 52},
    ADVANCED          = {66681, 2065, 47, 52},
    REVERSE           = {72803, 2185, 46, 51},
    CHALLENGE         = {75797, 2442, 50, 53},
    CHALLENGE_REVERSE = {75798, 2443, 51, 54}
}
-- Emerald Garden Ascent 04 (Smaragdgärtenaufstieg)
raceDataTable[191247] = {
    NORMAL            = {66885, 2066, 63, 66},
    ADVANCED          = {66886, 2067, 55, 60},
    REVERSE           = {72805, 2186, 57, 62},
    CHALLENGE         = {75799, 2444, 66, 69},
    CHALLENGE_REVERSE = {75800, 2445, 66, 69}
}
-- Maruukai Dash 05 (Maruukaispurt) - R-11.0.5
raceDataTable[191422] = {
    NORMAL            = {66921, 2069, 25, 28},
    CHALLENGE         = {75801, 2446, 24, 27}
}
-- Mirror of the Sky Dash 06 (Spurt zum Spiegel des Himmels) - R-11.0.5
raceDataTable[191511] = {
    NORMAL            = {66933, 2070, 26, 29},
    CHALLENGE         = {75802, 2447, 27, 30}
}
-- River Rapids Route 07 (Stromschnellenstrecke)
raceDataTable[196092] = {
    NORMAL            = {70710, 2119, 48, 51},
    ADVANCED          = {70711, 2120, 43, 48},
    REVERSE           = {72807, 2187, 44, 49},
    CHALLENGE         = {75803, 2448, 52, 55},
    CHALLENGE_REVERSE = {75804, 2449, 52, 55}
}

-- Azure Span (Das Azurblaue Gebirge)
-- Azure Span Sprint 01 (Sprint des Azurblauen Gebirges)
raceDataTable[191572] = {
    NORMAL            = {66946, 2074, 63, 66},
    ADVANCED          = {66947, 2075, 58, 63},
    REVERSE           = {72796, 2188, 60, 65},
    CHALLENGE         = {75805, 2450, 67, 70},
    CHALLENGE_REVERSE = {75806, 2451, 69, 72}
}
-- Azure Span Slalom 02 (Slalom des Azurblauen Gebirges)
raceDataTable[191947] = {
    NORMAL            = {67002, 2076, 58, 61},
    ADVANCED          = {67003, 2077, 56, 61},
    REVERSE           = {72799, 2189, 53, 58},
    CHALLENGE         = {75807, 2452, 55, 58},
    CHALLENGE_REVERSE = {75808, 2453, 55, 58}
}
-- Vakthros Ascent 03 (Vakthrosaufstieg) - R-11.0.5
raceDataTable[192115] = {
    NORMAL            = {67031, 2078, 58, 61},
    ADVANCED          = {67032, 2079, 56, 61},
    REVERSE           = {72794, 2190, 56, 61},
    CHALLENGE         = {75809, 2454, 63, 66},
    CHALLENGE_REVERSE = {75810, 2455, 64, 67},
    STORM_GRYPHON     = {77786, 2666, 120, 125} -- !!!
}
-- Iskaara Tour 04 (Iskaara-Tour)
raceDataTable[192886] = {
    NORMAL            = {67296, 2083, 75, 78},
    ADVANCED          = {67297, 2084, 70, 75},
    REVERSE           = {72800, 2191, 67, 72},
    CHALLENGE         = {75811, 2456, 78, 81},
    CHALLENGE_REVERSE = {75812, 2457, 79, 82}
}
-- Frostland Flyover 05 (Frostland-Überflug)
raceDataTable[192945] = {
    NORMAL            = {67565, 2085, 76, 79},
    ADVANCED          = {67566, 2086, 72, 77},
    REVERSE           = {72795, 2192, 69, 74},
    CHALLENGE         = {75813, 2458, 85, 88},
    CHALLENGE_REVERSE = {75815, 2459, 83, 86}
}
-- Archive Ambit 06 (Archivring)
raceDataTable[193027] = {
    NORMAL            = {67741, 2089, 91, 94},
    ADVANCED          = {67742, 2090, 81, 86},
    REVERSE           = {72797, 2193, 76, 81},
    CHALLENGE         = {75816, 2460, 90, 93},
    CHALLENGE_REVERSE = {75817, 2461, 92, 95}
}

-- Thaldraszus (Thaldraszus)
-- Flowing Forest Flight 01 (Flug des Wallenden Walds)
raceDataTable[192555] = {
    NORMAL            = {67095, 2080, 49, 52},
    ADVANCED          = {67096, 2081, 40, 45},
    REVERSE           = {72793, 2194, 41, 46},
    CHALLENGE         = {75820, 2462, 47, 50},
    CHALLENGE_REVERSE = {75821, 2463, 46, 49}
}
-- Tyrhold Trial 02 (Tyrhold-Tournee) - R-11.0.5
raceDataTable[193651] = {
    NORMAL            = {69957, 2092, 81, 84},
    ADVANCED          = {69958, 2093, 75, 80},
    REVERSE           = {72792, 2195, 59, 64},
    CHALLENGE         = {75822, 2464, 58, 61},
    CHALLENGE_REVERSE = {75823, 2465, 63, 66},
    STORM_GRYPHON     = {77784, 2667, 80, 85} -- !!!
}
-- Cliffside Circuit 03 (Klippenrundstrecke) - R-11.0.5
raceDataTable[193911] = {
    NORMAL            = {70051, 2096, 69, 72},
    ADVANCED          = {70052, 2097, 66, 71},
    REVERSE           = {72760, 2196, 69, 74},
    CHALLENGE         = {75824, 2466, 81, 84},
    CHALLENGE_REVERSE = {75825, 2467, 80, 83}
}
-- Academy Ascent 04 (Akademieaufstieg)
raceDataTable[193951] = {
    NORMAL            = {70059, 2098, 54, 57},
    ADVANCED          = {70060, 2099, 52, 57},
    REVERSE           = {72754, 2197, 53, 58},
    CHALLENGE         = {75826, 2468, 65, 68},
    CHALLENGE_REVERSE = {75827, 2469, 65, 68}
}
-- Garden Gallivant 05 (Gartenpromenade)
raceDataTable[194348] = {
    NORMAL            = {70157, 2101, 61, 64},
    ADVANCED          = {70158, 2102, 54, 59},
    REVERSE           = {72769, 2198, 57, 62},
    CHALLENGE         = {75784, 2470, 60, 63},
    CHALLENGE_REVERSE = {75828, 2471, 64, 67}
}
-- Caverns Criss-Cross 06 (Kreuz und quer durch die Höhlen)
raceDataTable[194372] = {
    NORMAL            = {70161, 2103, 50, 53},
    ADVANCED          = {70163, 2104, 45, 50},
    REVERSE           = {72750, 2199, 47, 52},
    CHALLENGE         = {75829, 2472, 56, 59},
    CHALLENGE_REVERSE = {75830, 2473, 54, 57}
}

-- Forbidden Reach (Die Verbotene Insel)
-- Stormsunder Crater Circuit 01 (Sturmrisskrater-Rundflug) - R-11.0.5
raceDataTable[200183] = {
    NORMAL            = {73017, 2201, 43, 46},
    ADVANCED          = {73018, 2207, 42, 47},
    REVERSE           = {73019, 2213, 42, 47},
    CHALLENGE         = {75954, 2474, 45, 48},
    CHALLENGE_REVERSE = {75955, 2475, 44, 47},
    STORM_GRYPHON     = {77787, 2668, 92, 97} -- !!!
}
-- Morqut Ascent 02 (Morqutaufstieg)
raceDataTable[200212] = {
    NORMAL            = {73020, 2202, 52, 55},
    ADVANCED          = {73023, 2208, 49, 54},
    REVERSE           = {73024, 2214, 52, 57},
    CHALLENGE         = {75956, 2476, 50, 53},
    CHALLENGE_REVERSE = {75957, 2477, 50, 53}
}
-- Aerie Chasm Cruise 03 (Nistklufttour)
raceDataTable[200236] = {
    NORMAL            = {73025, 2203, 53, 56},
    ADVANCED          = {73027, 2209, 50, 55},
    REVERSE           = {73028, 2215, 50, 55},
    CHALLENGE         = {75958, 2478, 53, 56},
    CHALLENGE_REVERSE = {75959, 2479, 52, 55}
}
-- Southern Reach Route 04 (Südinselroute)
raceDataTable[200247] = {
    NORMAL            = {73029, 2204, 70, 73},
    ADVANCED          = {73030, 2210, 68, 73},
    REVERSE           = {73032, 2216, 63, 68},
    CHALLENGE         = {75960, 2480, 70, 63},
    CHALLENGE_REVERSE = {75961, 2481, 68, 71}
}
-- Caldera Coaster 05 (Kalderakurven)
raceDataTable[200316] = {
    NORMAL            = {73033, 2205, 58, 61},
    ADVANCED          = {73034, 2211, 52, 57},
    REVERSE           = {73052, 2217, 49, 54},
    CHALLENGE         = {75962, 2482, 55, 58},
    CHALLENGE_REVERSE = {75963, 2483, 53, 56}
}
-- Forbidden Reach Rush 06 (Verbotene-Insel-Eile)
raceDataTable[200417] = {
    NORMAL            = {73061, 2206, 59, 62},
    ADVANCED          = {73062, 2212, 56, 61},
    REVERSE           = {73065, 2218, 57, 62}, -- xxx
    CHALLENGE         = {75964, 2484, 60, 63},
    CHALLENGE_REVERSE = {75965, 2485, 60, 63}
}

-- Zaralek Cavern (Zaralekhöhle)
-- Crystal Circuit 01 (Kristallkreisel) - R-11.0.5
raceDataTable[202524] = {
    NORMAL            = {74839, 2246, 63, 68},
    ADVANCED          = {74842, 2252, 55, 60},
    REVERSE           = {74882, 2258, 53, 58},
    CHALLENGE         = {75972, 2486, 57, 60},
    CHALLENGE_REVERSE = {75973, 2487, 58, 61},
    STORM_GRYPHON     = {77793, 2669, 95, 100} -- !!!
}
-- Caldera Cruise 02 (Kalderarundflug)
raceDataTable[202676] = {
    NORMAL            = {74889, 2247, 75, 80},
    ADVANCED          = {74899, 2253, 68, 73},
    REVERSE           = {74925, 2259, 68, 73},
    CHALLENGE         = {75974, 2488, 72, 75},
    CHALLENGE_REVERSE = {75975, 2489, 72, 75}
}
-- Brimstone Scramble 03 (Schwefelhast)
raceDataTable[202749] = {
    NORMAL            = {74939, 2248, 69, 72},
    ADVANCED          = {74943, 2254, 64, 69},
    REVERSE           = {74944, 2260, 64, 69},
    CHALLENGE         = {75976, 2490, 69, 72},
    CHALLENGE_REVERSE = {75977, 2491, 71, 74}
}
-- Shimmering Slalom 04 (Schimmerslalom)
raceDataTable[202772] = {
    NORMAL            = {74951, 2249, 75, 80},
    ADVANCED          = {74954, 2255, 70, 75},
    REVERSE           = {74956, 2261, 70, 75},
    CHALLENGE         = {75978, 2492, 79, 82},
    CHALLENGE_REVERSE = {75979, 2493, 75, 78}
}
-- Loamm Roamm 05 (Loamm-Jagd)
raceDataTable[202795] = {
    NORMAL            = {74972, 2250, 55, 60},
    ADVANCED          = {74975, 2256, 50, 55},
    REVERSE           = {74977, 2262, 48, 53},
    CHALLENGE         = {75980, 2494, 53, 56},
    CHALLENGE_REVERSE = {75981, 2495, 52, 55}
}
-- Sulfur Sprint 06 (Schwefelsprint)
raceDataTable[202973] = {
    NORMAL            = {75035, 2251, 64, 67},
    ADVANCED          = {75042, 2257, 58, 63},
    REVERSE           = {75043, 2263, 57, 62},
    CHALLENGE         = {75982, 2496, 67, 70},
    CHALLENGE_REVERSE = {75983, 2497, 65, 68}
}

-- Emerald Dream (Der Smaragdgrüne Traum)
-- Ysera Invitational 01 (Ysera-Einladungsturnier)
raceDataTable[210023] = {
    NORMAL            = {77841, 2676, 98, 103},
    ADVANCED          = {77842, 2682, 87, 90},
    REVERSE           = {77843, 2688, 87, 90},
    CHALLENGE         = {77844, 2694, 95, 98},
    CHALLENGE_REVERSE = {77845, 2695, 97, 100}
}
-- Smoldering Sprint 02 (Qualmende Querele)
raceDataTable[210310] = {
    NORMAL            = {77983, 2677, 80, 85},
    ADVANCED          = {77984, 2683, 73, 76},
    REVERSE           = {77985, 2689, 73, 76}, -- xxx
    CHALLENGE         = {77986, 2696, 79, 82},
    CHALLENGE_REVERSE = {77987, 2697, 80, 83}
}
-- Viridescent Venture 03 (Grünliche Gaudi)
raceDataTable[210412] = {
    NORMAL            = {77996, 2678, 78, 83},
    ADVANCED          = {77997, 2684, 64, 67},
    REVERSE           = {77998, 2690, 64, 67},
    CHALLENGE         = {77999, 2698, 73, 76},
    CHALLENGE_REVERSE = {78000, 2699, 73, 76}
}
-- Shoreline Switchback 04 (Uferumkehr) - R-11.0.5
raceDataTable[210497] = {
    NORMAL            = {78016, 2679, 73, 78},
    ADVANCED          = {78017, 2685, 63, 66},
    REVERSE           = {78018, 2691, 62, 65},
    CHALLENGE         = {78019, 2700, 70, 73},
    CHALLENGE_REVERSE = {78020, 2701, 70, 73}
}
-- Canopy Concours 05 (Baumkronenbagatelle)
raceDataTable[210784] = {
    NORMAL            = {78102, 2680, 105, 110},
    ADVANCED          = {78103, 2686, 93, 96},
    REVERSE           = {78104, 2692, 96, 99},
    CHALLENGE         = {78105, 2702, 105, 108},
    CHALLENGE_REVERSE = {78106, 2703, 105, 108}
}
-- Emerald Amble 06 (Smaragdspaziergang)
raceDataTable[210861] = {
    NORMAL            = {78115, 2681, 84, 89},
    ADVANCED          = {78116, 2687, 70, 73},
    REVERSE           = {78117, 2693, 70, 73},
    CHALLENGE         = {78118, 2704, 73, 76},
    CHALLENGE_REVERSE = {78119, 2705, 73, 76}
}

-- The War Withina
-- Isle of Dorn Z1 (Insel von Dorn)
-- Dornogal Drift R1 (Dornogaldrift) - R-11.0.5
raceDataTable[219542] = {
    NORMAL   = {80219, 2923, 48, 53},
    ADVANCED = {80225, 2929, 43, 46},
    REVERSE  = {80231, 2935, 43, 46}
}
-- Storm Watch's Survey R2 (Sturmpostenstudie) - R-11.0.5
raceDataTable[219544] = {
    NORMAL   = {80220, 2924, 63, 68},
    ADVANCED = {80226, 2930, 60, 63},
    REVERSE  = {80232, 2936, 62, 65}
}
-- Basin Bypass R3 (Beckenbypass) - R-11.0.5
raceDataTable[219547] = {
    NORMAL   = {80221, 2925, 58, 63},
    ADVANCED = {80227, 2931, 54, 57},
    REVERSE  = {80233, 2937, 57, 60}
}
-- The Wold Ways R4 (Die Holtzwege) - R-11.0.5
raceDataTable[219548] = {
    NORMAL   = {80222, 2926, 68, 73},
    ADVANCED = {80228, 2932, 68, 71},
    REVERSE  = {80234, 2938, 70, 73}
}
-- Thunderhead Trail R5 (Donnerkopfdreh) - R-11.0.5
raceDataTable[219549] = {
    NORMAL   = {80223, 2927, 70, 75},
    ADVANCED = {80229, 2933, 66, 69},
    REVERSE  = {80235, 2939, 66, 69}
}
-- Orecreg's Doglegs R6 (Erzgrubenecken) - R-11.0.5
raceDataTable[219550] = {
    NORMAL   = {80224, 2928, 65, 70},
    ADVANCED = {80230, 2934, 61, 64},
    REVERSE  = {80236, 2940, 61, 64}
}

-- The Ringing Deeps Z2 (Die Schallenden Tiefen)
-- Earthenworks Weave R1 (Erdwerkeweberei) - R-11.0.5
raceDataTable[219551] = {
    NORMAL 	 = {80237, 2941, 52, 57},
    ADVANCED = {80244, 2947, 49, 52},
    REVERSE  = {80250, 2953, 50, 53}
}
-- Ringing Deeps Ramble R2 (Schallende-Tiefen-Spektakel) - R-11.0.5
raceDataTable[219552] = {
    NORMAL 	 = {80238, 2942, 57, 62},
    ADVANCED = {80245, 2948, 53, 56},
    REVERSE  = {80251, 2954, 53, 56}
}
-- Chittering Concourse R3 (Zirpendes Zusammentreffen) - R-11.0.5
raceDataTable[219553] = {
    NORMAL 	 = {80239, 2943, 56, 61},
    ADVANCED = {80246, 2949, 53, 56},
    REVERSE  = {80252, 2955, 54, 57}
}
-- Cataract River Cruise R4 (Kataraktflussfahrt) - R-11.0.5
raceDataTable[219554] = {
    NORMAL 	 = {80240, 2944, 60, 65},
    ADVANCED = {80247, 2950, 58, 61},
    REVERSE  = {80253, 2956, 57, 60}
}
-- Taelloch Twist R5 (Taellochtrick) - R-11.0.5
raceDataTable[219555] = {
    NORMAL 	 = {80242, 2945, 47, 52},
    ADVANCED = {80248, 2951, 43, 46},
    REVERSE  = {80254, 2957, 44, 47}
}
-- Opportunity Point Amble R6 (Chancenspitzenchance) - R-11.0.5
raceDataTable[219556] = {
    NORMAL 	 = {80243, 2946, 77, 82},
    ADVANCED = {80249, 2952, 71, 74},
    REVERSE  = {80255, 2958, 72, 75}
}

-- Hallowfall Z3 (Heilsturz)
-- Dunelle's Detour R1 (Dunelles gute Güte) - R-11.0.5
raceDataTable[219557] = {
    NORMAL    = {80256, 2959, 65, 70},
    ADVANCED  = {80265, 2965, 62, 65},
    REVERSE   = {80271, 2971, 64, 67}
}
-- Tenir's Traversal R2 (Tenirs Traversale) - R-11.0.5
raceDataTable[219558] = {
    NORMAL    = {80257, 2960, 65, 70},
    ADVANCED  = {80266, 2966, 60, 63},
    REVERSE   = {80272, 2972, 63, 66}
}
-- Light's Redoubt Descent R3 (Lichtschanzensturz) - R-11.0.5
raceDataTable[219559] = {
    NORMAL    = {80258, 2961, 63, 68},
    ADVANCED  = {80267, 2967, 62, 65},
    REVERSE   = {80273, 2973, 62, 65}
}
-- Stillstone Slalom R4 (Stillsteinslalom) - R-11.0.5
raceDataTable[219560] = {
    NORMAL    = {80259, 2962, 56, 61},
    ADVANCED  = {80268, 2968, 54, 57},
    REVERSE   = {80274, 2974, 56, 59}
}
-- Mereldar Meander R5 (Mereldarmäander) - R-11.0.5
raceDataTable[219561] = {
    NORMAL    = {80260, 2963, 76, 81},
    ADVANCED  = {80269, 2969, 71, 74},
    REVERSE   = {80275, 2975, 71, 74}
}
-- Velhan's Venture R6 (Velhans Vorstoß) - R-11.0.5
raceDataTable[219562] = {
    NORMAL    = {80261, 2964, 55, 60},
    ADVANCED  = {80270, 2970, 50, 53},
    REVERSE   = {80276, 2976, 50, 53}
}

-- Azj-Kahet Z5 (Azj-Kahet)
-- City of Threads Twist R1 (Stadt-der-Fäden-Sause) - R-11.0.5
raceDataTable[219564] = {
    NORMAL    = {80277, 2977, 78, 83},
    ADVANCED  = {80283, 2983, 74, 77},
    REVERSE   = {80289, 2989, 74, 77}
}
-- Maddening Deep Dip R2 (Tiefenrausch des Wahnsinns) - R-11.0.5
raceDataTable[219565] = {
    NORMAL    = {80278, 2978, 58, 63},
    ADVANCED  = {80284, 2984, 54, 57},
    REVERSE   = {80290, 2990, 56, 59}
}
-- The Weaver's Wing R3 (Der Wind der Weberin) - R-11.0.5
raceDataTable[219567] = {
    NORMAL    = {80279, 2979, 54, 59},
    ADVANCED  = {80285, 2985, 51, 54},
    REVERSE   = {80291, 2991, 50, 53}
}
-- Rak-Ahat Rush R4 (Rak-Ahat-Rausch) - R-11.0.5
raceDataTable[219568] = {
    NORMAL    = {80280, 2980, 70, 75},
    ADVANCED  = {80286, 2986, 66, 69},
    REVERSE   = {80292, 2992, 66, 69}
}
-- Pit Plunge R5 (Grubengerangel) - R-11.0.5
raceDataTable[219569] = {
    NORMAL    = {80281, 2981, 63, 68},
    ADVANCED  = {80287, 2987, 61, 64},
    REVERSE   = {80293, 2993, 61, 64}
}
-- Siegehold Scuttle R6 (Belagerungsfestenbestrebung) - R-11.0.5
raceDataTable[219570] = {
    NORMAL    = {80282, 2982, 70, 75},
    ADVANCED  = {80288, 2988, 66, 69},
    REVERSE   = {80294, 2994, 63, 66}
}