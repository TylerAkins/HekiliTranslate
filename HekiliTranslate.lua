local frame = CreateFrame("Frame", "HekiliTranslateFrame")
local icon = frame:CreateTexture(nil, "OVERLAY")
frame:SetFrameStrata("HIGH")
frame:SetSize(8, 8)
frame:SetPoint("TOPLEFT", 1, -1)
icon:SetAllPoints(frame)

SLASH_PRIORITIESTOGGLE1 = "/prioritiestoggle"
SlashCmdList["PRIORITIESTOGGLE"] = function(msg)
    if HekiliTranslateFrame:IsShown() then 
        HekiliTranslateFrame:Hide() 
        print("PrioritiesFrame hidden.")
    else 
        HekiliTranslateFrame:Show() 
        print("PrioritiesFrame shown.")
    end
end

-- Define RGB values for each keybind (16 randomly generated colors)
local keyColors = {
    ["1"] = {204/255, 25/255, 25/255},
    ["2"] = {25/255, 204/255, 25/255},
    ["3"] = {51/255, 102/255, 204/255},
    ["4"] = {204/255, 204/255, 25/255},
    ["5"] = {178/255, 102/255, 204/255},
    ["6"] = {25/255, 178/255, 178/255},
    ["7"] = {204/255, 102/255, 25/255},
    ["8"] = {102/255, 204/255, 25/255},
    ["9"] = {204/255, 25/255, 102/255},
    ["F1"] = {25/255, 25/255, 204/255},
    ["F2"] = {102/255, 25/255, 204/255},
    ["F3"] = {204/255, 51/255, 25/255},
    ["F4"] = {25/255, 204/255, 102/255},
    ["F5"] = {204/255, 25/255, 178/255},
    ["F6"] = {25/255, 178/255, 25/255},
    ["F7"] = {102/255, 102/255, 102/255},
    ["F8"] = {58/255, 97/255, 111/255},
}

local function SetPixelColor(color)
    if color then
        icon:SetColorTexture(color[1], color[2], color[3], 1)
    end
end

local function GetKeybindFromHekili()
    local frame = _G["Hekili_Primary_B1"]
    if frame and frame.Keybind then
        return frame.Keybind
    else
        return nil
    end
end

-- Function to retrieve and display keybind colors
local function DisplayKeybindColor()
    local keybind = GetKeybindFromHekili()
    local color = keyColors[keybind]
    if color then
        SetPixelColor(color)
    else
        -- Default color or handling for cases when keybind is not found
        SetPixelColor({1, 1, 1}) -- Default to white
    end
end

local function UpdateColor()
    C_Timer.After(0.01, function() -- 0.01 seconds (10ms)
        DisplayKeybindColor()
        UpdateColor() -- Call itself to update again after 10ms
    end)
end

-- Register events and set up the frame
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent", function(self, event, arg1)
    if event == "PLAYER_ENTERING_WORLD" then
        UpdateColor() -- Start updating the color every 10ms
        frame:Show()
    end
end)