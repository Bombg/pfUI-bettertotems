-- Most of the code from this file is from
-- https://github.com/MarcelineVQ/Twister
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
  distance = GetSuperWoWDistance(source,unit)
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