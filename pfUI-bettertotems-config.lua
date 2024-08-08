setfenv(1, pfUI:GetEnvironment())
pfUI:UpdateConfig("bettertotems", nil,           "enabled",            nil)
-- if pfUI_config then
--     if pfUI_config["disabled"]["totems"] and pfUI_config["disabled"]["totems"] == "0" then
--         CreateQuestionDialog(
--             "The default pfUI totem module is enabled." .. "\n"
--             .. T["Do you want to disable it and reload?"],
--             {"Yes", function()
--                 pfUI_config["disabled"]["totems"] = "1"
--                 ReloadUI()
--             end},
--             {"No", function() end},
--             nil)
--     end
    
-- end
-- if pfUI_config and pfUI_config["bettertotems"]["enabled"] == nil then
--     -- print("penis")
    
-- end