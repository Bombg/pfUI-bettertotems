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