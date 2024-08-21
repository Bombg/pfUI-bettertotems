setfenv(1, pfUI:GetEnvironment())
local _, class = UnitClass("player")
if class ~= "SHAMAN" then return end
local btcFrame = CreateFrame("Frame")

btcFrame:RegisterEvent("VARIABLES_LOADED")
btcFrame:SetScript("OnEvent", function ()
  if event == "VARIABLES_LOADED" then
    InitializeDefaultValues()
    AskToDisable()
    CreateGuiConfigEntries()
  end
end)

function InitializeDefaultValues()
  if pfUI_config and not DoesTableContainKeyBT(pfUI_config, "bettertotems") then
    pfUI_config.bettertotems = {}
  end
  if pfUI_config and not DoesTableContainKeyBT(pfUI_config.bettertotems, "asked") then
    pfUI:UpdateConfig("bettertotems", nil,           "asked",            0)
  end
  if pfUI_config and not DoesTableContainKeyBT(pfUI_config.bettertotems, "recallRange") then
    pfUI:UpdateConfig("bettertotems", nil,           "recallRange",           45)
  end
  if pfUI_config and not DoesTableContainKeyBT(pfUI_config.bettertotems, "recall") then
    pfUI:UpdateConfig("bettertotems", nil,           "recall",           "1")
  end
end

function AskToDisable()
  if pfUI_config and pfUI_config.disabled.totems and pfUI_config.disabled.totems == "0" and pfUI_config.bettertotems.asked == 0 then
    CreateQuestionDialog(
        "The default pfUI totem module is enabled." .. "\n" .."You don't need it if you're running Better Totems" .. "\nDo you want to disable it and reload?",
        {"Yes", function()
            pfUI_config.disabled.totems = "1"
            ReloadUI()
        end},
        {"No", function() end},
        nil)
        pfUI_config.bettertotems.asked = 1
  end
end

function CreateGuiConfigEntries ()
    local CreateConfig = pfUI.gui.CreateConfig
    local CreateGUIEntry = pfUI.gui.CreateGUIEntry
    local U = pfUI.gui.UpdaterFunctions
    CreateGUIEntry(T["Thirdparty"], T["Better Totems"], function()
      CreateConfig(U["bettertotems"], T["Enable Recall Warning"], C.bettertotems, "recall", "checkbox")
      CreateConfig(U["bettertotems"], T["Recall Warning Range"], C.bettertotems, "recallRange", "text", nil, nil, nil, "number")
      CreateConfig(U["bettertotems"], T["Website"], nil, nil, "button", function()
        pfUI.chat.urlcopy.CopyText("https://github.com/Bombg/pfUI-bettertotems")
      end)
    end)
end

DoesTableContainKeyBT = function (table, contains)
  return table[contains] ~= nil
end
