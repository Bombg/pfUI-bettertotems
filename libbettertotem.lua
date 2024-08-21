-- load pfUI environment
setfenv(1, pfUI:GetEnvironment())

-- return instantly if we're not on a vanilla client
if pfUI.client > 11200 then return end
if LibBetterTotem then return end


MAX_TOTEMS       = MAX_TOTEMS       or 4
FIRE_TOTEM_SLOT  = FIRE_TOTEM_SLOT  or 1
EARTH_TOTEM_SLOT = EARTH_TOTEM_SLOT or 2
WATER_TOTEM_SLOT = WATER_TOTEM_SLOT or 3
AIR_TOTEM_SLOT   = AIR_TOTEM_SLOT   or 4

local _, class = UnitClass("player")

local libtotem
local nameIconMap = {}
local queue = { ["slot"] = nil, ["name"] = nil, ["start"] = nil, ["duration"] = nil, ["icon"] = nil }
local active = { [1] = {}, [2] = {}, [3] = {}, [4] = {} }
local totems = {
  [FIRE_TOTEM_SLOT] = {
    --Fire Nova Totem (Fire)
    ["Spell_Fire_SealOfFire"] = {[-1] = 5},
    --Flametongue Totem (Fire)
    ["Spell_Nature_GuardianWard"] = {[-1] = 120},
    --Frost Resistance Totem (Fire)
    ["Spell_FrostResistanceTotem_01"] = {[-1] = 120},
    --Magma Totem (Fire)
    ["Spell_Fire_SelfDestruct"] = {[-1] = 20},
    --Searing Totem (Fire)
    ["Spell_Fire_SearingTotem"] = {[-1] = 55,[1] = 30,[2] = 35,[3] = 40,[4] = 45,[5] = 50,[6] = 55},
  },
  [EARTH_TOTEM_SLOT] = {
    --Earthbind Totem (Earth)
    ["Spell_Nature_StrengthOfEarthTotem02"] = {[-1] = 45},
    --Stoneclaw Totem (Earth)
    ["Spell_Nature_StoneClawTotem"] = {[-1] = 15},
    --Stoneskin Totem (Earth)
    ["Spell_Nature_StoneSkinTotem"] = {[-1] = 120},
    --Strength of Earth Totem (Earth)
    ["Spell_Nature_EarthBindTotem"] = {[-1] = 120},
    --Tremor Totem (Earth)
    ["Spell_Nature_TremorTotem"] = {[-1] = 120},
  },
  [WATER_TOTEM_SLOT] = {
    -- Disease Cleansing Totem (Water)
    ["Spell_Nature_DiseaseCleansingTotem"] = {[-1] = 120},
    --Fire Resistance Totem (Water)
    ["Spell_FireResistanceTotem_01"] = {[-1] = 120},
    --Healing Stream Totem (Water)
    ["INV_Spear_04"] = {[-1] = 60},
    --Mana Spring Totem (Water)
    ["Spell_Nature_ManaRegenTotem"] = {[-1] = 60},
    --Mana Tide Totem (Water)
    ["Spell_Frost_SummonWaterElemental"] = {[-1] = 12},
    --Poison Cleansing Totem (Water)
    ["Spell_Nature_PoisonCleansingTotem"] = {[-1] = 120},
  },
  [AIR_TOTEM_SLOT] = {
    --Grace of Air Totem (Air)
    ["Spell_Nature_InvisibilityTotem"] = {[-1] = 120},
    --Grounding Totem (Air)
    ["Spell_Nature_GroundingTotem"] = {[-1] = 45},
    --Nature Resistance Totem (Air)
    ["Spell_Nature_NatureResistanceTotem"] = {[-1] = 120},
    --Tranquil Air Totem (Air)
    ["Spell_Nature_Brilliance"] = {[-1] = 120},
    --Windfury Totem (Air)
    ["Spell_Nature_Windfury"] = {[-1] = 120},
    --Windwall Totem (Air)
    ["Spell_Nature_EarthBind"] = {[-1] = 120},
  },
}

GetBetterTotemInfo = function(id)
  if not active[id] or not active[id].name then return end
  if GetRemainingDuration(id) < 0 or IsTotemDestroyed(id) then
    libtotem:Clean(id)
    return nil
  end

  return 1, active[id].name, active[id].start, active[id].duration, active[id].icon, active[id].unitId
end

if class ~= "SHAMAN" then return end

libtotem = CreateFrame("Frame")
libtotem:RegisterEvent("SPELLCAST_STOP")
libtotem:RegisterEvent("UNIT_MODEL_CHANGED")
libtotem:RegisterEvent("PLAYER_DEAD")
libtotem:SetScript("OnEvent", function()
  if event == "PLAYER_DEAD" then
    for i = 1,4 do
      libtotem:Clean(i)
    end
  elseif event == "UNIT_MODEL_CHANGED" then
    local unitId  = arg1
    local unitName = UnitName(unitId)
  
    if string.find(unitName, "Totem") and UnitName(unitId .. "owner") == UnitName("player") then
      local key = GetKeyIndexIfExists(nameIconMap,unitName)
      if key then
        local icon = nameIconMap[key]
        active[GetTotemSlot(icon)].unitId = unitId
      end
    end
  elseif event == "SPELLCAST_STOP" then
    if queue.slot and queue.name then
      active[queue.slot].name = queue.name
      active[queue.slot].duration = queue.duration
      active[queue.slot].icon = queue.icon
      active[queue.slot].start = GetTime()
      queue.slot = nil
      queue.name = nil
    end
  end
end)

libtotem.totems = totems

libtotem.Clean = function(self, slot)
  active[slot].name = nil
  active[slot].start = nil
  active[slot].duration = nil
  active[slot].icon = nil
  active[slot].unitId = nil
end

libtotem.CheckAddQueue = function(self, name, rank, icon)
  for slot = 1, 4 do
    for texture, data in pairs(totems[slot]) do
      if string.find(icon, texture, 1) then
        if rank then -- try to obtain plain rank number
          _, _, rank = string.find(rank,"%s(%d+)")
        end
        queue.slot = slot
        queue.name = name
        queue.icon = icon
        nameIconMap[name] = icon
        if rank and tonumber(rank) and data[tonumber(rank)] then
          queue.duration = data[tonumber(rank)]
        else
          queue.duration = data[-1]
        end
        return true
      end
    end
  end
  return nil
end

function GetKeyIndexIfExists(table, contains)
  local index = nil
  if table and contains and type(table) == "table" then
    for k, v in pairs(table) do
      if string.find(contains, k) then 
        index = k
      end
    end
  end
  return index
end

function GetTotemSlot(icon)
  local totemSlot
  for slot = 1, 4 do
    for texture, data in pairs(totems[slot]) do
      if string.find(icon, texture, 1) then
        totemSlot = slot
        return totemSlot
      end
    end
  end
  return totemSlot
end

function IsTotemTransition(id)
  local transitioning = false
  if active[id].unitId and active[id].name == nil or active[id].unitId == nil and active[id].name or queue.name ~= nil then
    transitioning = true
  end
  return transitioning
end

function IsTotemDestroyed(id)
  local destroyed  = false
  if not IsTotemTransition(id) and not UnitExists(active[id].unitId) and active[id].duration - GetRemainingDuration(id) > 1 then
    destroyed = true
  end
  return destroyed
end

function GetRemainingDuration(id)
  local timeLeft
  if id then
    timeLeft = active[id].start + active[id].duration - GetTime()
  end
  return timeLeft
end

function IsTableEmpty (table)
  local isEmpty = true
  if type(table) == "table" then 
      for _, _ in pairs(table) do
          isEmpty = false
      end
  end
  return isEmpty
end

LibBetterTotem = libtotem


-- Check for totem spell casts
hooksecurefunc("CastSpell", function(id, bookType)
  local name, rank, icon = libspell.GetSpellInfo(id, bookType)
  if not name then return end
  if libtotem:CheckAddQueue(name, rank, icon) then return end
end, true)

hooksecurefunc("CastSpellByName", function(effect, target)
  local name, rank, icon = libspell.GetSpellInfo(effect)
  if not name then return end
  if libtotem:CheckAddQueue(name, rank, icon) then return end
end, true)

local scanner = libtipscan:GetScanner("prediction")
hooksecurefunc("UseAction", function(slot, target, selfcast)
  if GetActionText(slot) or not IsCurrentAction(slot) then return end
  scanner:SetAction(slot)
  local name, rank = scanner:Line(1)
  local icon = GetActionTexture(slot)
  if not name then return end
  if libtotem:CheckAddQueue(name, rank, icon) then return end
end, true)
