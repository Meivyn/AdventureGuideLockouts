local _, AddOn = ...

AddOn.instances = {
  [409] = 741,   -- Molten Core
  [469] = 742,   -- Blackwing Lair
  [509] = 743,   -- Ruins of Ahn'Qiraj
  [531] = 744,   -- Temple of Ahn'Qiraj
  [558] = 247,   -- Auchenai Crypts
  [543] = 248,   -- Hellfire Ramparts
  [585] = 249,   -- Magisters' Terrace
  [557] = 250,   -- Mana-Tombs
  [560] = 251,   -- Old Hillsbrad Foothills
  [556] = 252,   -- Sethekk Halls
  [555] = 253,   -- Shadow Labyrinth
  [552] = 254,   -- The Arcatraz
  [269] = 255,   -- The Black Morass
  [542] = 256,   -- The Blood Furnace
  [553] = 257,   -- The Botanica
  [554] = 258,   -- The Mechanar
  [540] = 259,   -- The Shattered Halls
  [547] = 260,   -- The Slave Pens
  [545] = 261,   -- The Steamvault
  [546] = 262,   -- The Underbog
  [532] = 745,   -- Karazhan
  [565] = 746,   -- Gruul's Lair
  [544] = 747,   -- Magtheridon's Lair
  [548] = 748,   -- Serpentshrine Cavern
  [550] = 749,   -- The Eye
  [534] = 750,   -- The Battle for Mount Hyjal
  [564] = 751,   -- Black Temple
  [580] = 752,   -- Sunwell Plateau
  [619] = 271,   -- Ahn'kahet: The Old Kingdom
  [601] = 272,   -- Azjol-Nerub
  [600] = 273,   -- Drak'Tharon Keep
  [604] = 274,   -- Gundrak
  [602] = 275,   -- Halls of Lightning
  [668] = 276,   -- Halls of Reflection
  [599] = 277,   -- Halls of Stone
  [658] = 278,   -- Pit of Saron
  [595] = 279,   -- The Culling of Stratholme
  [632] = 280,   -- The Forge of Souls
  [576] = 281,   -- The Nexus
  [578] = 282,   -- The Oculus
  [608] = 283,   -- The Violet Hold
  [650] = 284,   -- Trial of the Champion
  [574] = 285,   -- Utgarde Keep
  [575] = 286,   -- Utgarde Pinnacle
  [624] = 753,   -- Vault of Archavon
  [533] = 754,   -- Naxxramas
  [615] = 755,   -- The Obsidian Sanctum
  [616] = 756,   -- The Eye of Eternity
  [603] = 759,   -- Ulduar
  [649] = 757,   -- Trial of the Crusader
  [249] = 760,   -- Onyxia's Lair
  [631] = 758,   -- Icecrown Citadel
  [724] = 761,   -- The Ruby Sanctum
  [645] = 66,    -- Blackrock Caverns
  [36] = 63,     -- Deadmines
  [938] = 184,   -- End Time
  [670] = 71,    -- Grim Batol
  [644] = 70,    -- Halls of Origination
  [940] = 186,   -- Hour of Twilight
  [755] = 69,    -- Lost City of the Tol'vir
  [33] = 64,     -- Shadowfang Keep
  [725] = 67,    -- The Stonecore
  [657] = 68,    -- The Vortex Pinnacle
  [643] = 65,    -- Throne of the Tides
  [939] = 185,   -- Well of Eternity
  [568] = 77,    -- Zul'Aman
  [859] = 76,    -- Zul'Gurub
  [757] = 75,    -- Baradin Hold
  [669] = 73,    -- Blackwing Descent
  [671] = 72,    -- The Bastion of Twilight
  [754] = 74,    -- Throne of the Four Winds
  [720] = 78,    -- Firelands
  [967] = 187,   -- Dragon Soul
  [962] = 303,   -- Gate of the Setting Sun
  [994] = 321,   -- Mogu'shan Palace
  [1001] = 311,  -- Scarlet Halls
  [1004] = 316,  -- Scarlet Monastery
  [1007] = 246,  -- Scholomance
  [959] = 312,   -- Shado-Pan Monastery
  [1011] = 324,  -- Siege of Niuzao Temple
  [961] = 302,   -- Stormstout Brewery
  [960] = 313,   -- Temple of the Jade Serpent
  [1008] = 317,  -- Mogu'shan Vaults
  [1009] = 330,  -- Heart of Fear
  [996] = 320,   -- Terrace of Endless Spring
  [1098] = 362,  -- Throne of Thunder
  [1136] = 369,  -- Siege of Orgrimmar
  [1182] = 547,  -- Auchindoun
  [1175] = 385,  -- Bloodmaul Slag Mines
  [1208] = 536,  -- Grimrail Depot
  [1195] = 558,  -- Iron Docks
  [1176] = 537,  -- Shadowmoon Burial Grounds
  [1209] = 476,  -- Skyreach
  [1279] = 556,  -- The Everbloom
  [1358] = 559,  -- Upper Blackrock Spire
  [1228] = 477,  -- Highmaul
  [1205] = 457,  -- Blackrock Foundry
  [1448] = 669,  -- Hellfire Citadel
  [1544] = 777,  -- Assault on Violet Hold
  [1501] = 740,  -- Black Rook Hold
  [1677] = 900,  -- Cathedral of Eternal Night
  [1571] = 800,  -- Court of Stars
  [1466] = 762,  -- Darkheart Thicket
  [1456] = 716,  -- Eye of Azshara
  [1477] = 721,  -- Halls of Valor
  [1492] = 727,  -- Maw of Souls
  [1458] = 767,  -- Neltharion's Lair
  [1651] = 860,  -- Return to Karazhan
  [1753] = 945,  -- Seat of the Triumvirate
  [1516] = 726,  -- The Arcway
  [1493] = 707,  -- Vault of the Wardens
  [1520] = 768,  -- The Emerald Nightmare
  [1648] = 861,  -- Trial of Valor
  [1530] = 786,  -- The Nighthold
  [1676] = 875,  -- Tomb of Sargeras
  [1712] = 946,  -- Antorus, the Burning Throne
  [1763] = 968,  -- Atal'Dazar
  [1754] = 1001, -- Freehold
  [1762] = 1041, -- Kings' Rest
  [2097] = 1178, -- Operation: Mechagon
  [1864] = 1036, -- Shrine of the Storm
  [1822] = 1023, -- Siege of Boralus
  [1877] = 1030, -- Temple of Sethraliss
  [1594] = 1012, -- The MOTHERLODE!!
  [1841] = 1022, -- The Underrot
  [1771] = 1002, -- Tol Dagor
  [1862] = 1021, -- Waycrest Manor
  [1861] = 1031, -- Uldir
  [2070] = 1176, -- Battle of Dazar'alor
  [2096] = 1177, -- Crucible of Storms
  [2164] = 1179, -- The Eternal Palace
  [2217] = 1180, -- Ny'alotha, the Waking City
  [2291] = 1188, -- De Other Side
  [2287] = 1185, -- Halls of Atonement
  [2290] = 1184, -- Mists of Tirna Scithe
  [2289] = 1183, -- Plaguefall
  [2284] = 1189, -- Sanguine Depths
  [2285] = 1186, -- Spires of Ascension
  [2441] = 1194, -- Tazavesh, the Veiled Market
  [2286] = 1182, -- The Necrotic Wake
  [2293] = 1187, -- Theater of Pain
  [2296] = 1190, -- Castle Nathria
  [2450] = 1193,  -- Sanctum of Domination
  [2481] = 1195 -- Sepulcher of the First Ones
}
