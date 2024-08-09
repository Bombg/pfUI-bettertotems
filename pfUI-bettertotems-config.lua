setfenv(1, pfUI:GetEnvironment())
if pfUI_config then
  if pfUI_config.disabled.totems and pfUI_config.disabled.totems == "0" and not pfUI_config.bettertotems.asked then
    CreateQuestionDialog(
        "The default pfUI totem module is enabled." .. "\n" .."You don't need it if you're running Better Totems" .. "\nDo you want to disable it and reload?",
        {"Yes", function()
            pfUI_config.disabled.totems = "1"
            ReloadUI()
        end},
        {"No", function() end},
        nil)
        pfUI:UpdateConfig("bettertotems", nil,           "asked",            "1")
  end
end
pfUI:UpdateConfig("bettertotems", nil,           "recall",            "1")
pfUI:UpdateConfig("bettertotems", nil,           "recallRange",            45)

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
