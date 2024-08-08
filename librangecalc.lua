-- Most of the code from this file is from
-- https://github.com/gnwl/NotGrid/
-- and
-- https://github.com/MarcelineVQ/Twister
local Default = {
	["Alterac"] = {x = 2800.0003, y = 1866.6667},
	["AlteracValley"] = {x = 4237.5, y = 2825},
	["Arathi"] = {x = 3600.0004, y = 2399.9997},
	["ArathiBasin"] = {x = 1756.2497, y = 1170.833},
	["Ashenvale"] = {x = 5766.667, y = 3843.7504},
	["Aszhara"] = {x = 5070.833, y = 3381.25},
	["Azeroth"] = {x = 35199.9, y = 23466.6},
	["Badlands"] = {x = 2487.5, y = 1658.334},
	["Barrens"] = {x = 10133.334, y = 6756.25},
	["BlastedLands"] = {x = 3350, y = 2233.33},
	["BurningSteppes"] = {x = 2929.1663, y = 1952.083},
	["Darkshore"] = {x = 6550, y = 4366.666},
	["Darnassis"] = {x = 1058.333, y = 705.733},
	["DeadwindPass"] = {x = 2499.9997, y = 1666.664},
	["Desolace"] = {x = 4495.833, y = 2997.9163},
	["DunMorogh"] = {x = 4925, y = 3283.334},
	["Durotar"] = {x = 5287.5, y = 3525},
	["Duskwood"] = {x = 2700.0003, y = 1800.004},
	["Dustwallow"] = {x = 5250.0001, y = 3500},
	["EasternPlaguelands"] = {x = 3870.833, y = 2581.25},
	["Elwynn"] = {x = 3470.834, y = 2314.587},
	["Felwood"] = {x = 5750, y = 3833.333},
	["Feralas"] = {x = 6950, y = 4633.333},
	["Hilsbrad"] = {x = 3200, y = 2133.333},
	["Hinterlands"] = {x = 3850, y = 2566.667},
	["Ironforge"] = {x = 790.6246, y = 527.605},
	["Kalimdor"] = {x = 36799.81, y = 24533.2},
	["LochModan"] = {x = 2758.333, y = 1839.583},
	["Moonglade"] = {x = 2308.333, y = 1539.583},
	["Mulgore"] = {x = 5137.5, y = 3425.0003},
	["Ogrimmar"] = {x = 1402.605, y = 935.416},
	["Redridge"] = {x = 2170.834, y = 1447.92},
	["SearingGorge"] = {x = 2231.2503, y = 1487.5},
	["Silithus"] = {x = 3483.334, y = 2322.916},
	["Silverpine"] = {x = 4200, y = 2800},
	["StonetalonMountains"] = {x = 4883.333, y = 3256.2503},
	["Stormwind"] = {x = 1344.27037, y = 896.354},
	["Stranglethorn"] = {x = 6381.25, y = 4254.17},
	["SwampOfSorrows"] = {x = 2293.75, y = 1529.167},
	["Tanaris"] = {x = 6900, y = 4600},
	["Teldrassil"] = {x = 5091.666, y = 3393.75},
	["ThousandNeedles"] = {x = 4399.9997, y = 2933.333},
	["ThunderBluff"] = {x = 1043.7499, y = 695.8331},
	["Tirisfal"] = {x = 4518.75, y = 3012.5001},
	["Undercity"] = {x = 959.375, y = 640.104},
	["UngoroCrater"] = {x = 3700.0003, y = 2466.666},
	["WarsongGulch"] = {x = 1145.8337, y = 764.5831},
	["WesternPlaguelands"] = {x = 4299.9997, y = 2866.667},
	["Westfall"] = {x = 3500.0003, y = 2333.33},
	["Wetlands"] = {x = 4135.4167, y = 2756.25},
	["Winterspring"] = {x = 7100.0003, y = 4733.333}
}

local Turtle_WoW = {
	["AhnQiraj"] = {x = 977.56, y = 651.707},
	["AhnQiraj2f"] = {x = 2777.544, y = 1851.696},
	["AhnQirajEntrance"] = {x = 4139.02, y = 2946.05},
	["AlahThalas"] = {x = 1010.946, y = 677.151},
	["Alterac"] = {x = 2800.0003, y = 1866.6667},
	["AlteracValley"] = {x = 4237.5, y = 2825},
	["AlteracValleyClassic"] = {x = 4237.5, y = 2825},
	["AmaniAlor"] = {x = 1515, y = 997},
	["Arathi"] = {x = 3600.0004, y = 2399.9997},
	["ArathiBasin"] = {x = 1756.2497, y = 1170.833},
	["Ashenvale"] = {x = 5766.667, y = 3843.7504},
	["Aszhara"] = {x = 5070.833, y = 3381.25},
	["Azeroth"] = {x = 35199.9, y = 23466.6},
	["AzsharaCrater"] = {x = 4236, y = 695},
	["Badlands"] = {x = 2487.5, y = 1658.334},
	["Barrens"] = {x = 10133.334, y = 6756.25},
	["BlackFathomDeeps"] = {x = 1221.87, y = 806.42},
	["BlackrockDepths"] = {x = 1407.061, y = 938.0403},
	["BlackrockDepths2f"] = {x = 1507.061, y = 1004.7072},
	["BlackMorass"] = {x = 1271.991, y = 845.475},
	["BlackMorass2f"] = {x = 1085.859, y = 726.609},
	["BlackrockMountain"] = {x = 711.56, y = 468.68},
	["BlackrockSpire"] = {x = 886.839, y = 591.226},
	["BlackrockSpire2f"] = {x = 886.839, y = 591.226},
	["BlackrockSpire3f"] = {x = 886.839, y = 591.226},
	["BlackrockSpire4f"] = {x = 886.839, y = 591.226},
	["BlackrockSpire5f"] = {x = 886.839, y = 591.226},
	["BlackrockSpire6f"] = {x = 886.839, y = 591.226},
	["BlackrockSpire7f"] = {x = 886.839, y = 591.226},
	["BlackwingLair"] = {x = 499.428, y = 332.95},
	["BlackwingLair2f"] = {x = 649.427, y = 432.95},
	["BlackwingLair3f"] = {x = 649.427, y = 432.95},
	["BlackwingLair4f"] = {x = 649.427, y = 432.95},
	["BlastedLands"] = {x = 3350, y = 2233.33},
	["BurningSteppes"] = {x = 2929.1663, y = 1952.083},
	["CavernsOfTime"] = {x = 1348.242, y = 888.086},
	["Collin"] = {x = 37651.46, y = 25100.97},
	["CrescentGrove"] = {x = 2643.215, y = 1751.157},
	["Darkshore"] = {x = 6550, y = 4366.666},
	["Darnassis"] = {x = 1058.333, y = 705.733},
	["DeadminesEntrance"] = {x = 449.89, y = 299.92},
	["DeadwindPass"] = {x = 2499.9997, y = 1666.664},
	["DeeprunTram"] = {x = 312, y = 208},
	["DeeprunTram2f"] = {x = 309, y = 208},
	["Desolace"] = {x = 4495.833, y = 2997.9163},
	["DireMaul"] = {x = 1275, y = 850},
	["DireMaul2f"] = {x = 525, y = 350},
	["DireMaul3f"] = {x = 487.5, y = 325},
	["DireMaul4f"] = {x = 750, y = 500},
	["DireMaul5f"] = {x = 800.0008, y = 533.334},
	["DireMaul6f"] = {x = 975, y = 650},
	["DunMorogh"] = {x = 4925, y = 3283.334},
	["Durotar"] = {x = 5287.5, y = 3525},
	["Duskwood"] = {x = 2700.0003, y = 1800.004},
	["Dustwallow"] = {x = 5250.0001, y = 3500},
	["EasternPlaguelands"] = {x = 3870.833, y = 2581.25},
	["Elwynn"] = {x = 3470.834, y = 2314.587},
	["EmeraldSanctum"] = {x = 1273.101, y = 853.722},
	["EversongWoods"] = {x = 4925, y = 3283.337},
	["Felwood"] = {x = 5750, y = 3833.333},
	["Feralas"] = {x = 6950, y = 4633.333},
	["Ghostlands"] = {x = 3300, y = 2199.999},
	["Gillijim"] = {x = 2464.944, y = 1927.38},
	["Gilneas"] = {x = 3667.638, y = 2442.057},
	["GilneasCity"] = {x = 1250.19, y = 837.443},
	["Gnomeregan"] = {x = 769.668, y = 513.112},
	["Gnomeregan2f"] = {x = 769.668, y = 513.112},
	["Gnomeregan3f"] = {x = 869.668, y = 579.778},
	["Gnomeregan4f"] = {x = 869.6697, y = 579.78},
	["GnomereganEntrance"] = {x = 571.19, y = 379.14},
	["HateforgeQuarry"] = {x = 752.119, y = 510.335},
	["Hilsbrad"] = {x = 3200, y = 2133.333},
	["Hinterlands"] = {x = 3850, y = 2566.667},
	["Hyjal"] = {x = 3206.631, y = 2141.755},
	["Icepoint"] = {x = 1596.938, y = 1062.97},
	["Ironforge"] = {x = 790.6246, y = 527.605},
	["Kalimdor"] = {x = 36799.81, y = 24533.2},
	["Karazhan"] = {x = 598.041, y = 399.32},
	["KarazhanCrypt"] = {x = 546.75, y = 391.97},
	["Lapidis"] = {x = 2165.066, y = 2042.87},
	["LochModan"] = {x = 2758.333, y = 1839.583},
	["Maraudon"] = {x = 2112.09, y = 1410.89},
	["MaraudonEntrance"] = {x = 824, y = 550},
	["MoltenCore"] = {x = 1264.8, y = 843.199},
	["Moomoo"] = {x = 1007.68, y = 671.79},
	["Moonglade"] = {x = 2308.333, y = 1539.583},
	["Mulgore"] = {x = 5137.5, y = 3425.0003},
	["Naxxramas"] = {x = 1991.69, y = 1318.416},
	["Naxxramas2f"] = {x = 652.1, y = 439.67},
	["Ogrimmar"] = {x = 1402.605, y = 935.416},
	["OnyxiasLair"] = {x = 483.118, y = 322.0788},
	["Ragefire"] = {x = 738.864, y = 492.5762},
	["RazorfenDowns"] = {x = 709.049, y = 472.7},
	["RazorfenKraul"] = {x = 736.45, y = 490.96},
	["Redridge"] = {x = 2170.834, y = 1447.92},
	["RuinsofAhnQiraj"] = {x = 2512.5004, y = 1675},
	["ScarletEnclave"] = {x = 3172, y = 2115},
	["ScarletMonastery"] = {x = 619.984, y = 413.322},
	["ScarletMonastery2f"] = {x = 320.191, y = 213.4605},
	["ScarletMonastery3f"] = {x = 612.6966, y = 408.46},
	["ScarletMonastery4f"] = {x = 703.3, y = 468.8663},
	["ScarletMonasteryEntrance"] = {x = 203.66, y = 135.04},
	["Scholomance"] = {x = 320.0489, y = 213.365},
	["Scholomance2f"] = {x = 440.049, y = 293.3664},
	["Scholomance3f"] = {x = 410.078, y = 273.3858},
	["Scholomance4f"] = {x = 531.042, y = 354.0282},
	["SearingGorge"] = {x = 2231.2503, y = 1487.5},
	["ShadowfangKeep"] = {x = 352.43, y = 234.9534},
	["ShadowfangKeep2f"] = {x = 212.426, y = 141.618},
	["ShadowfangKeep3f"] = {x = 152.43, y = 101.61993},
	["ShadowfangKeep4f"] = {x = 152.43, y = 101.6247},
	["ShadowfangKeep5f"] = {x = 152.43, y = 101.6247},
	["ShadowfangKeep6f"] = {x = 198.43, y = 132.28661},
	["ShadowfangKeep7f"] = {x = 272.43, y = 181.61993},
	["Silithus"] = {x = 3483.334, y = 2322.916},
	["SilvermoonCity"] = {x = 1211.458, y = 806.772},
	["Silverpine"] = {x = 4200, y = 2800},
	["StonetalonMountains"] = {x = 4883.333, y = 3256.2503},
	["Stormwind"] = {x = 1737.50033, y = 1158.333},
	["StormwindVault"] = {x = 354.497, y = 234.738},
	["Stranglethorn"] = {x = 6381.25, y = 4254.17},
	["Stratholme"] = {x = 1185.344, y = 789.855},
	["Sunnyglade"] = {x = 988.626, y = 1393.165},
	["SwampOfSorrows"] = {x = 2293.75, y = 1529.167},
	["Tanaris"] = {x = 6900, y = 4600},
	["TelAbim"] = {x = 3154, y = 2174},
	["Teldrassil"] = {x = 5091.666, y = 3393.75},
	["TheDeadmines"] = {x = 656.59, y = 434.97},
	["TheStockade"] = {x = 378.153, y = 252.1025},
	["TheTempleOfAtalHakkar"] = {x = 695.029, y = 463.353},
	["TheTempleOfAtalHakkar2f"] = {x = 248.17677, y = 166.0355},
	["TheTempleOfAtalHakkar3f"] = {x = 556.1692, y = 370.388},
	["ThousandNeedles"] = {x = 4399.9997, y = 2933.333},
	["ThunderBluff"] = {x = 1043.7499, y = 695.8331},
	["Tirisfal"] = {x = 4518.75, y = 3012.5001},
	["Uldaman"] = {x = 893.668, y = 595.779},
	["UldamanEntrance"] = {x = 563.31, y = 376.1},
	["Undercity"] = {x = 959.375, y = 640.104},
	["UngoroCrater"] = {x = 3700.0003, y = 2466.666},
	["WailingCaverns"] = {x = 936.475, y = 624.316},
	["WailingCavernsEntrance"] = {x = 572.777, y = 381.849},
	["WarsongGulch"] = {x = 1145.8337, y = 764.5831},
	["WesternPlaguelands"] = {x = 4299.9997, y = 2866.667},
	["Westfall"] = {x = 3500.0003, y = 2333.33},
	["Wetlands"] = {x = 4135.4167, y = 2756.25},
	["Winterspring"] = {x = 7100.0003, y = 4733.333},
	["WinterVeilVale"] = {x = 1432, y = 977},
	["ZulFarrak"] = {x = 1383.3333, y = 922.916},
	["ZulGurub"] = {x = 2120.833, y = 1414.58}
}
LibrangeCalc = {}

-- Lifted from the Twister addon --https://github.com/MarcelineVQ/Twister
-- Function to calculate distance between two points in 3D space
function LibrangeCalc:distance(x1,y1,z1,x2,y2,z2)
  local dx = x2 - x1
  local dy = y2 - y1
  local dz = z2 - z1
  return math.sqrt(dx^2 + dy^2 + dz^2)
end

function LibrangeCalc:InRange(unit, range, unit2,x,y)
  -- Determine the source based on the unit2 parameter
  local source = unit2 or "player"
  local distance
  if not UnitExists(unit) then return nil end
  if not UnitCanAssist(unit, source) then return nil end
  if UnitIsCharmed(unit) or UnitIsCharmed(unit2) then return nil end
  if superwow_active then
    distance = GetSuperWoWDistance(source,unit)
  else
    distance = GetWorldDistance(x,y)
  end
  return distance < range and 1 or nil
end

function GetSuperWoWDistance(source, unit)
  local x1, y1, z1 = UnitPosition(source)
  local x2, y2, z2 = UnitPosition(unit)
  -- Check for Tauren race to adjust range
  local r = { UnitRace(source),UnitRace(unit) }
  local raceAdjustment = (r[2] == "TAUREN" or r[4] == "TAUREN") and 5 or 3
  -- Calculate distance and adjust based on race
  local distance = LibrangeCalc:distance(x1, y1, z1, x2, y2, z2)
  local adjustedDistance = distance - raceAdjustment
  return adjustedDistance
end

-- Lifted from NotGrid Addon --https://github.com/gnwl/NotGrid/
function GetMapSizes()
	local mapSizes = Default
	local RealmName = GetRealmName()
	if RealmName == "Turtle WoW" or RealmName == "Tel'Abim" or RealmName == "Nordanaar" then
    mapSizes = Turtle_WoW
	end
  return mapSizes
end

function GetWorldDistance(ux,uy) -- Thanks to Rhena/Renew/Astrolabe
	local px, py, distance
  local mapSizes = GetMapSizes()
  local mapFileName = GetMapFileName()
	px, py = GetPlayerMapPosition("player") 
	if mapFileName and mapSizes[mapFileName] and px ~= 0 and ux ~= 0 then -- we check player and unit against absolute 0 as returning such is likely an out of bounds map error. if such is the case we'll return a nil distance
		local xdelta = (px - ux)*mapSizes[mapFileName].x -- (px-ux) gives distance in percentage units, multiply by mapsize to convert to wow units.
		local ydelta = (py - uy)*mapSizes[mapFileName].y
		distance = sqrt(xdelta^2 + ydelta^2)*(40/42.9) -- Then use maths distance formula for two points on a grid. include a modifiier of (40/42.9) because there seems to be 40 spell yards per 42.9 wow gps units.
	end
	return distance
end

function GetMapFileName()
	SetMapToCurrentZone()
	local mapFileName, _, _ = GetMapInfo()
	return mapFileName
end