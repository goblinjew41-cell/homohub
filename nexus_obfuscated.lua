-- ============================================
-- NEXUS ULTIMATE - COMPLETE EDITION
-- ============================================
-- Kill old menus
for _, v in ipairs(game.CoreGui:GetChildren()) do
    if v.Name:find("Nexus") then v:Destroy() end
end
task.wait(0.5)

-- ============================================
-- WHITELIST SYSTEM
-- Add usernames below to grant access
-- ============================================
local whitelist = {
    "goblinjeu", "shalom_goya" -- Add usernames here
}

local playerName = game:GetService("Players").LocalPlayer.Name
local whitelisted = false
for _, name in ipairs(whitelist) do
    if playerName:lower() == name:lower() then
        whitelisted = true
        break
    end
end

if not whitelisted then
    local denyGui = Instance.new("ScreenGui")
    denyGui.Parent = game.CoreGui
    denyGui.ResetOnSpawn = false
    denyGui.DisplayOrder = 99999
    local denyFrame = Instance.new("Frame")
    denyFrame.Parent = denyGui
    denyFrame.Size = UDim2.new(1, 0, 1, 0)
    denyFrame.BackgroundColor3 = Color3.fromRGB(10, 0, 8)
    denyFrame.BorderSizePixel = 0
    local denyLabel = Instance.new("TextLabel")
    denyLabel.Parent = denyFrame
    denyLabel.Size = UDim2.new(1, 0, 0, 50)
    denyLabel.Position = UDim2.new(0, 0, 0.45, 0)
    denyLabel.BackgroundTransparency = 1
    denyLabel.Text = "N E X U S"
    denyLabel.TextColor3 = Color3.fromRGB(255, 140, 0)
    denyLabel.Font = Enum.Font.GothamBold
    denyLabel.TextSize = 28
    denyLabel.TextXAlignment = Enum.TextXAlignment.Center
    local denyMsg = Instance.new("TextLabel")
    denyMsg.Parent = denyFrame
    denyMsg.Size = UDim2.new(1, 0, 0, 30)
    denyMsg.Position = UDim2.new(0, 0, 0.55, 0)
    denyMsg.BackgroundTransparency = 1
    denyMsg.Text = "You are not whitelisted."
    denyMsg.TextColor3 = Color3.fromRGB(200, 80, 80)
    denyMsg.Font = Enum.Font.Gotham
    denyMsg.TextSize = 16
    denyMsg.TextXAlignment = Enum.TextXAlignment.Center
    return
end

-- LAUNCH SCREEN
local launchGui = Instance.new("ScreenGui")
launchGui.Parent = game.CoreGui
launchGui.Name = "NexusLaunch"
launchGui.Enabled = true
launchGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
launchGui.DisplayOrder = 9999
launchGui.ResetOnSpawn = false

local launchFrame = Instance.new("Frame")
launchFrame.Parent = launchGui
launchFrame.Size = UDim2.new(1, 0, 1, 0)
launchFrame.BackgroundColor3 = Color3.fromRGB(10, 0, 8)
launchFrame.BackgroundTransparency = 0
launchFrame.BorderSizePixel = 0

local glowRing = Instance.new("Frame")
glowRing.Parent = launchFrame
glowRing.Size = UDim2.new(0, 320, 0, 320)
glowRing.Position = UDim2.new(0.5, -160, 0.5, -185)
glowRing.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
glowRing.BackgroundTransparency = 0.7
glowRing.BorderSizePixel = 0
local glowCorner = Instance.new("UICorner")
glowCorner.CornerRadius = UDim.new(1, 0)
glowCorner.Parent = glowRing

local midRing = Instance.new("Frame")
midRing.Parent = launchFrame
midRing.Size = UDim2.new(0, 280, 0, 280)
midRing.Position = UDim2.new(0.5, -140, 0.5, -165)
midRing.BackgroundColor3 = Color3.fromRGB(13, 0, 16)
midRing.BackgroundTransparency = 0
midRing.BorderSizePixel = 0
local midCorner = Instance.new("UICorner")
midCorner.CornerRadius = UDim.new(1, 0)
midCorner.Parent = midRing

local innerCircle = Instance.new("Frame")
innerCircle.Parent = launchFrame
innerCircle.Size = UDim2.new(0, 240, 0, 240)
innerCircle.Position = UDim2.new(0.5, -120, 0.5, -145)
innerCircle.BackgroundColor3 = Color3.fromRGB(8, 0, 12)
innerCircle.BackgroundTransparency = 0
innerCircle.BorderSizePixel = 0
local innerCorner = Instance.new("UICorner")
innerCorner.CornerRadius = UDim.new(1, 0)
innerCorner.Parent = innerCircle

local nLabel = Instance.new("TextLabel")
nLabel.Parent = launchFrame
nLabel.Size = UDim2.new(0, 240, 0, 220)
nLabel.Position = UDim2.new(0.5, -120, 0.5, -155)
nLabel.BackgroundTransparency = 1
nLabel.Text = "N"
nLabel.TextColor3 = Color3.fromRGB(255, 165, 0)
nLabel.Font = Enum.Font.Fondamento
nLabel.TextSize = 180
nLabel.TextXAlignment = Enum.TextXAlignment.Center
nLabel.TextStrokeTransparency = 0.6
nLabel.TextStrokeColor3 = Color3.fromRGB(180, 80, 0)
nLabel.TextTransparency = 1

local nexusLabel = Instance.new("TextLabel")
nexusLabel.Parent = launchFrame
nexusLabel.Size = UDim2.new(0, 300, 0, 40)
nexusLabel.Position = UDim2.new(0.5, -150, 0.5, 80)
nexusLabel.BackgroundTransparency = 1
nexusLabel.Text = "N E X U S"
nexusLabel.TextColor3 = Color3.fromRGB(255, 140, 0)
nexusLabel.Font = Enum.Font.GothamBold
nexusLabel.TextSize = 24
nexusLabel.TextTransparency = 1
nexusLabel.TextStrokeTransparency = 1

local loadingLabel = Instance.new("TextLabel")
loadingLabel.Parent = launchFrame
loadingLabel.Size = UDim2.new(0, 300, 0, 30)
loadingLabel.Position = UDim2.new(0.5, -150, 0.5, 130)
loadingLabel.BackgroundTransparency = 1
loadingLabel.Text = "Loading..."
loadingLabel.TextColor3 = Color3.fromRGB(180, 100, 0)
loadingLabel.Font = Enum.Font.Gotham
loadingLabel.TextSize = 16
loadingLabel.TextTransparency = 1

-- Animate launch screen
for i = 0, 1, 0.04 do
    nLabel.TextTransparency = 1 - i
    nLabel.TextStrokeTransparency = 1 - (i * 0.4)
    task.wait(0.02)
end

for i = 0, 1, 0.05 do
    nexusLabel.TextTransparency = 1 - i
    task.wait(0.02)
end

for i = 0, 1, 0.08 do
    loadingLabel.TextTransparency = 1 - i
    task.wait(0.02)
end

for pulse = 1, 3 do
    for i = 0, 1, 0.1 do
        glowRing.BackgroundTransparency = 0.7 - (i * 0.3)
        task.wait(0.03)
    end
    for i = 0, 1, 0.1 do
        glowRing.BackgroundTransparency = 0.4 + (i * 0.3)
        task.wait(0.03)
    end
end

for i = 0, 1, 0.04 do
    local t = i
    nLabel.TextTransparency = t
    nexusLabel.TextTransparency = t
    loadingLabel.TextTransparency = t
    launchFrame.BackgroundTransparency = t
    glowRing.BackgroundTransparency = 0.7 + (t * 0.3)
    midRing.BackgroundTransparency = t
    innerCircle.BackgroundTransparency = t
    task.wait(0.02)
end

launchGui:Destroy()
task.wait(0.3)

-- SERVICES
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local VirtualUser = game:GetService("VirtualUser")
local CoreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local camera = Workspace.CurrentCamera
repeat task.wait() until LocalPlayer.Character

-- WATERMARK
local watermarkGui = Instance.new("ScreenGui")
watermarkGui.Parent = CoreGui
watermarkGui.Name = "NexusWatermark"
watermarkGui.ResetOnSpawn = false
watermarkGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
watermarkGui.DisplayOrder = 999
watermarkGui.Enabled = true
watermarkGui.IgnoreGuiInset = true
local watermarkHolder = Instance.new("Frame")
watermarkHolder.Parent = watermarkGui
watermarkHolder.Size = UDim2.new(0.4, 0, 0, 35)
watermarkHolder.Position = UDim2.new(0, 10, 0, 10)
watermarkHolder.BackgroundColor3 = Color3.new(0, 0, 0)
watermarkHolder.BackgroundTransparency = 0.3
watermarkHolder.BorderSizePixel = 0
watermarkHolder.Active = false
local watermarkCorner = Instance.new("UICorner")
watermarkCorner.CornerRadius = UDim.new(0, 8)
watermarkCorner.Parent = watermarkHolder
local watermarkText = Instance.new("TextLabel")
watermarkText.Parent = watermarkHolder
watermarkText.Size = UDim2.new(1, 0, 1, 0)
watermarkText.BackgroundTransparency = 1
watermarkText.TextColor3 = Color3.new(1, 0.5, 0)
watermarkText.Text = "NEXUS | Loading..."
watermarkText.Font = Enum.Font.GothamBold
watermarkText.TextScaled = true
watermarkText.TextXAlignment = Enum.TextXAlignment.Center

-- SETTINGS
local settings = {
    autoFarm = false,
    fastAttack = false,
    longReach = false,
    mobAura = false,
    bringMobs = false,
    farmHeight = 15,
    attackSpeed = 0.05,
    attackRange = 1000,
    autoHitter = false,
    hitterRange = 25,
    hitterCPS = 20,
    flyEnabled = false,
    flySpeed = 50,
    autoQuest = false,
    autoFarmLevel = false,
    autoFarmNearest = false,
    attackPlayers = false,
    autoTravel = false,
    fruitSniper = false,
    autoStore = false,
    snipeDelay = 1,
    fruitRarity = {
        Mythic =    {action = "Store",   autoStore = false},
        Legendary = {action = "Store",  autoStore = true},
        Epic =      {action = "Warn",  autoStore = true},
        Rare =      {action = "Warn",  autoStore = true},
        Common =    {action = "Warn", autoStore = false},
    },
    playerESP = false,
    fruitESP = false,
    chestESP = false,
    showDistance = true,
    showHealth = true,
    showName = true,
    espColor = Color3.new(1, 0, 0),
    espRainbow = false,
    worldVisuals = false,
    brightMode = false,
    darkMode = false,
    xRay = false,
    removeFog = false,
    removeWater = false,
    removeLava = false,
    removeTrees = false,
    removeRocks = false,
    removeGrass = false,
    removeClouds = false,
    speedEnabled = false,
    speedValue = 16,
    jumpEnabled = false,
    jumpValue = 50,
    walkOnWater = false,
    noClip = false,
    antiAfk = false,
    autoStats = false,
    statPriority = "Melee",
    travelSpeed = 250,
    autoHaki = false,
    autoMastery = false,
    masteryWeapon = "Combat",
    serverHop = false,
    serverHopMinPlayers = 5,
    killAuraIndicator = false,
    mobESP = false,
    islandESP = false,
}

-- QUEST PROGRESS TRACKING
local questProgress = 0
local questComplete = false
local lastProgressCheck = 0
local commF = ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("CommF_")

-- UTILITY FUNCTIONS
local function getHRP(char)
    if not char then return nil end
    return char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
end

local function getPlayerLevel()
    local data = LocalPlayer:FindFirstChild("Data")
    if data then
        local level = data:FindFirstChild("Level")
        return level and level.Value or 0
    end
    return 0
end

local function getCurrentSea()
    if game.PlaceId == 2753915549 then return "First" end
    if game.PlaceId == 4442272183 then return "Second" end
    if game.PlaceId == 7449423635 then return "Third" end
    return "Unknown"
end

local function getPlayerSide()
    local team = LocalPlayer.Team
    if team then
        local name = team.Name:lower()
        if name:find("marine") then return "Marine" end
        if name:find("pirate") then return "Pirate" end
    end
    local data = LocalPlayer:FindFirstChild("Data")
    if data then
        local side = data:FindFirstChild("Alignment") or data:FindFirstChild("Side") or data:FindFirstChild("Team")
        if side then
            local val = tostring(side.Value):lower()
            if val:find("marine") then return "Marine" end
            if val:find("pirate") then return "Pirate" end
        end
    end
    return "Unknown"
end

local function notify(msg)
    pcall(function()
        StarterGui:SetCore("SendNotification", {Title = "NEXUS", Text = msg, Duration = 2})
    end)
end

-- ============================================
-- QUEST DATABASE
-- ============================================
local questDatabase = {
    -- FIRST SEA
    {name="Trainee",              questName="MarineQuest",      index=1, level=0,    sea="First",  island="Marine Starter",   mobs={"Trainee"},                side="Marine"},
    {name="Bandit",               questName="BanditQuest1",     index=1, level=0,    sea="First",  island="Pirate Starter",   mobs={"Bandit"},                 side="Pirate"},
    {name="Monkey",               questName="JungleQuest",      index=1, level=10,   sea="First",  island="Jungle",           mobs={"Monkey"}},
    {name="Gorilla",              questName="JungleQuest",      index=2, level=15,   sea="First",  island="Jungle",           mobs={"Gorilla"}},
    {name="Gorilla King",         questName="JungleQuest",      index=3, level=20,   sea="First",  island="Jungle",           mobs={"Gorilla King"},           boss=true},
    {name="Pirate",               questName="PirateQuest",      index=1, level=30,   sea="First",  island="Pirate Village",   mobs={"Pirate"}},
    {name="Brute",                questName="PirateQuest",      index=2, level=40,   sea="First",  island="Pirate Village",   mobs={"Brute"}},
    {name="Chef",                 questName="PirateQuest",      index=3, level=55,   sea="First",  island="Pirate Village",   mobs={"Chef"},                   boss=true},
    {name="Desert Bandit",        questName="DesertQuest",      index=1, level=60,   sea="First",  island="Desert",           mobs={"Desert Bandit"}},
    {name="Desert Officer",       questName="DesertQuest",      index=2, level=75,   sea="First",  island="Desert",           mobs={"Desert Officer"}},
    {name="Snow Bandit",          questName="SnowQuest",        index=1, level=90,   sea="First",  island="Frozen Village",   mobs={"Snow Bandit"}},
    {name="Snowman",              questName="SnowQuest",        index=2, level=100,  sea="First",  island="Frozen Village",   mobs={"Snowman"}},
    {name="Yeti",                 questName="SnowQuest",        index=3, level=105,  sea="First",  island="Frozen Village",   mobs={"Yeti"},                   boss=true},
    {name="Chief Petty Officer",  questName="MarineQuest2",     index=1, level=120,  sea="First",  island="Marine Ford",      mobs={"Chief Petty Officer"}},
    {name="Vice Admiral",         questName="MarineQuest2",     index=2, level=130,  sea="First",  island="Marine Ford",      mobs={"Vice Admiral"},           boss=true},
    {name="Sky Bandit",           questName="SkyQuest",         index=1, level=150,  sea="First",  island="Lower Skylands",   mobs={"Sky Bandit"}},
    {name="Dark Master",          questName="SkyQuest",         index=2, level=175,  sea="First",  island="Lower Skylands",   mobs={"Dark Master"}},
    {name="Prisoner",             questName="PrisonerQuest",    index=1, level=190,  sea="First",  island="Prison",           mobs={"Prisoner"}},
    {name="Dangerous Prisoner",   questName="PrisonerQuest",    index=2, level=210,  sea="First",  island="Prison",           mobs={"Dangerous Prisoner"}},
    {name="Warden",               questName="ImpelQuest",       index=1, level=220,  sea="First",  island="Prison",           mobs={"Warden"},                 boss=true},
    {name="Chief Warden",         questName="ImpelQuest",       index=2, level=230,  sea="First",  island="Prison",           mobs={"Chief Warden"},           boss=true},
    {name="Swan",                 questName="ImpelQuest",       index=3, level=240,  sea="First",  island="Prison",           mobs={"Swan"},                   boss=true},
    {name="Toga Warrior",         questName="ColosseumQuest",   index=1, level=250,  sea="First",  island="Colosseum",        mobs={"Toga Warrior"}},
    {name="Gladiator",            questName="ColosseumQuest",   index=2, level=275,  sea="First",  island="Colosseum",        mobs={"Gladiator"}},
    {name="Military Soldier",     questName="MagmaQuest",       index=1, level=300,  sea="First",  island="Magma Village",    mobs={"Military Soldier"}},
    {name="Military Spy",         questName="MagmaQuest",       index=2, level=325,  sea="First",  island="Magma Village",    mobs={"Military Spy"}},
    {name="Magma Admiral",        questName="MagmaQuest",       index=3, level=350,  sea="First",  island="Magma Village",    mobs={"Magma Admiral"}},
    {name="Fishman Warrior",      questName="FishmanQuest",     index=1, level=375,  sea="First",  island="Underwater City",  mobs={"Fishman Warrior"}},
    {name="Fishman Commando",     questName="FishmanQuest",     index=2, level=400,  sea="First",  island="Underwater City",  mobs={"Fishman Commando"}},
    {name="Fishman Lord",         questName="FishmanQuest",     index=3, level=425,  sea="First",  island="Underwater City",  mobs={"Fishman Lord"},           boss=true},
    {name="God's Guard",          questName="SkyExp1Quest",     index=1, level=450,  sea="First",  island="Upper Skylands 1", mobs={"God's Guard"}},
    {name="Shanda",               questName="SkyExp1Quest",     index=2, level=475,  sea="First",  island="Upper Skylands 1", mobs={"Shanda"}},
    {name="Wysper",               questName="SkyExp1Quest",     index=3, level=500,  sea="First",  island="Upper Skylands 1", mobs={"Wysper"},                 boss=true},
    {name="Royal Squad",          questName="SkyExp2Quest",     index=1, level=525,  sea="First",  island="Upper Skylands 2", mobs={"Royal Squad"}},
    {name="Royal Soldier",        questName="SkyExp2Quest",     index=2, level=550,  sea="First",  island="Upper Skylands 2", mobs={"Royal Soldier"}},
    {name="Thunder God",          questName="SkyExp2Quest",     index=3, level=575,  sea="First",  island="Upper Skylands 2", mobs={"Thunder God"},            boss=true},
    {name="Galley Pirate",        questName="FountainQuest",    index=1, level=625,  sea="First",  island="Fountain City",    mobs={"Galley Pirate"}},
    {name="Galley Captain",       questName="FountainQuest",    index=2, level=650,  sea="First",  island="Fountain City",    mobs={"Galley Captain"}},
    {name="Cyborg",               questName="FountainQuest",    index=3, level=675,  sea="First",  island="Fountain City",    mobs={"Cyborg"},                 boss=true},
    -- SECOND SEA
    {name="Raider",               questName="Area1Quest",       index=1, level=700,  sea="Second", island="Kingdom of Rose",  mobs={"Raider"}},
    {name="Mercenary",            questName="Area1Quest",       index=2, level=725,  sea="Second", island="Kingdom of Rose",  mobs={"Mercenary"}},
    {name="Diamond",              questName="Area1Quest",       index=3, level=750,  sea="Second", island="Kingdom of Rose",  mobs={"Diamond"}},
    {name="Swan Pirate",          questName="Area2Quest",       index=1, level=775,  sea="Second", island="Kingdom of Rose",  mobs={"Swan Pirate"}},
    {name="Factory Staff",        questName="Area2Quest",       index=2, level=825,  sea="Second", island="Kingdom of Rose",  mobs={"Factory Staff"}},
    {name="Jeremy",               questName="Area2Quest",       index=3, level=850,  sea="Second", island="Kingdom of Rose",  mobs={"Jeremy"},                 boss=true},
    {name="Marine Lieutenant",    questName="MarineQuest3",     index=1, level=875,  sea="Second", island="Green Zone",       mobs={"Marine Lieutenant"}},
    {name="Marine Captain",       questName="MarineQuest3",     index=2, level=900,  sea="Second", island="Green Zone",       mobs={"Marine Captain"}},
    {name="Gravito",              questName="MarineQuest3",     index=3, level=925,  sea="Second", island="Green Zone",       mobs={"Gravito"},                 boss=true},
    {name="Zombie",               questName="ZombieQuest",      index=1, level=950,  sea="Second", island="Graveyard",        mobs={"Zombie"}},
    {name="Vampire",              questName="ZombieQuest",      index=2, level=975,  sea="Second", island="Graveyard",        mobs={"Vampire"}},
    {name="Snow Trooper",         questName="SnowMountainQuest",index=1, level=1000, sea="Second", island="Snow Mountain",    mobs={"Snow Trooper"}},
    {name="Winter Warrior",       questName="SnowMountainQuest",index=2, level=1050, sea="Second", island="Snow Mountain",    mobs={"Winter Warrior"}},
    {name="Lab Subordinate",      questName="FireSideQuest",    index=1, level=1100, sea="Second", island="Hot and Cold",     mobs={"Lab Subordinate"}},
    {name="Horned Warrior",       questName="FireSideQuest",    index=2, level=1125, sea="Second", island="Hot and Cold",     mobs={"Horned Warrior"}},
    {name="Magma Ninja",          questName="FireSideQuest",    index=3, level=1150, sea="Second", island="Hot and Cold",     mobs={"Magma Ninja"}},
    {name="Lava Pirate",          questName="IceSideQuest",     index=1, level=1175, sea="Second", island="Hot and Cold",     mobs={"Lava Pirate"}},
    {name="Order",                questName="IceSideQuest",     index=2, level=1200, sea="Second", island="Hot and Cold",     mobs={"Order"}},
    {name="Smoke Admiral",        questName="IceSideQuest",     index=3, level=1225, sea="Second", island="Hot and Cold",     mobs={"Smoke Admiral"},          boss=true},
    {name="Ship Deckhand",        questName="ShipQuest1",       index=1, level=1250, sea="Second", island="Cursed Ship",      mobs={"Ship Deckhand"}},
    {name="Ship Engineer",        questName="ShipQuest1",       index=2, level=1275, sea="Second", island="Cursed Ship",      mobs={"Ship Engineer"}},
    {name="Ship Steward",         questName="ShipQuest2",       index=1, level=1300, sea="Second", island="Cursed Ship",      mobs={"Ship Steward"}},
    {name="Ship Officer",         questName="ShipQuest2",       index=2, level=1325, sea="Second", island="Cursed Ship",      mobs={"Ship Officer"}},
    {name="Cursed Captain",       questName="ShipQuest2",       index=3, level=1350, sea="Second", island="Cursed Ship",      mobs={"Cursed Captain"},         boss=true},
    {name="Arctic Warrior",       questName="FrostQuest",       index=1, level=1350, sea="Second", island="Ice Castle",       mobs={"Arctic Warrior"}},
    {name="Snow Lurker",          questName="FrostQuest",       index=2, level=1375, sea="Second", island="Ice Castle",       mobs={"Snow Lurker"}},
    {name="Awakened Ice Admiral", questName="FrostQuest",       index=3, level=1400, sea="Second", island="Ice Castle",       mobs={"Awakened Ice Admiral"},   boss=true},
    {name="Sea Soldier",          questName="ForgottenQuest",   index=1, level=1425, sea="Second", island="Forgotten Island", mobs={"Sea Soldier"}},
    {name="Water Fighter",        questName="ForgottenQuest",   index=2, level=1450, sea="Second", island="Forgotten Island", mobs={"Water Fighter"}},
    {name="Tide Keeper",          questName="ForgottenQuest",   index=3, level=1475, sea="Second", island="Forgotten Island", mobs={"Tide Keeper"},            boss=true},
}-- ============================================
-- ISLAND DATABASE
-- ============================================
local islandDatabase = {
    -- FIRST SEA (exact NPC coordinates from in-game tracker)
    {name="Marine Starter",      level=0,    sea="First",  cframe=CFrame.new(-2710.6, 25.0,   2104.1)},
    {name="Pirate Starter",      level=0,    sea="First",  cframe=CFrame.new(1060.7,  16.9,   1550.2)},
    {name="Jungle",              level=10,   sea="First",  cframe=CFrame.new(-1432.9, 61.8,   -24.2)},
    {name="Pirate Village",      level=30,   sea="First",  cframe=CFrame.new(-1204.2, 4.7,    3873.1)},
    {name="Desert",              level=60,   sea="First",  cframe=CFrame.new(935.6,   6.4,    4246.4)},
    {name="Frozen Village",      level=90,   sea="First",  cframe=CFrame.new(1387.0,  87.2,   -1375.2)},
    {name="Marine Ford",         level=120,  sea="First",  cframe=CFrame.new(-4978.4, 20.6,   4277.0)},
    {name="Lower Skylands",      level=150,  sea="First",  cframe=CFrame.new(-4826.2, 717.6,  -2635.6)},
    {name="Prison",              level=190,  sea="First",  cframe=CFrame.new(5012.2,  3.6,    740.7)},
    {name="Colosseum",           level=250,  sea="First",  cframe=CFrame.new(-1527.6, 7.3,    -3001.9)},
    {name="Magma Village",       level=300,  sea="First",  cframe=CFrame.new(-5367.5, 8.9,    8506.6)},
    {name="Whirlpool",           level=375,  sea="First",  cframe=CFrame.new(4044.6,  1.8,    -1797.7)},
    {name="Underwater City",     level=375,  sea="First",  cframe=CFrame.new(61122.3, 19.0,   1566.7)},
    {name="Upper Skylands 1",    level=450,  sea="First",  cframe=CFrame.new(-4655.8, 845.9,  -1723.6)},
    {name="Upper Skylands 2",    level=525,  sea="First",  cframe=CFrame.new(-7893.6, 5635.9, -1409.3)},
    {name="Fountain City",       level=625,  sea="First",  cframe=CFrame.new(5218.8,  38.4,   4068.1)},
    {name="Middle Town",         level=0,    sea="First",  cframe=CFrame.new(-687.7,  13.5,   1586.4)},
    -- SECOND SEA
    {name="Kingdom of Rose",     level=700,  sea="Second", cframe=CFrame.new(71.71,   27.95,  2769.51)},
    {name="Green Zone",          level=875,  sea="Second", cframe=CFrame.new(-2458.5, 73.6,   -3248.1)},
    {name="Graveyard",           level=950,  sea="Second", cframe=CFrame.new(-5422.2, 49.0,   -803.0)},
    {name="Snow Mountain",       level=1000, sea="Second", cframe=CFrame.new(530.2,   401.9,  -5382.1)},
    {name="Hot and Cold",        level=1100, sea="Second", cframe=CFrame.new(-5379.8, 29.7,   -5330.8)},
    {name="Cursed Ship",         level=1250, sea="Second", cframe=CFrame.new(-6503.2, 83.7,   -123.1)},
    {name="Ice Castle",          level=1350, sea="Second", cframe=CFrame.new(5672.9,  28.9,   -6393.4)},
    {name="Forgotten Island",    level=1425, sea="Second", cframe=CFrame.new(-3164.1, 299.2,  -10562.2)},}

-- ============================================
-- BOSS SYSTEM
-- ============================================
local bossMobs = {
    "Gorilla King", "Chef", "Yeti", "Vice Admiral",
    "Warden", "Chief Warden", "Swan",
    "Fishman Lord", "Magma Admiral",
    "Wysper", "Thunder God", "Cyborg",
    "Jeremy", "Gravito", "Smoke Admiral", "Cursed Captain",
    "Ice Admiral", "Tide Keeper", "Awakened Ice Admiral"
}

-- Check if a mob currently exists in workspace.Enemies
local function isMobSpawned(mobName)
    local enemiesFolder = Workspace:FindFirstChild("Enemies")
    if not enemiesFolder then return false end
    for _, enemy in ipairs(enemiesFolder:GetChildren()) do
        if enemy.Name == mobName then
            local hum = enemy:FindFirstChild("Humanoid")
            if hum and hum.Health > 0 then return true end
        end
    end
    return false
end

-- Check if any of the quest mobs are bosses that aren't spawned
local function isBossMissing(q)
    if not q or not q.mobs then return false end
    for _, mobName in ipairs(q.mobs) do
        for _, bossName in ipairs(bossMobs) do
            if mobName == bossName then
                if not isMobSpawned(mobName) then
                    return true
                end
            end
        end
    end
    return false
end

-- Get the island the player is currently closest to
local function getCurrentIsland()
    if not LocalPlayer.Character then return nil, math.huge end
    local hrp = getHRP(LocalPlayer.Character)
    if not hrp then return nil, math.huge end
    local sea = getCurrentSea()
    local closest, closestDist = nil, math.huge
    for _, island in ipairs(islandDatabase) do
        if island.sea == sea then
            local dist = (hrp.Position - island.cframe.Position).Magnitude
            if dist < closestDist then
                closestDist = dist
                closest = island
            end
        end
    end
    return closest, closestDist
end

local function getBestQuest()
    local level = getPlayerLevel()
    local sea = getCurrentSea()
    local side = getPlayerSide()

    local validQuests = {}
    for _, q in ipairs(questDatabase) do
        if q.sea == sea and level >= q.level then
            if not q.side or q.side == side or side == "Unknown" then
                table.insert(validQuests, q)
            end
        end
    end
    table.sort(validQuests, function(a, b) return a.level > b.level end)

    local currentIsland, currentDist = getCurrentIsland()
    if currentIsland and currentDist < 1500 then
        local islandQuests = {}
        for _, q in ipairs(validQuests) do
            if q.island == currentIsland.name and not isBossMissing(q) then
                table.insert(islandQuests, q)
            end
        end
        if #islandQuests > 0 then
            return islandQuests[1]
        end
    end

    for _, q in ipairs(validQuests) do
        if not isBossMissing(q) then
            return q
        end
    end

    return validQuests[1]
end

-- Check if quest is still active by scanning PlayerGui TextLabels
local function isQuestActiveInGUI(q)
    if not q then return false end
    local playerGui = LocalPlayer:FindFirstChild("PlayerGui")
    if not playerGui then return false end
    for _, obj in ipairs(playerGui:GetDescendants()) do
        if obj:IsA("TextLabel") and obj.Text and obj.Text:find(q.name) then
            return true
        end
    end
    return false
end

-- Quest is done when it disappears from the GUI
local function isQuestComplete()
    if not currentQuest then return true end
    return not isQuestActiveInGUI(currentQuest)
end

-- ============================================
-- FIXED AUTO QUEST SYSTEM WITH PROGRESS TRACKING
-- ============================================
local currentQuest = nil
local lastQuestAcceptTime = 0

-- Check quest progress directly using multiple remote attempts
local function checkQuestProgress()
    if not commF or not currentQuest then return 0 end
    
    local remotesToTry = {"ZQuestProgress", "ProQuestProgress", "getQuestProgress", "QuestProgress"}
    
    for _, remoteName in ipairs(remotesToTry) do
        local success, result = pcall(function()
            return commF:InvokeServer(remoteName)
        end)
        
        if success and result then
            if type(result) == "number" then
                questProgress = result
                if result >= 100 then questComplete = true end
                return result
            elseif type(result) == "string" then
                local num = tonumber(result)
                if num then
                    questProgress = num
                    if num >= 100 then questComplete = true end
                    return num
                elseif result:lower():find("complete") or result:lower():find("done") then
                    questComplete = true
                    questProgress = 100
                    return 100
                end
            elseif type(result) == "table" and result.Progress then
                questProgress = result.Progress
                if result.Progress >= 100 or result.Complete then
                    questComplete = true
                end
                return result.Progress
            end
        end
    end
    return questProgress
end

-- Accept quest
local function acceptQuest(q)
    if not q or not commF then return false end
    local success = pcall(function()
        commF:InvokeServer("StartQuest", q.questName, q.index)
    end)
    if success then
        currentQuest = q
        lastQuestAcceptTime = tick()
        questProgress = 0
        questComplete = false
        notify("Quest: " .. q.name)
        return true
    end
    return false
end

-- FAST QUEST LOOP (checks every 100ms)
task.spawn(function()
    while true do
        if settings.autoQuest then
            local currentTime = tick()
            
            -- Check progress every 2 seconds (don't spam)
            if currentTime - lastProgressCheck > 2 then
                checkQuestProgress()
                lastProgressCheck = currentTime
            end
            
            local bestQ = getBestQuest()
            if bestQ then
                local timeSinceAccept = currentTime - lastQuestAcceptTime
                local noQuest = not currentQuest
                local timedOut = timeSinceAccept > 180
                local questDone = questComplete or (timeSinceAccept > 30 and isQuestComplete())
                local wrongQuest = currentQuest and bestQ.name ~= currentQuest.name
                
                -- Accept conditions
                if noQuest or questDone or timedOut or (wrongQuest and questDone) then
                    if acceptQuest(bestQ) and menuVisible and currentTab == "FARM" then
                        updateMenu()
                    end
                end
            end
        else
            if not currentQuest then
                currentQuest = getBestQuest()
            end
        end
        task.wait(0.1) -- 100ms loop
    end
end)

-- ============================================
-- TRAVEL SYSTEM
-- ============================================
local currentTween = nil
local ARRIVE_DISTANCE = 1000

local function getIslandByName(islandName)
    for _, island in ipairs(islandDatabase) do
        if island.name == islandName then return island end
    end
    return nil
end

local function isAtIsland(island)
    if not island or not LocalPlayer.Character then return false end
    local hrp = getHRP(LocalPlayer.Character)
    if not hrp then return false end
    return (hrp.Position - island.cframe.Position).Magnitude <= ARRIVE_DISTANCE
end

local function travelToIsland(island)
    if not island or not LocalPlayer.Character then return end
    local hrp = getHRP(LocalPlayer.Character)
    if not hrp then return end
    if currentTween then currentTween:Cancel() end
    local dist = (island.cframe.Position - hrp.Position).Magnitude
    local tweenInfo = TweenInfo.new(dist / settings.travelSpeed, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
    local tween = TweenService:Create(hrp, tweenInfo, {CFrame = island.cframe})
    tween:Play()
    currentTween = tween
    tween.Completed:Connect(function() currentTween = nil end)
end

-- Auto travel with cooldown
local lastTravelTime = 0
task.spawn(function()
    while true do
        local anyFarmActive = settings.autoFarmLevel or settings.autoFarmNearest
        if settings.autoTravel and anyFarmActive and currentQuest then
            local island = getIslandByName(currentQuest.island)
            if island then
                local hrp = getHRP(LocalPlayer.Character)
                if hrp then
                    local dist = (hrp.Position - island.cframe.Position).Magnitude
                    local cooldownDone = (tick() - lastTravelTime) > 60
                    if dist > 1500 and cooldownDone then
                        notify("Traveling to " .. island.name .. " (" .. settings.travelSpeed .. ")")
                        travelToIsland(island)
                        lastTravelTime = tick()
                        task.wait(15)
                    end
                end
            end
        end
        task.wait(5)
    end
end)

-- ============================================
-- FAST ATTACK CORE (EXPANDED LIMBS)
-- ============================================
local hitRemote = ReplicatedStorage:FindFirstChild("Modules") and
                  ReplicatedStorage.Modules:FindFirstChild("Net") and
                  ReplicatedStorage.Modules.Net:FindFirstChild("RE/RegisterHit")
local attackRemote = ReplicatedStorage:FindFirstChild("Modules") and
                     ReplicatedStorage.Modules:FindFirstChild("Net") and
                     ReplicatedStorage.Modules.Net:FindFirstChild("RE/RegisterAttack")
local hitDamage = "45397155"
local ARMS = {
    "LeftArm","RightArm",
    "LeftHand","RightHand",
    "LeftUpperArm","RightUpperArm",
    "LeftLowerArm","RightLowerArm",
    "LeftLeg","RightLeg",
    "LeftFoot","RightFoot",
    "LeftUpperLeg","RightUpperLeg",
    "LeftLowerLeg","RightLowerLeg",
    "Head","UpperTorso","LowerTorso","Torso",
    "HumanoidRootPart",
    "LeftWrist","RightWrist",
    "LeftElbow","RightElbow",
    "LeftKnee","RightKnee",
    "LeftAnkle","RightAnkle",
    "LeftShoulder","RightShoulder",
    "LeftHip","RightHip",
    "Neck","Waist"
}
local lastUsedArm = {}
for _, arm in ipairs(ARMS) do lastUsedArm[arm] = 0 end

local function getArm(char)
    if not char then return nil end
    local time = tick()
    local available = {}
    for _, name in ipairs(ARMS) do
        if char:FindFirstChild(name) and time - lastUsedArm[name] > 0.15 then
            table.insert(available, name)
        end
    end
    if #available > 0 then
        local chosen = available[math.random(#available)]
        lastUsedArm[chosen] = time
        return char:FindFirstChild(chosen)
    end
    for _, name in ipairs(ARMS) do
        local arm = char:FindFirstChild(name)
        if arm then lastUsedArm[name] = time; return arm end
    end
    return char:FindFirstChild("HumanoidRootPart")
end

local function registerHit(target)
    if not target or not hitRemote then return false end
    local arm = getArm(target)
    if not arm then return false end
    return pcall(function() hitRemote:FireServer(arm, {{target, arm}}, hitDamage) end)
end

local function getAllArms(char)
    if not char then return {} end
    local arms = {}
    for _, name in ipairs(ARMS) do
        local arm = char:FindFirstChild(name)
        if arm then table.insert(arms, arm) end
    end
    return arms
end

local function burstAttack(target)
    if not target then return end
    local arms = getAllArms(target)
    if #arms == 0 then return end
    for cycle = 1, 3 do
        for _, arm in ipairs(arms) do
            pcall(function()
                if hitRemote then hitRemote:FireServer(arm, {{target, arm}}, hitDamage) end
            end)
            task.wait(0.005)
        end
    end
end

local function dualSpam(target)
    if not target then return false end
    local success = false
    if attackRemote then pcall(function() attackRemote:FireServer(0.4); success = true end) end
    if target and hitRemote then
        local arm = getArm(target)
        if arm then pcall(function() hitRemote:FireServer(arm, {{target, arm}}, hitDamage); success = true end) end
    end
    return success
end

-- ============================================
-- TARGET DETECTION
-- ============================================
local function getTargetsInRange(range, questOnly)
    local targets = {}
    if not LocalPlayer.Character then return targets end
    local hrp = getHRP(LocalPlayer.Character)
    if not hrp then return targets end
    local validMobs = {}
    if questOnly and currentQuest and currentQuest.mobs then
        validMobs = currentQuest.mobs
    end
    local enemiesFolder = Workspace:FindFirstChild("Enemies")
    if enemiesFolder then
        for _, enemy in ipairs(enemiesFolder:GetChildren()) do
            local humanoid = enemy:FindFirstChild("Humanoid")
            if humanoid and humanoid.Health > 0 then
                local valid = (#validMobs == 0)
                if not valid then
                    for _, mobName in ipairs(validMobs) do
                        if enemy.Name == mobName then
                            valid = true
                            break
                        end
                    end
                end
                if valid then
                    local enemyHrp = getHRP(enemy)
                    if enemyHrp then
                        local dist = (enemyHrp.Position - hrp.Position).Magnitude
                        if dist <= range then
                            table.insert(targets, {obj = enemy, type = "enemy"})
                        end
                    end
                end
            end
        end
    end
    return targets
end

local function getClosestTarget()
    local targets = getTargetsInRange(settings.attackRange, true)
    if #targets == 0 then
        targets = getTargetsInRange(settings.attackRange, false)
    end
    if #targets == 0 then return nil end
    local hrp = getHRP(LocalPlayer.Character)
    if not hrp then return nil end
    local closest = nil
    local shortest = math.huge
    for _, target in ipairs(targets) do
        local targetHrp = getHRP(target.obj)
        if targetHrp then
            local dist = (targetHrp.Position - hrp.Position).Magnitude
            if dist < shortest then shortest = dist; closest = target.obj end
        end
    end
    return closest
end

-- Get all players in range for PvP targeting
local function getPlayersInRange(range)
    local targets = {}
    if not LocalPlayer.Character then return targets end
    local hrp = getHRP(LocalPlayer.Character)
    if not hrp then return targets end
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local pHrp = getHRP(player.Character)
            local hum = player.Character:FindFirstChild("Humanoid")
            if pHrp and hum and hum.Health > 0 then
                local dist = (pHrp.Position - hrp.Position).Magnitude
                if dist <= range then
                    table.insert(targets, {obj = player.Character, type = "player"})
                end
            end
        end
    end
    return targets
end

-- FAST ATTACK LOOP
task.spawn(function()
    while true do
        if settings.fastAttack then
            local targets = getTargetsInRange(settings.attackRange, true)
            for _, target in ipairs(targets) do
                for i = 1, 3 do registerHit(target.obj); task.wait(settings.attackSpeed) end
            end
            if settings.attackPlayers then
                local playerTargets = getPlayersInRange(settings.attackRange)
                for _, target in ipairs(playerTargets) do
                    for i = 1, 3 do registerHit(target.obj); task.wait(settings.attackSpeed) end
                end
            end
        end
        task.wait(0.01)
    end
end)

-- LONG REACH LOOP
task.spawn(function()
    while true do
        if settings.longReach then
            local targets = getTargetsInRange(settings.attackRange * 1.5, true)
            for _, target in ipairs(targets) do burstAttack(target.obj); task.wait(0.2) end
            if settings.attackPlayers then
                local playerTargets = getPlayersInRange(settings.attackRange * 1.5)
                for _, target in ipairs(playerTargets) do burstAttack(target.obj); task.wait(0.2) end
            end
        end
        task.wait(0.1)
    end
end)

-- ============================================
-- AUTO FARM SYSTEM
-- ============================================
local farmConnection = nil
local currentFarmTarget = nil
local lastKillPosition = nil
local lastKillTime = 0

-- Get quest mobs ONLY
local function getQuestTargetsInRange(range)
    local targets = {}
    if not LocalPlayer.Character then return targets end
    local hrp = getHRP(LocalPlayer.Character)
    if not hrp then return targets end
    if not currentQuest or not currentQuest.mobs then return targets end

    local enemiesFolder = Workspace:FindFirstChild("Enemies")
    if not enemiesFolder then return targets end

    for _, enemy in ipairs(enemiesFolder:GetChildren()) do
        local humanoid = enemy:FindFirstChild("Humanoid")
        if humanoid and humanoid.Health > 0 then
            for _, mobName in ipairs(currentQuest.mobs) do
                if enemy.Name == mobName then
                    local enemyHrp = getHRP(enemy)
                    if enemyHrp then
                        local dist = (enemyHrp.Position - hrp.Position).Magnitude
                        if dist <= range then
                            table.insert(targets, enemy)
                        end
                    end
                    break
                end
            end
        end
    end
    return targets
end

-- Get nearest mobs regardless of quest
local function getNearestTargetsInRange(range)
    local targets = {}
    if not LocalPlayer.Character then return targets end
    local hrp = getHRP(LocalPlayer.Character)
    if not hrp then return targets end

    local enemiesFolder = Workspace:FindFirstChild("Enemies")
    if not enemiesFolder then return targets end

    for _, enemy in ipairs(enemiesFolder:GetChildren()) do
        local humanoid = enemy:FindFirstChild("Humanoid")
        if humanoid and humanoid.Health > 0 then
            local enemyHrp = getHRP(enemy)
            if enemyHrp then
                local dist = (enemyHrp.Position - hrp.Position).Magnitude
                if dist <= range then
                    table.insert(targets, enemy)
                end
            end
        end
    end
    return targets
end

local function getClosestFromList(list)
    if #list == 0 then return nil end
    local hrp = getHRP(LocalPlayer.Character)
    if not hrp then return nil end
    local closest, shortest = nil, math.huge
    for _, enemy in ipairs(list) do
        local eHrp = getHRP(enemy)
        if eHrp then
            local dist = (eHrp.Position - hrp.Position).Magnitude
            if dist < shortest then shortest = dist; closest = enemy end
        end
    end
    return closest
end

local function startFarming(target)
    if not target then return end
    if farmConnection then farmConnection:Disconnect() end
    currentFarmTarget = target
    farmConnection = RunService.Heartbeat:Connect(function()
        local anyFarmActive = settings.autoFarmLevel or settings.autoFarmNearest
        if not anyFarmActive or not LocalPlayer.Character then return end
        if not currentFarmTarget then return end

        local targetHrp = getHRP(currentFarmTarget)
        local hum = currentFarmTarget:FindFirstChild("Humanoid")

        if not targetHrp or not hum or hum.Health <= 0 then
            if targetHrp then
                lastKillPosition = targetHrp.Position + Vector3.new(0, settings.farmHeight, 0)
                lastKillTime = tick()
            end
            currentFarmTarget = nil
            return
        end

        if hum.Health / hum.MaxHealth < 0.05 then return end

        local hrp = getHRP(LocalPlayer.Character)
        if not hrp then return end

        local targetPos = targetHrp.Position + Vector3.new(0, settings.farmHeight, 0)
        local dist = (hrp.Position - targetPos).Magnitude
        if dist > 3 then
            local bp = hrp:FindFirstChild("NexusFarmBP")
            if not bp then
                bp = Instance.new("BodyPosition")
                bp.Name = "NexusFarmBP"
                bp.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                bp.P = 10000
                bp.D = 1000
                bp.Parent = hrp
            end
            bp.Position = targetPos
        else
            local bp = hrp:FindFirstChild("NexusFarmBP")
            if bp then bp:Destroy() end
        end
    end)
end-- Auto Farm Level loop
task.spawn(function()
    while true do
        if settings.autoFarmLevel then
            if not currentFarmTarget or not currentFarmTarget:FindFirstChild("Humanoid") or currentFarmTarget.Humanoid.Health <= 0 then
                local questTargets = getQuestTargetsInRange(settings.attackRange)
                local target = getClosestFromList(questTargets)

                if target then
                    startFarming(target)
                elseif lastKillPosition then
                    local hrp = getHRP(LocalPlayer.Character)
                    if hrp then
                        local waitPos = lastKillPosition + Vector3.new(0, settings.farmHeight, 0)
                        local dist = (hrp.Position - waitPos).Magnitude
                        if dist > 5 then
                            local bp = hrp:FindFirstChild("NexusFarmBP")
                            if not bp then
                                bp = Instance.new("BodyPosition")
                                bp.Name = "NexusFarmBP"
                                bp.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                                bp.P = 10000
                                bp.D = 1000
                                bp.Parent = hrp
                            end
                            bp.Position = waitPos
                        end
                    end
                end
            end
        else
            if farmConnection and not settings.autoFarmNearest then
                farmConnection:Disconnect()
                farmConnection = nil
                currentFarmTarget = nil
            end
            local hrp = getHRP(LocalPlayer.Character)
            if hrp then
                local bp = hrp:FindFirstChild("NexusFarmBP")
                if bp then bp:Destroy() end
            end
        end
        task.wait(0.5)
    end
end)

-- Auto Farm Nearest loop
task.spawn(function()
    while true do
        if settings.autoFarmNearest then
            if not currentFarmTarget or not currentFarmTarget:FindFirstChild("Humanoid") or currentFarmTarget.Humanoid.Health <= 0 then
                local nearestTargets = getNearestTargetsInRange(settings.attackRange)
                local target = getClosestFromList(nearestTargets)
                if target then
                    startFarming(target)
                end
            end
        else
            if farmConnection and not settings.autoFarmLevel then
                farmConnection:Disconnect()
                farmConnection = nil
                currentFarmTarget = nil
            end
        end
        task.wait(0.5)
    end
end)

-- AUTO HITTER - HITS ALL MOBS IN RANGE
task.spawn(function()
    while true do
        if settings.autoHitter and not menuVisible then
            local allTargets = getTargetsInRange(settings.hitterRange, true)
            if #allTargets == 0 then
                allTargets = getTargetsInRange(settings.hitterRange, false)
            end
            for _, target in ipairs(allTargets) do
                dualSpam(target.obj)
            end
        end
        task.wait(1 / settings.hitterCPS)
    end
end)

-- MOB AURA
task.spawn(function()
    while true do
        if settings.mobAura then
            local targets = getTargetsInRange(20, false)
            for _, target in ipairs(targets) do registerHit(target.obj) end
        end
        task.wait(settings.attackSpeed)
    end
end)

-- BRING MOBS - LIMITED TO 3 MOBS (FIXED)
task.spawn(function()
    while true do
        if settings.bringMobs and (settings.autoFarmLevel or settings.autoFarmNearest) then
            local mobsToBring = {}
            local enemiesFolder = Workspace:FindFirstChild("Enemies")
            if enemiesFolder and LocalPlayer.Character then
                local hrp = getHRP(LocalPlayer.Character)
                if hrp then
                    if settings.autoFarmLevel and currentQuest and currentQuest.mobs then
                        for _, enemy in ipairs(enemiesFolder:GetChildren()) do
                            if #mobsToBring >= 3 then break end
                            local humanoid = enemy:FindFirstChild("Humanoid")
                            if humanoid and humanoid.Health > 0 then
                                for _, mobName in ipairs(currentQuest.mobs) do
                                    if enemy.Name == mobName then
                                        local enemyHrp = getHRP(enemy)
                                        if enemyHrp and (enemyHrp.Position - hrp.Position).Magnitude <= 300 then
                                            table.insert(mobsToBring, enemy)
                                        end
                                        break
                                    end
                                end
                            end
                        end
                    else
                        local allMobs = {}
                        for _, enemy in ipairs(enemiesFolder:GetChildren()) do
                            local humanoid = enemy:FindFirstChild("Humanoid")
                            if humanoid and humanoid.Health > 0 then
                                local enemyHrp = getHRP(enemy)
                                if enemyHrp then
                                    local dist = (enemyHrp.Position - hrp.Position).Magnitude
                                    if dist <= 300 then
                                        table.insert(allMobs, {enemy = enemy, dist = dist})
                                    end
                                end
                            end
                        end
                        table.sort(allMobs, function(a, b) return a.dist < b.dist end)
                        for i = 1, math.min(3, #allMobs) do
                            table.insert(mobsToBring, allMobs[i].enemy)
                        end
                    end
                    
                    for _, enemy in ipairs(mobsToBring) do
                        local enemyHrp = getHRP(enemy)
                        if enemyHrp then
                            enemyHrp.CFrame = CFrame.new(
                                hrp.Position.X,
                                enemyHrp.Position.Y,
                                hrp.Position.Z
                            ) * CFrame.Angles(0, enemyHrp.Orientation.Y, 0)
                        end
                    end
                end
            end
        end
        task.wait(0.3)
    end
end)

-- ============================================
-- SPEED SYSTEM
-- ============================================
local speedEnabled = false
local speedThread = nil
local speedConnections = {}
local originalSpeed = {}
local originalJump = {}

local function applySpeed(char, ws, jp)
    if not char then return end
    local humanoid = char:FindFirstChildWhichIsA("Humanoid")
    if not humanoid then return end
    if not originalSpeed[char] then originalSpeed[char] = humanoid.WalkSpeed end
    if jp and not originalJump[char] then originalJump[char] = humanoid.JumpPower end
    humanoid.WalkSpeed = ws
    if jp then humanoid.JumpPower = jp end
end

local function toggleSpeed(state)
    settings.speedEnabled = state
    speedEnabled = state
    if state then
        for _, conn in ipairs(speedConnections) do conn:Disconnect() end
        speedConnections = {}
        if LocalPlayer.Character then
            applySpeed(LocalPlayer.Character, settings.speedValue, settings.jumpEnabled and settings.jumpValue or nil)
        end
        if speedThread then speedThread = nil end
        speedThread = task.spawn(function()
            while settings.speedEnabled and LocalPlayer.Character do
                local humanoid = LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
                if humanoid and humanoid.WalkSpeed ~= settings.speedValue then humanoid.WalkSpeed = settings.speedValue end
                if settings.jumpEnabled and humanoid and humanoid.JumpPower ~= settings.jumpValue then humanoid.JumpPower = settings.jumpValue end
                task.wait(0.1)
            end
        end)
        local function watchCharacter(char)
            local humanoid = char:FindFirstChildWhichIsA("Humanoid")
            if humanoid then
                local wsConn = humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
                    if settings.speedEnabled and humanoid.WalkSpeed ~= settings.speedValue then humanoid.WalkSpeed = settings.speedValue end
                end)
                table.insert(speedConnections, wsConn)
                if settings.jumpEnabled then
                    local jpConn = humanoid:GetPropertyChangedSignal("JumpPower"):Connect(function()
                        if settings.speedEnabled and humanoid.JumpPower ~= settings.jumpValue then humanoid.JumpPower = settings.jumpValue end
                    end)
                    table.insert(speedConnections, jpConn)
                end
            end
        end
        if LocalPlayer.Character then watchCharacter(LocalPlayer.Character) end
        local charConn = LocalPlayer.CharacterAdded:Connect(function(char)
            task.wait(0.5)
            if settings.speedEnabled then
                applySpeed(char, settings.speedValue, settings.jumpEnabled and settings.jumpValue or nil)
                watchCharacter(char)
            end
        end)
        table.insert(speedConnections, charConn)
        notify("Speed ON: " .. settings.speedValue)
    else
        if speedThread then speedThread = nil end
        for _, conn in ipairs(speedConnections) do conn:Disconnect() end
        speedConnections = {}
        if LocalPlayer.Character and originalSpeed[LocalPlayer.Character] then
            local humanoid = LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = originalSpeed[LocalPlayer.Character] or 16
                if settings.jumpEnabled and originalJump[LocalPlayer.Character] then
                    humanoid.JumpPower = originalJump[LocalPlayer.Character] or 50
                end
            end
        end
        notify("Speed OFF")
    end
end

local function updateSpeed(value)
    settings.speedValue = value
    if speedEnabled and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
        if humanoid then humanoid.WalkSpeed = value end
    end
end

local function toggleJump(state) settings.jumpEnabled = state end

local function updateJump(value)
    settings.jumpValue = value
    if settings.jumpEnabled and speedEnabled and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
        if humanoid then humanoid.JumpPower = value end
    end
end

-- ============================================
-- FLIGHT SYSTEM
-- ============================================
local flyConnection = nil
local flyBodyVelocity = nil

local function startFlying()
    if not LocalPlayer.Character then return end
    local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
    local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not hrp then return end
    humanoid.PlatformStand = true
    humanoid.AutoRotate = false
    if flyBodyVelocity then flyBodyVelocity:Destroy() end
    flyBodyVelocity = Instance.new("BodyVelocity")
    flyBodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
    flyBodyVelocity.P = 1250
    flyBodyVelocity.Parent = hrp
    if flyConnection then flyConnection:Disconnect() end
    flyConnection = RunService.Heartbeat:Connect(function()
        if not settings.flyEnabled or not LocalPlayer.Character then return end
        local h = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not h then return end
        local cameraCF = camera.CFrame
        local moveDirection = Vector3.new(0, 0, 0)
        if UIS:IsKeyDown(Enum.KeyCode.W) then moveDirection = moveDirection + (cameraCF.LookVector * Vector3.new(1, 0, 1)) end
        if UIS:IsKeyDown(Enum.KeyCode.S) then moveDirection = moveDirection - (cameraCF.LookVector * Vector3.new(1, 0, 1)) end
        if UIS:IsKeyDown(Enum.KeyCode.A) then moveDirection = moveDirection - (cameraCF.RightVector * Vector3.new(1, 0, 1)) end
        if UIS:IsKeyDown(Enum.KeyCode.D) then moveDirection = moveDirection + (cameraCF.RightVector * Vector3.new(1, 0, 1)) end
        if UIS:IsKeyDown(Enum.KeyCode.Space) then moveDirection = moveDirection + Vector3.new(0, 1, 0) end
        if UIS:IsKeyDown(Enum.KeyCode.LeftControl) or UIS:IsKeyDown(Enum.KeyCode.RightControl) then moveDirection = moveDirection + Vector3.new(0, -1, 0) end
        if moveDirection.Magnitude > 0 then
            moveDirection = moveDirection.Unit * settings.flySpeed
            flyBodyVelocity.Velocity = moveDirection
            h.CFrame = CFrame.lookAt(h.Position, h.Position + cameraCF.LookVector * Vector3.new(1, 0, 1))
        else
            flyBodyVelocity.Velocity = Vector3.new(0, 0, 0)
        end
    end)
end

local function stopFlying()
    if LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then humanoid.PlatformStand = false; humanoid.AutoRotate = true end
    end
    if flyBodyVelocity then flyBodyVelocity:Destroy(); flyBodyVelocity = nil end
    if flyConnection then flyConnection:Disconnect(); flyConnection = nil end
end

local function toggleFly(state)
    settings.flyEnabled = state
    if state then startFlying(); notify("Flight ON") else stopFlying(); notify("Flight OFF") end
end

-- WATER WALK
local waterBlock = nil
local waterLevel = -4.8
local function toggleWaterWalk(state)
    settings.walkOnWater = state
    if state then
        if waterBlock then waterBlock:Destroy() end
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then notify("No character"); return end
        waterBlock = Instance.new("Part")
        waterBlock.Name = "NexusWaterWalker"
        waterBlock.Size = Vector3.new(10, 1, 10)
        waterBlock.Position = Vector3.new(hrp.Position.X, waterLevel, hrp.Position.Z)
        waterBlock.Anchored = true
        waterBlock.CanCollide = true
        waterBlock.Transparency = 1
        waterBlock.Material = Enum.Material.Water
        waterBlock.Parent = Workspace
        task.spawn(function()
            while settings.walkOnWater and waterBlock and waterBlock.Parent do
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    local h = LocalPlayer.Character.HumanoidRootPart
                    waterBlock.Position = Vector3.new(h.Position.X, waterLevel, h.Position.Z)
                end
                task.wait(0.1)
            end
        end)
        notify("Water walk ON")
    else
        if waterBlock then waterBlock:Destroy(); waterBlock = nil end
        notify("Water walk OFF")
    end
end

-- ============================================
-- AUTO STATS
-- ============================================
task.spawn(function()
    while true do
        if settings.autoStats then
            pcall(function()
                local commF = ReplicatedStorage.Remotes.CommF_
                local pointsValue = 0
                local data = LocalPlayer:FindFirstChild("Data")
                if data then
                    local sp = data:FindFirstChild("StatPoints") or data:FindFirstChild("Points") or data:FindFirstChild("UnspentPoints")
                    if sp then pointsValue = sp.Value end
                end
                if pointsValue > 0 then
                    for i = 1, pointsValue do
                        commF:InvokeServer("AddPoint", settings.statPriority, 1)
                        task.wait(0.15)
                    end
                    notify("Stats: +" .. pointsValue .. " " .. settings.statPriority)
                end
            end)
        end
        task.wait(1)
    end
end)

-- ============================================
-- AUTO HAKI
-- ============================================
local hakiActive = false

local function activateHaki()
    pcall(function()
        ReplicatedStorage.Remotes.CommF_:InvokeServer("Buso")
    end)
    hakiActive = true
end

local function deactivateHaki()
    pcall(function()
        ReplicatedStorage.Remotes.CommF_:InvokeServer("Buso")
    end)
    hakiActive = false
end

LocalPlayer.CharacterAdded:Connect(function()
    hakiActive = false
    if settings.autoHaki then
        task.wait(2)
        activateHaki()
    end
end)

task.spawn(function()
    while true do
        if settings.autoHaki then
            if not hakiActive then activateHaki() end
        else
            if hakiActive then deactivateHaki() end
        end
        task.wait(3)
    end
end)

-- ============================================
-- AUTO EQUIP FIGHTING STYLE
-- ============================================
local autoEquipFighting = true
local fightingStyleName = "Combat"

local function equipFightingStyle()
    pcall(function()
        local char = LocalPlayer.Character
        if not char then return end
        local humanoid = char:FindFirstChildWhichIsA("Humanoid")
        if not humanoid then return end
        local backpack = LocalPlayer:FindFirstChild("Backpack")
        if not backpack then return end
        local tool = backpack:FindFirstChild(fightingStyleName)
        if not tool then return end
        humanoid:EquipTool(tool)
    end)
end

local function isFightingStyleEquipped()
    local char = LocalPlayer.Character
    if not char then return false end
    return char:FindFirstChild(fightingStyleName) ~= nil
end

task.spawn(function()
    while true do
        if autoEquipFighting then
            if not isFightingStyleEquipped() then
                equipFightingStyle()
                task.wait(1)
            end
        end
        task.wait(1.5)
    end
end)

-- ANTI AFK
task.spawn(function()
    while true do
        if settings.antiAfk then
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end
        task.wait(60)
    end
end)

-- NO CLIP
task.spawn(function()
    while true do
        if settings.noClip and LocalPlayer.Character then
            for _, part in ipairs(LocalPlayer.Character:GetChildren()) do
                if part:IsA("BasePart") then part.CanCollide = false end
            end
        end
        task.wait(0.5)
    end
end)

-- SEA HOP
local seaIds = {["First"]=2753915549, ["Second"]=4442272183, ["Third"]=7449423635}
local function hopToSea(seaName)
    local targetId = seaIds[seaName]
    if not targetId or game.PlaceId == targetId then return end
    TeleportService:Teleport(targetId, LocalPlayer)
end

-- ============================================
-- FRUIT SYSTEM
-- ============================================
local FRUIT_RARITY = {
    Mythic={"Kitsune","Dragon","Dough","Tiger","Yeti","Gas","T-Rex","Mammoth","Spirit","Venom","Control","Shadow","Gravity"},
    Legendary={"Buddha","Sound","Pain","Blizzard","Lightning","Portal","Phoenix","Quake","Love","Spider","Creation"},
    Epic={"Magma","Light","Ghost","Rubber"},
    Rare={"Diamond","Flame","Eagle","Ice","Sand","Dark"},
    Common={"Rocket","Spin","Blade","Spring","Bomb","Smoke","Spike"},
}

local function getFruitRarity(fruitName)
    for rarity, fruits in pairs(FRUIT_RARITY) do
        for _, name in ipairs(fruits) do
            if fruitName:find(name) then return rarity end
        end
    end
    return "Common"
end

local function isFruit(obj)
    if not obj:IsA("Tool") then return false end
    for _, fruits in pairs(FRUIT_RARITY) do
        for _, name in ipairs(fruits) do
            if obj.Name:find(name) then return true end
        end
    end
    return false
end

local function storeFruit(fruit)
    if not fruit then return false end
    local remotes = {fruit:FindFirstChild("StoreRemote"), fruit:FindFirstChild("EatRemote"), fruit:FindFirstChild("RemoteFunction"), fruit:FindFirstChild("RemoteEvent")}
    for _, remote in ipairs(remotes) do
        if remote then
            local success = pcall(function()
                if remote:IsA("RemoteFunction") then remote:InvokeServer("Store")
                elseif remote:IsA("RemoteEvent") then remote:FireServer("Store") end
            end)
            if success then return true end
        end
    end
    return false
end

task.spawn(function()
    while true do
        if settings.fruitSniper then
            local fruits = {}
            for _, obj in ipairs(Workspace:GetDescendants()) do
                if isFruit(obj) and obj:FindFirstChild("Handle") then table.insert(fruits, obj) end
            end
            if #fruits > 0 and LocalPlayer.Character then
                local hrp = getHRP(LocalPlayer.Character)
                if hrp then
                    table.sort(fruits, function(a, b)
                        return (a.Handle.Position - hrp.Position).Magnitude < (b.Handle.Position - hrp.Position).Magnitude
                    end)
                    local fruit = fruits[1]
                    local rarity = getFruitRarity(fruit.Name)
                    local raritySettings = settings.fruitRarity[rarity]
                    if raritySettings.action == "Warn" then
                        notify(rarity .. ": " .. fruit.Name)
                        hrp.CFrame = CFrame.new(fruit.Handle.Position + Vector3.new(0, 8, 0))
                        task.wait(3)
                    elseif raritySettings.action == "Store" then
                        hrp.CFrame = CFrame.new(fruit.Handle.Position + Vector3.new(0, 8, 0))
                        task.wait(1)
                        if raritySettings.autoStore then storeFruit(fruit) end
                        task.wait(settings.snipeDelay)
                    end
                end
            end
        end
        task.wait(1)
    end
end)-- ============================================
-- WORLD VISUALS
-- ============================================
local function applyVisuals()
    if not settings.worldVisuals then return end
    if settings.brightMode then
        Lighting.Brightness = 2; Lighting.ClockTime = 12; Lighting.FogEnd = 100000
        Lighting.GlobalShadows = false; Lighting.Ambient = Color3.new(1, 1, 1)
    elseif settings.darkMode then
        Lighting.Brightness = 0; Lighting.ClockTime = 0; Lighting.FogEnd = 50
        Lighting.GlobalShadows = true; Lighting.Ambient = Color3.new(0, 0, 0)
    end
    if settings.removeFog then Lighting.FogEnd = 100000 end
    if settings.xRay then
        for _, v in ipairs(Workspace:GetDescendants()) do
            if v:IsA("BasePart") and not v:IsA("Terrain") and v.Transparency < 0.5 then
                if not v:FindFirstChild("OriginalTransparency") then
                    local tag = Instance.new("NumberValue"); tag.Name = "OriginalTransparency"; tag.Value = v.Transparency; tag.Parent = v
                end
                v.Transparency = 0.7; v.Material = Enum.Material.Glass
            end
        end
    end
    if settings.removeWater then
        for _, v in ipairs(Workspace:GetDescendants()) do
            if v:IsA("Part") and v.Name:lower():find("water") then v.Transparency = 1; v.CanCollide = false end
        end
    end
    if settings.removeLava then
        for _, v in ipairs(Workspace:GetDescendants()) do
            if v:IsA("Part") and v.Name:lower():find("lava") then v.Transparency = 1; v.CanCollide = false end
        end
    end
    if settings.removeTrees then
        for _, v in ipairs(Workspace:GetDescendants()) do
            if v:IsA("Model") and (v.Name:lower():find("tree") or v.Name:lower():find("palm")) then v:Destroy() end
        end
    end
    if settings.removeRocks then
        for _, v in ipairs(Workspace:GetDescendants()) do
            if v:IsA("Model") and v.Name:lower():find("rock") then v:Destroy() end
        end
    end
    if settings.removeGrass then
        for _, v in ipairs(Workspace:GetDescendants()) do
            if v:IsA("Part") and v.Name:lower():find("grass") then v.Transparency = 1 end
        end
    end
    if settings.removeClouds then
        for _, v in ipairs(Workspace:GetDescendants()) do
            if v:IsA("Part") and v.Name:lower():find("cloud") then v.Transparency = 1 end
        end
    end
end

local function revertVisuals()
    Lighting.Brightness = 1; Lighting.ClockTime = 14; Lighting.FogEnd = 100000
    Lighting.GlobalShadows = true; Lighting.Ambient = Color3.new(0, 0, 0)
    for _, v in ipairs(Workspace:GetDescendants()) do
        if v:IsA("BasePart") and v:FindFirstChild("OriginalTransparency") then
            v.Transparency = v.OriginalTransparency.Value; v.Material = Enum.Material.Plastic; v.OriginalTransparency:Destroy()
        end
    end
end

local function toggleVisuals(state)
    settings.worldVisuals = state
    if state then applyVisuals() else revertVisuals() end
end

-- ============================================
-- SKYBOX CHANGER
-- ============================================
local currentSkybox = nil
local skyboxes = {
    ["Default"] = nil,
    ["Galaxy"] = {
        BkTexture  = "rbxassetid://1012887",
        DnTexture  = "rbxassetid://1012893",
        FtTexture  = "rbxassetid://1012895",
        LfTexture  = "rbxassetid://1012891",
        RtTexture  = "rbxassetid://1012889",
        UpTexture  = "rbxassetid://1012885",
    },
    ["Sunset"] = {
        BkTexture  = "rbxassetid://159482355",
        DnTexture  = "rbxassetid://159482355",
        FtTexture  = "rbxassetid://159482355",
        LfTexture  = "rbxassetid://159482355",
        RtTexture  = "rbxassetid://159482355",
        UpTexture  = "rbxassetid://159482355",
    },
    ["Night"] = {
        BkTexture  = "rbxassetid://6444884337",
        DnTexture  = "rbxassetid://6444884337",
        FtTexture  = "rbxassetid://6444884337",
        LfTexture  = "rbxassetid://6444884337",
        RtTexture  = "rbxassetid://6444884337",
        UpTexture  = "rbxassetid://6444884337",
    },
    ["Blood Moon"] = {
        BkTexture  = "rbxassetid://2412246571",
        DnTexture  = "rbxassetid://2412246571",
        FtTexture  = "rbxassetid://2412246571",
        LfTexture  = "rbxassetid://2412246571",
        RtTexture  = "rbxassetid://2412246571",
        UpTexture  = "rbxassetid://2412246571",
    },
    ["Underwater"] = {
        BkTexture  = "rbxassetid://1871736289",
        DnTexture  = "rbxassetid://1871736289",
        FtTexture  = "rbxassetid://1871736289",
        LfTexture  = "rbxassetid://1871736289",
        RtTexture  = "rbxassetid://1871736289",
        UpTexture  = "rbxassetid://1871736289",
    },
    ["Bloxfruits Custom"] = {
        BkTexture  = "rbxassetid://6622965718",
        DnTexture  = "rbxassetid://6622965718",
        FtTexture  = "rbxassetid://6622965718",
        LfTexture  = "rbxassetid://6622965718",
        RtTexture  = "rbxassetid://6622965718",
        UpTexture  = "rbxassetid://6622965718",
    },
}

local function applySkybox(name)
    local sky = Lighting:FindFirstChildWhichIsA("Sky")
    if sky then sky:Destroy() end
    if name == "Default" or not skyboxes[name] then return end
    local newSky = Instance.new("Sky")
    local data = skyboxes[name]
    for prop, val in pairs(data) do
        pcall(function() newSky[prop] = val end)
    end
    newSky.Parent = Lighting
    currentSkybox = name
end

-- ============================================
-- COLOR CORRECTION
-- ============================================
local colorCorrection = nil

local function applyColorCorrection(brightness, contrast, saturation, tintR, tintG, tintB)
    if not colorCorrection then
        colorCorrection = Instance.new("ColorCorrectionEffect")
        colorCorrection.Parent = Lighting
    end
    colorCorrection.Brightness = brightness or 0
    colorCorrection.Contrast = contrast or 0
    colorCorrection.Saturation = saturation or 0
    colorCorrection.TintColor = Color3.new(tintR or 1, tintG or 1, tintB or 1)
end

local function removeColorCorrection()
    if colorCorrection then
        colorCorrection:Destroy()
        colorCorrection = nil
    end
end

local colorPresets = {
    ["Normal"]    = {0,    0,    0,    1,   1,   1},
    ["Vibrant"]   = {0.1,  0.3,  0.8,  1,   1,   1},
    ["Cinematic"] = {-0.1, 0.4,  -0.2, 0.9, 0.8, 0.7},
    ["Red Tint"]  = {0,    0.2,  0,    1,   0.3, 0.3},
    ["Blue Tint"] = {0,    0.2,  0,    0.3, 0.5, 1},
    ["Green"]     = {0,    0.2,  0.3,  0.3, 1,   0.4},
    ["Purple"]    = {0,    0.2,  0,    0.7, 0.3, 1},
    ["Golden"]    = {0.1,  0.3,  0.2,  1,   0.8, 0.3},
    ["Grayscale"] = {0,    0.2,  -1,   1,   1,   1},
    ["Horror"]    = {-0.2, 0.5,  -0.5, 0.8, 0.1, 0.1},
}

-- ============================================
-- ESP SYSTEM
-- ============================================
local espObjects = {}

local function createESP(obj)
    if not obj then return end
    if espObjects[obj] then
        for _, espObj in ipairs(espObjects[obj]) do pcall(function() espObj:Destroy() end) end
    end
    local objects = {}
    local highlight = Instance.new("Highlight")
    highlight.Parent = obj
    highlight.FillColor = settings.espRainbow and Color3.fromHSV(tick() % 5 / 5, 1, 1) or settings.espColor
    highlight.FillTransparency = 0.5
    highlight.OutlineColor = Color3.new(1, 1, 1)
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    table.insert(objects, highlight)
    
    if obj:IsA("Model") and obj:FindFirstChild("Humanoid") then
        local billboard = Instance.new("BillboardGui")
        billboard.Parent = obj
        billboard.Size = UDim2.new(0, 150, 0, 70)
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.AlwaysOnTop = true
        billboard.ResetOnSpawn = false
        local yPos = 0
        
        if settings.showName then
            local nameLabel = Instance.new("TextLabel")
            nameLabel.Parent = billboard
            nameLabel.Size = UDim2.new(1, 0, 0, 20)
            nameLabel.Position = UDim2.new(0, 0, 0, yPos)
            nameLabel.BackgroundTransparency = 1
            nameLabel.Text = obj.Name
            nameLabel.TextColor3 = settings.espColor
            nameLabel.Font = Enum.Font.SourceSansBold
            nameLabel.TextSize = 14
            yPos = yPos + 20
        end
        
        if settings.showHealth then
            local healthLabel = Instance.new("TextLabel")
            healthLabel.Name = "Health"
            healthLabel.Parent = billboard
            healthLabel.Size = UDim2.new(1, 0, 0, 18)
            healthLabel.Position = UDim2.new(0, 0, 0, yPos)
            healthLabel.BackgroundTransparency = 1
            healthLabel.Text = "HP: " .. math.floor(obj.Humanoid.Health)
            healthLabel.TextColor3 = Color3.new(0, 1, 0)
            healthLabel.Font = Enum.Font.SourceSans
            healthLabel.TextSize = 12
            yPos = yPos + 18
        end
        
        if settings.showDistance then
            local distLabel = Instance.new("TextLabel")
            distLabel.Name = "Distance"
            distLabel.Parent = billboard
            distLabel.Size = UDim2.new(1, 0, 0, 18)
            distLabel.Position = UDim2.new(0, 0, 0, yPos)
            distLabel.BackgroundTransparency = 1
            distLabel.Text = "Dist: ?"
            distLabel.TextColor3 = Color3.new(1, 1, 1)
            distLabel.Font = Enum.Font.SourceSans
            distLabel.TextSize = 12
        end
        table.insert(objects, billboard)
    end
    espObjects[obj] = objects
end

local function refreshESP()
    for obj, objs in pairs(espObjects) do
        for _, espObj in ipairs(objs) do pcall(function() espObj:Destroy() end) end
    end
    espObjects = {}
    
    if settings.playerESP then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                createESP(player.Character)
            end
        end
    end
    
    if settings.fruitESP then
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if isFruit(obj) and obj:FindFirstChild("Handle") then
                if espObjects[obj] then
                    for _, v in ipairs(espObjects[obj]) do pcall(function() v:Destroy() end) end
                end
                local objects = {}
                local hl = Instance.new("Highlight")
                hl.Parent = obj
                local rarity = getFruitRarity(obj.Name)
                hl.FillColor = rarity == "Mythic" and Color3.fromRGB(255,50,50)
                    or rarity == "Legendary" and Color3.fromRGB(255,165,0)
                    or rarity == "Epic" and Color3.fromRGB(180,0,255)
                    or rarity == "Rare" and Color3.fromRGB(0,100,255)
                    or Color3.fromRGB(150,150,150)
                hl.FillTransparency = 0.4
                hl.OutlineColor = Color3.new(1,1,1)
                hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                table.insert(objects, hl)

                local bb = Instance.new("BillboardGui")
                bb.Parent = obj.Handle
                bb.Size = UDim2.new(0, 180, 0, 55)
                bb.StudsOffset = Vector3.new(0, 3, 0)
                bb.AlwaysOnTop = true
                bb.ResetOnSpawn = false

                local nameL = Instance.new("TextLabel")
                nameL.Parent = bb
                nameL.Size = UDim2.new(1, 0, 0, 20)
                nameL.BackgroundTransparency = 1
                nameL.Text = obj.Name
                nameL.TextColor3 = hl.FillColor
                nameL.Font = Enum.Font.GothamBold
                nameL.TextSize = 14

                local rarityL = Instance.new("TextLabel")
                rarityL.Parent = bb
                rarityL.Size = UDim2.new(1, 0, 0, 16)
                rarityL.Position = UDim2.new(0, 0, 0, 20)
                rarityL.BackgroundTransparency = 1
                rarityL.Text = "[" .. rarity .. "]"
                rarityL.TextColor3 = hl.FillColor
                rarityL.Font = Enum.Font.GothamBold
                rarityL.TextSize = 11

                local distL = Instance.new("TextLabel")
                distL.Name = "FruitDist"
                distL.Parent = bb
                distL.Size = UDim2.new(1, 0, 0, 16)
                distL.Position = UDim2.new(0, 0, 0, 37)
                distL.BackgroundTransparency = 1
                distL.Text = "? studs"
                distL.TextColor3 = Color3.fromRGB(200,200,200)
                distL.Font = Enum.Font.Gotham
                distL.TextSize = 11

                table.insert(objects, bb)
                espObjects[obj] = objects
            end
        end
    end
    
    if settings.chestESP then
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if obj:IsA("BasePart") and (obj.Name:find("Chest") or obj.Name:find("Coffer") or obj.Name:find("Crate")) then
                createESP(obj)
            end
        end
    end
end

task.spawn(function()
    while true do
        if settings.playerESP or settings.fruitESP or settings.chestESP then refreshESP() end
        task.wait(5)
    end
end)

task.spawn(function()
    while true do
        if settings.playerESP and LocalPlayer.Character then
            local hrp = getHRP(LocalPlayer.Character)
            if hrp then
                for obj, objs in pairs(espObjects) do
                    if obj:IsA("Model") and obj:FindFirstChild("Humanoid") then
                        for _, espObj in ipairs(objs) do
                            if espObj:IsA("BillboardGui") then
                                local distLabel = espObj:FindFirstChild("Distance")
                                if distLabel then
                                    local objHrp = getHRP(obj)
                                    if objHrp then distLabel.Text = "Dist: " .. math.floor((objHrp.Position - hrp.Position).Magnitude) .. "m" end
                                end
                                local healthLabel = espObj:FindFirstChild("Health")
                                if healthLabel and obj.Humanoid then healthLabel.Text = "HP: " .. math.floor(obj.Humanoid.Health) end
                                local fruitDist = espObj:FindFirstChild("FruitDist")
                                if fruitDist and objHrp then
                                    fruitDist.Text = math.floor((objHrp.Position - hrp.Position).Magnitude) .. " studs"
                                end
                            end
                        end
                    end
                end
            end
        end
        task.wait(0.5)
    end
end)

-- ============================================
-- SERVER HOP
-- ============================================
task.spawn(function()
    while true do
        if settings.serverHop then
            local playerCount = #Players:GetPlayers()
            if playerCount > settings.serverHopMinPlayers then
                notify("Too many players (" .. playerCount .. "), hopping server...")
                task.wait(2)
                TeleportService:Teleport(game.PlaceId, LocalPlayer)
            end
        end
        task.wait(10)
    end
end)

-- ============================================
-- AUTO MASTERY FARM
-- ============================================
local masteryWeaponName = "Combat"

local function equipMasteryWeapon()
    pcall(function()
        local char = LocalPlayer.Character
        if not char then return end
        local humanoid = char:FindFirstChildWhichIsA("Humanoid")
        if not humanoid then return end
        local backpack = LocalPlayer:FindFirstChild("Backpack")
        if not backpack then return end
        local tool = backpack:FindFirstChild(masteryWeaponName)
        if not tool then return end
        humanoid:EquipTool(tool)
    end)
end

local function isMasteryWeaponEquipped()
    local char = LocalPlayer.Character
    if not char then return false end
    return char:FindFirstChild(masteryWeaponName) ~= nil
end

task.spawn(function()
    while true do
        if settings.autoMastery then
            if not isMasteryWeaponEquipped() then
                equipMasteryWeapon()
                task.wait(1)
            end
        end
        task.wait(1.5)
    end
end)

-- ============================================
-- KILL AURA INDICATOR (RANGE CIRCLE)
-- ============================================
local auraIndicatorGui = Instance.new("BillboardGui")
auraIndicatorGui.Name = "NexusAuraIndicator"
auraIndicatorGui.AlwaysOnTop = true
auraIndicatorGui.Size = UDim2.new(0, 0, 0, 0)
auraIndicatorGui.StudsOffsetWorldSpace = Vector3.new(0, 0, 0)
auraIndicatorGui.ResetOnSpawn = false

local INDICATOR_SEGMENTS = 60
local indicatorFrames = {}
local indicatorFrame = Instance.new("Frame")
indicatorFrame.BackgroundTransparency = 1
indicatorFrame.Size = UDim2.new(1, 0, 1, 0)
indicatorFrame.Parent = auraIndicatorGui

for i = 1, INDICATOR_SEGMENTS do
    local dot = Instance.new("Frame")
    dot.Size = UDim2.new(0, 4, 0, 4)
    dot.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
    dot.BorderSizePixel = 0
    dot.BackgroundTransparency = 0.3
    local dotCorner = Instance.new("UICorner")
    dotCorner.CornerRadius = UDim.new(1, 0)
    dotCorner.Parent = dot
    dot.Parent = indicatorFrame
    table.insert(indicatorFrames, dot)
end

task.spawn(function()
    while true do
        if settings.killAuraIndicator and LocalPlayer.Character then
            local hrp = getHRP(LocalPlayer.Character)
            if hrp then
                auraIndicatorGui.Parent = hrp
                auraIndicatorGui.Size = UDim2.new(0, settings.attackRange * 2, 0, settings.attackRange * 2)
                for i, dot in ipairs(indicatorFrames) do
                    local angle = (i / INDICATOR_SEGMENTS) * math.pi * 2
                    local x = 0.5 + math.cos(angle) * 0.5
                    local y = 0.5 + math.sin(angle) * 0.5
                    dot.Position = UDim2.new(x, -2, y, -2)
                    local alpha = (math.sin(tick() * 3 + i * 0.1) + 1) / 2
                    dot.BackgroundColor3 = Color3.fromRGB(255, math.floor(150 + alpha * 105), 0)
                end
            end
        else
            auraIndicatorGui.Parent = nil
        end
        task.wait(0.05)
    end
end)-- ============================================
-- MOB ESP SYSTEM
-- ============================================
local mobEspObjects = {}
local islandEspObjects = {}

local function refreshMobESP()
    for obj, objs in pairs(mobEspObjects) do
        for _, v in ipairs(objs) do pcall(function() v:Destroy() end) end
    end
    mobEspObjects = {}
    if not settings.mobESP then return end

    local enemiesFolder = Workspace:FindFirstChild("Enemies")
    if not enemiesFolder then return end

    for _, enemy in ipairs(enemiesFolder:GetChildren()) do
        local hum = enemy:FindFirstChild("Humanoid")
        if hum and hum.Health > 0 then
            local isQuestMob = false
            if currentQuest and currentQuest.mobs then
                for _, mobName in ipairs(currentQuest.mobs) do
                    if enemy.Name == mobName then isQuestMob = true; break end
                end
            end

            local objects = {}
            local hl = Instance.new("Highlight")
            hl.Parent = enemy
            hl.FillColor = isQuestMob and Color3.fromRGB(0, 255, 100) or Color3.fromRGB(255, 100, 0)
            hl.FillTransparency = 0.5
            hl.OutlineColor = Color3.new(1, 1, 1)
            hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            table.insert(objects, hl)

            local bb = Instance.new("BillboardGui")
            bb.Parent = enemy
            bb.Size = UDim2.new(0, 160, 0, 55)
            bb.StudsOffset = Vector3.new(0, 4, 0)
            bb.AlwaysOnTop = true
            bb.ResetOnSpawn = false

            local nameL = Instance.new("TextLabel")
            nameL.Parent = bb
            nameL.Size = UDim2.new(1, 0, 0, 18)
            nameL.Position = UDim2.new(0, 0, 0, 0)
            nameL.BackgroundTransparency = 1
            nameL.Text = (isQuestMob and "★ " or "") .. enemy.Name
            nameL.TextColor3 = isQuestMob and Color3.fromRGB(0, 255, 100) or Color3.fromRGB(255, 150, 0)
            nameL.Font = Enum.Font.GothamBold
            nameL.TextSize = 13

            local hpL = Instance.new("TextLabel")
            hpL.Name = "HP"
            hpL.Parent = bb
            hpL.Size = UDim2.new(1, 0, 0, 16)
            hpL.Position = UDim2.new(0, 0, 0, 19)
            hpL.BackgroundTransparency = 1
            hpL.Text = "HP: " .. math.floor(hum.Health)
            hpL.TextColor3 = Color3.fromRGB(100, 255, 100)
            hpL.Font = Enum.Font.Gotham
            hpL.TextSize = 11

            local distL = Instance.new("TextLabel")
            distL.Name = "Dist"
            distL.Parent = bb
            distL.Size = UDim2.new(1, 0, 0, 16)
            distL.Position = UDim2.new(0, 0, 0, 36)
            distL.BackgroundTransparency = 1
            distL.Text = "Dist: ?"
            distL.TextColor3 = Color3.fromRGB(200, 200, 200)
            distL.Font = Enum.Font.Gotham
            distL.TextSize = 11

            table.insert(objects, bb)
            mobEspObjects[enemy] = objects
        end
    end
end

-- ============================================
-- ISLAND ESP
-- ============================================
local function refreshIslandESP()
    for _, v in ipairs(islandEspObjects) do pcall(function() v:Destroy() end) end
    islandEspObjects = {}
    if not settings.islandESP then return end

    local sea = getCurrentSea()
    for _, island in ipairs(islandDatabase) do
        if island.sea == sea then
            local part = Instance.new("Part")
            part.Anchored = true
            part.CanCollide = false
            part.Transparency = 1
            part.Size = Vector3.new(1, 1, 1)
            part.CFrame = island.cframe
            part.Parent = Workspace

            local bb = Instance.new("BillboardGui")
            bb.Parent = part
            bb.Size = UDim2.new(0, 200, 0, 50)
            bb.StudsOffset = Vector3.new(0, 10, 0)
            bb.AlwaysOnTop = true
            bb.ResetOnSpawn = false
            bb.MaxDistance = 3000

            local nameL = Instance.new("TextLabel")
            nameL.Parent = bb
            nameL.Size = UDim2.new(1, 0, 0, 25)
            nameL.BackgroundTransparency = 1
            nameL.Text = island.name
            nameL.TextColor3 = Color3.fromRGB(255, 200, 0)
            nameL.Font = Enum.Font.GothamBold
            nameL.TextSize = 16

            local distL = Instance.new("TextLabel")
            distL.Name = "Dist"
            distL.Parent = bb
            distL.Size = UDim2.new(1, 0, 0, 20)
            distL.Position = UDim2.new(0, 0, 0, 25)
            distL.BackgroundTransparency = 1
            distL.Text = "? studs"
            distL.TextColor3 = Color3.fromRGB(200, 200, 200)
            distL.Font = Enum.Font.Gotham
            distL.TextSize = 13

            table.insert(islandEspObjects, part)
            table.insert(islandEspObjects, bb)
        end
    end
end

-- Update ESP loops
task.spawn(function()
    while true do
        if settings.mobESP and LocalPlayer.Character then
            local hrp = getHRP(LocalPlayer.Character)
            if hrp then
                for obj, objs in pairs(mobEspObjects) do
                    local objHrp = getHRP(obj)
                    local hum = obj:FindFirstChild("Humanoid")
                    for _, v in ipairs(objs) do
                        if v:IsA("BillboardGui") then
                            local distL = v:FindFirstChild("Dist")
                            if distL and objHrp then
                                distL.Text = "Dist: " .. math.floor((objHrp.Position - hrp.Position).Magnitude) .. "m"
                            end
                            local hpL = v:FindFirstChild("HP")
                            if hpL and hum then
                                hpL.Text = "HP: " .. math.floor(hum.Health) .. "/" .. math.floor(hum.MaxHealth)
                            end
                        end
                    end
                end
            end
        end
        if settings.islandESP and LocalPlayer.Character then
            local hrp = getHRP(LocalPlayer.Character)
            if hrp then
                for _, v in ipairs(islandEspObjects) do
                    if v:IsA("BillboardGui") then
                        local distL = v:FindFirstChild("Dist")
                        if distL and v.Parent then
                            local dist = (v.Parent.Position - hrp.Position).Magnitude
                            distL.Text = math.floor(dist) .. " studs"
                        end
                    end
                end
            end
        end
        task.wait(0.5)
    end
end)

task.spawn(function()
    while true do
        if settings.mobESP then refreshMobESP() end
        if settings.islandESP then refreshIslandESP() end
        task.wait(3)
    end
end)

-- ============================================
-- CHAT READER
-- ============================================
local chatMessages = {}
local chatLogLabel = nil

local function addChatMessage(playerName, message)
    local entry = "[" .. playerName .. "]: " .. message
    table.insert(chatMessages, 1, entry)
    if #chatMessages > 50 then table.remove(chatMessages, 51) end
    if chatLogLabel and chatLogLabel.Parent then
        chatLogLabel.Text = table.concat(chatMessages, "\n")
        chatLogLabel.Size = UDim2.new(1, -10, 0, #chatMessages * 20)
        if chatLogLabel.Parent and chatLogLabel.Parent:IsA("ScrollingFrame") then
            chatLogLabel.Parent.CanvasSize = UDim2.new(0, 0, 0, #chatMessages * 20 + 10)
        end
    end
end

local function hookPlayer(player)
    player.Chatted:Connect(function(msg)
        addChatMessage(player.Name, msg)
    end)
end

for _, player in ipairs(Players:GetPlayers()) do hookPlayer(player) end
Players.PlayerAdded:Connect(hookPlayer)

-- ============================================
-- MAIN MENU
-- ============================================
local gui = Instance.new("ScreenGui")
gui.Name = "NexusMenu"
gui.Parent = CoreGui
gui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame")
mainFrame.Parent = gui
local screenSize = workspace.CurrentCamera.ViewportSize
local menuW = math.clamp(screenSize.X * 0.55, 500, 800)
local menuH = math.clamp(screenSize.Y * 0.85, 500, 850)
mainFrame.Size = UDim2.new(0, menuW, 0, menuH)
mainFrame.Position = UDim2.new(0.5, -menuW/2, 0.5, -menuH/2)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Active = false

workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
    local newSize = workspace.CurrentCamera.ViewportSize
    local newW = math.clamp(newSize.X * 0.55, 500, 800)
    local newH = math.clamp(newSize.Y * 0.85, 500, 850)
    mainFrame.Size = UDim2.new(0, newW, 0, newH)
    mainFrame.Position = UDim2.new(0.5, -newW/2, 0.5, -newH/2)
end)

local menuVisible = true
mainFrame.Visible = true

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 10)
mainCorner.Parent = mainFrame

local titleBar = Instance.new("Frame")
titleBar.Parent = mainFrame
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
titleBar.BorderSizePixel = 0
titleBar.Active = true
local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 10)
titleCorner.Parent = titleBar

local titleText = Instance.new("TextLabel")
titleText.Parent = titleBar
titleText.Size = UDim2.new(1, -50, 1, 0)
titleText.Position = UDim2.new(0, 15, 0, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "NEXUS ULTIMATE"
titleText.TextColor3 = Color3.fromRGB(255, 200, 0)
titleText.Font = Enum.Font.GothamBold
titleText.TextSize = 20
titleText.TextXAlignment = Enum.TextXAlignment.Left

local closeBtn = Instance.new("TextButton")
closeBtn.Parent = titleBar
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -40, 0.5, -15)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 16
local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeBtn

closeBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
    menuVisible = false
end)

-- Drag functionality
local dragging = false
local dragStart
local startPos

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
    end
end)

titleBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

-- Tabs
local tabs = {"FARM", "PLAYER", "FLIGHT", "FRUIT", "ESP", "VISUALS", "TRAVEL", "CHAT"}
local tabButtons = {}
local currentTab = "FARM"

for i, name in ipairs(tabs) do
    local btn = Instance.new("TextButton")
    btn.Parent = mainFrame
    local tabW = (1 / #tabs)
    btn.Size = UDim2.new(tabW, -4, 0, 35)
    btn.Position = UDim2.new((i-1) * tabW, 2, 0, 50)
    btn.BackgroundColor3 = name == currentTab and Color3.fromRGB(255, 200, 0) or Color3.fromRGB(40, 40, 50)
    btn.Text = name
    btn.TextColor3 = name == currentTab and Color3.new(0,0,0) or Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 12
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = btn
    
    btn.MouseButton1Click:Connect(function()
        currentTab = name
        for _, b in ipairs(tabButtons) do
            b.BackgroundColor3 = Color3.fromRGB(40,40,50)
            b.TextColor3 = Color3.new(1,1,1)
        end
        btn.BackgroundColor3 = Color3.fromRGB(255,200,0)
        btn.TextColor3 = Color3.new(0,0,0)
        updateMenu()
    end)
    table.insert(tabButtons, btn)
end

local contentFrame = Instance.new("ScrollingFrame")
contentFrame.Parent = mainFrame
contentFrame.Size = UDim2.new(1, -20, 1, -100)
contentFrame.Position = UDim2.new(0, 10, 0, 90)
contentFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
contentFrame.BorderSizePixel = 0
contentFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
contentFrame.ScrollBarThickness = 6
contentFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 200, 0)
local contentCorner = Instance.new("UICorner")
contentCorner.CornerRadius = UDim.new(0, 8)
contentCorner.Parent = contentFrame

-- Force menu update every second to show progress
task.spawn(function()
    while true do
        if settings.autoQuest and currentQuest and menuVisible and currentTab == "FARM" then
            checkQuestProgress()
            updateMenu()
        end
        task.wait(1)
    end
end)-- ============================================
-- UI HELPERS
-- ============================================

-- Modern section header with gradient
local function createSection(title, y)
    local s = Instance.new("Frame")
    s.Parent = contentFrame
    s.Size = UDim2.new(1, -20, 0, 35)
    s.Position = UDim2.new(0, 10, 0, y)
    s.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    s.BackgroundTransparency = 0
    s.BorderSizePixel = 0
    
    local gradient = Instance.new("UIGradient")
    gradient.Parent = s
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(45, 45, 55)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 40))
    })
    gradient.Rotation = 90
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = s
    
    local icon = Instance.new("Frame")
    icon.Parent = s
    icon.Size = UDim2.new(0, 4, 0, 20)
    icon.Position = UDim2.new(0, 8, 0.5, -10)
    icon.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
    icon.BorderSizePixel = 0
    
    local iconCorner = Instance.new("UICorner")
    iconCorner.CornerRadius = UDim.new(0, 2)
    iconCorner.Parent = icon
    
    local label = Instance.new("TextLabel")
    label.Parent = s
    label.Size = UDim2.new(1, -20, 1, 0)
    label.Position = UDim2.new(0, 15, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = "  " .. title
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.GothamBold
    label.TextSize = 16
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    return y + 40
end

-- Modern toggle with animation feel
local function createToggle(name, y, default, callback, desc)
    local bg = Instance.new("Frame")
    bg.Parent = contentFrame
    bg.Size = UDim2.new(1, -20, 0, 50)
    bg.Position = UDim2.new(0, 10, 0, y)
    bg.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
    bg.BorderSizePixel = 0
    
    local gradient = Instance.new("UIGradient")
    gradient.Parent = bg
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(32, 32, 40)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 32))
    })
    gradient.Rotation = 90
    
    local bgCorner = Instance.new("UICorner")
    bgCorner.CornerRadius = UDim.new(0, 8)
    bgCorner.Parent = bg
    
    local label = Instance.new("TextLabel")
    label.Parent = bg
    label.Size = UDim2.new(0.7, -15, 0.6, 0)
    label.Position = UDim2.new(0, 15, 0, 5)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.fromRGB(240, 240, 240)
    label.Font = Enum.Font.Gotham
    label.TextSize = 15
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    if desc then
        local d = Instance.new("TextLabel")
        d.Parent = bg
        d.Size = UDim2.new(0.7, -15, 0.4, 0)
        d.Position = UDim2.new(0, 15, 0, 22)
        d.BackgroundTransparency = 1
        d.Text = desc
        d.TextColor3 = Color3.fromRGB(160, 160, 170)
        d.Font = Enum.Font.Gotham
        d.TextSize = 11
        d.TextXAlignment = Enum.TextXAlignment.Left
    end
    
    local btn = Instance.new("TextButton")
    btn.Parent = bg
    btn.Size = UDim2.new(0, 60, 0, 30)
    btn.Position = UDim2.new(1, -75, 0.5, -15)
    btn.BackgroundColor3 = default and Color3.fromRGB(255, 170, 0) or Color3.fromRGB(60, 60, 70)
    btn.Text = default and "ON" or "OFF"
    btn.TextColor3 = default and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(200, 200, 200)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.BorderSizePixel = 0
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 20)
    btnCorner.Parent = btn
    
    local state = default
    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.BackgroundColor3 = state and Color3.fromRGB(255, 170, 0) or Color3.fromRGB(60, 60, 70)
        btn.TextColor3 = state and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(200, 200, 200)
        btn.Text = state and "ON" or "OFF"
        callback(state)
    end)
    
    return y + 55
end

-- Modern slider with gradient fill
local function createSlider(name, y, min, max, default, callback, suffix)
    local bg = Instance.new("Frame")
    bg.Parent = contentFrame
    bg.Size = UDim2.new(1, -20, 0, 65)
    bg.Position = UDim2.new(0, 10, 0, y)
    bg.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
    bg.BorderSizePixel = 0
    
    local gradient = Instance.new("UIGradient")
    gradient.Parent = bg
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(32, 32, 40)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 32))
    })
    gradient.Rotation = 90
    
    local bgCorner = Instance.new("UICorner")
    bgCorner.CornerRadius = UDim.new(0, 8)
    bgCorner.Parent = bg
    
    local label = Instance.new("TextLabel")
    label.Parent = bg
    label.Size = UDim2.new(1, -30, 0, 25)
    label.Position = UDim2.new(0, 15, 0, 8)
    label.BackgroundTransparency = 1
    label.Text = name .. ": " .. default .. (suffix or "")
    label.TextColor3 = Color3.fromRGB(240, 240, 240)
    label.Font = Enum.Font.Gotham
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local sliderBg = Instance.new("Frame")
    sliderBg.Parent = bg
    sliderBg.Size = UDim2.new(1, -30, 0, 8)
    sliderBg.Position = UDim2.new(0, 15, 0, 40)
    sliderBg.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
    sliderBg.BorderSizePixel = 0
    
    local sBgCorner = Instance.new("UICorner")
    sBgCorner.CornerRadius = UDim.new(1, 0)
    sBgCorner.Parent = sliderBg
    
    local pct = (default - min) / (max - min)
    
    local sliderFill = Instance.new("Frame")
    sliderFill.Parent = sliderBg
    sliderFill.Size = UDim2.new(pct, 0, 1, 0)
    sliderFill.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
    sliderFill.BorderSizePixel = 0
    
    local fillGradient = Instance.new("UIGradient")
    fillGradient.Parent = sliderFill
    fillGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 200, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 140, 0))
    })
    fillGradient.Rotation = 90
    
    local sFillCorner = Instance.new("UICorner")
    sFillCorner.CornerRadius = UDim.new(1, 0)
    sFillCorner.Parent = sliderFill
    
    local dragCircle = Instance.new("Frame")
    dragCircle.Parent = sliderBg
    dragCircle.Size = UDim2.new(0, 18, 0, 18)
    dragCircle.Position = UDim2.new(pct, -9, 0.5, -9)
    dragCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    dragCircle.BorderSizePixel = 0
    
    local dCorner = Instance.new("UICorner")
    dCorner.CornerRadius = UDim.new(1, 0)
    dCorner.Parent = dragCircle
    
    local shadow = Instance.new("ImageLabel")
    shadow.Parent = dragCircle
    shadow.Size = UDim2.new(1.5, 0, 1.5, 0)
    shadow.Position = UDim2.new(-0.25, 0, -0.25, 0)
    shadow.BackgroundTransparency = 1
    shadow.Image = "rbxassetid://6014261993"
    shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    shadow.ImageTransparency = 0.7
    shadow.ScaleType = Enum.ScaleType.Slice
    shadow.SliceCenter = Rect.new(10, 10, 10, 10)
    
    local function updateSlider(x)
        local relX = math.clamp(x - sliderBg.AbsolutePosition.X, 0, sliderBg.AbsoluteSize.X)
        local p = relX / sliderBg.AbsoluteSize.X
        local value = min + (max - min) * p
        sliderFill.Size = UDim2.new(p, 0, 1, 0)
        dragCircle.Position = UDim2.new(p, -9, 0.5, -9)
        label.Text = name .. ": " .. math.floor(value * 10) / 10 .. (suffix or "")
        callback(value)
    end
    
    dragCircle.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then
            updateSlider(i.Position.X)
        end
    end)
    
    dragCircle.InputChanged:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseMovement and UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
            updateSlider(i.Position.X)
        end
    end)
    
    sliderBg.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then
            updateSlider(i.Position.X)
        end
    end)
    
    return y + 75
end

-- Modern button with gradient
local function createButton(name, y, callback)
    local btn = Instance.new("TextButton")
    btn.Parent = contentFrame
    btn.Size = UDim2.new(1, -20, 0, 45)
    btn.Position = UDim2.new(0, 10, 0, y)
    btn.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(0, 0, 0)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.BorderSizePixel = 0
    
    local gradient = Instance.new("UIGradient")
    gradient.Parent = btn
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 200, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 140, 0))
    })
    gradient.Rotation = 90
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = btn
    
    btn.MouseButton1Click:Connect(callback)
    
    return y + 50
end

-- Modern label
local function createLabel(text, y, color)
    local l = Instance.new("TextLabel")
    l.Parent = contentFrame
    l.Size = UDim2.new(1, -20, 0, 25)
    l.Position = UDim2.new(0, 10, 0, y)
    l.BackgroundTransparency = 1
    l.Text = text
    l.TextColor3 = color or Color3.fromRGB(200, 200, 200)
    l.Font = Enum.Font.Gotham
    l.TextSize = 14
    l.TextXAlignment = Enum.TextXAlignment.Left
    return y + 30
end

-- Modern dropdown
local function createDropdown(name, y, options, default, callback)
    local bg = Instance.new("Frame")
    bg.Parent = contentFrame
    bg.Size = UDim2.new(1, -20, 0, 50)
    bg.Position = UDim2.new(0, 10, 0, y)
    bg.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
    bg.BorderSizePixel = 0
    
    local gradient = Instance.new("UIGradient")
    gradient.Parent = bg
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(32, 32, 40)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 32))
    })
    gradient.Rotation = 90
    
    local bgCorner = Instance.new("UICorner")
    bgCorner.CornerRadius = UDim.new(0, 8)
    bgCorner.Parent = bg
    
    local label = Instance.new("TextLabel")
    label.Parent = bg
    label.Size = UDim2.new(0.5, -10, 1, 0)
    label.Position = UDim2.new(0, 15, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.fromRGB(240, 240, 240)
    label.Font = Enum.Font.Gotham
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local dropdown = Instance.new("TextButton")
    dropdown.Parent = bg
    dropdown.Size = UDim2.new(0, 130, 0, 32)
    dropdown.Position = UDim2.new(1, -140, 0.5, -16)
    dropdown.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
    dropdown.Text = default
    dropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
    dropdown.Font = Enum.Font.Gotham
    dropdown.TextSize = 12
    dropdown.BorderSizePixel = 0
    
    local ddCorner = Instance.new("UICorner")
    ddCorner.CornerRadius = UDim.new(0, 6)
    ddCorner.Parent = dropdown
    
    local expanded = false
    local dropdownList = nil
    
    dropdown.MouseButton1Click:Connect(function()
        expanded = not expanded
        if expanded then
            if dropdownList then dropdownList:Destroy() end
            dropdownList = Instance.new("Frame")
            dropdownList.Parent = gui
            dropdownList.Size = UDim2.new(0, 130, 0, #options * 32)
            dropdownList.Position = UDim2.new(0, bg.AbsolutePosition.X + bg.AbsoluteSize.X - 140, 0, bg.AbsolutePosition.Y + 55)
            dropdownList.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
            dropdownList.BorderSizePixel = 0
            dropdownList.ZIndex = 10
            
            local lCorner = Instance.new("UICorner")
            lCorner.CornerRadius = UDim.new(0, 6)
            lCorner.Parent = dropdownList
            
            for i, option in ipairs(options) do
                local ob = Instance.new("TextButton")
                ob.Parent = dropdownList
                ob.Size = UDim2.new(1, 0, 0, 32)
                ob.Position = UDim2.new(0, 0, 0, (i-1) * 32)
                ob.BackgroundColor3 = i % 2 == 0 and Color3.fromRGB(45, 45, 55) or Color3.fromRGB(40, 40, 50)
                ob.Text = option
                ob.TextColor3 = Color3.fromRGB(255, 255, 255)
                ob.Font = Enum.Font.Gotham
                ob.TextSize = 12
                ob.ZIndex = 11
                ob.BorderSizePixel = 0
                
                ob.MouseButton1Click:Connect(function()
                    dropdown.Text = option
                    callback(option)
                    expanded = false
                    dropdownList:Destroy()
                end)
            end
        else
            if dropdownList then dropdownList:Destroy() end
        end
    end)
    
    return y + 55
end

-- Island picker
local function createIslandPicker(y)
    local bg = Instance.new("Frame")
    bg.Parent = contentFrame
    bg.Size = UDim2.new(1, -20, 0, 45)
    bg.Position = UDim2.new(0, 10, 0, y)
    bg.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
    bg.BorderSizePixel = 0
    
    local gradient = Instance.new("UIGradient")
    gradient.Parent = bg
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(32, 32, 40)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 32))
    })
    gradient.Rotation = 90
    
    local bgCorner = Instance.new("UICorner")
    bgCorner.CornerRadius = UDim.new(0, 6)
    bgCorner.Parent = bg
    
    local label = Instance.new("TextLabel")
    label.Parent = bg
    label.Size = UDim2.new(0.4, -10, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = "Island"
    label.TextColor3 = Color3.new(1, 1, 1)
    label.Font = Enum.Font.Gotham
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local dropdown = Instance.new("TextButton")
    dropdown.Parent = bg
    dropdown.Size = UDim2.new(0, 180, 0, 30)
    dropdown.Position = UDim2.new(1, -190, 0.5, -15)
    dropdown.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
    dropdown.Text = "Select Island"
    dropdown.TextColor3 = Color3.new(1, 1, 1)
    dropdown.Font = Enum.Font.Gotham
    dropdown.TextSize = 12
    dropdown.BorderSizePixel = 0
    local ddCorner = Instance.new("UICorner")
    ddCorner.CornerRadius = UDim.new(0, 6)
    ddCorner.Parent = dropdown
    
    local goBtn = Instance.new("TextButton")
    goBtn.Parent = bg
    goBtn.Size = UDim2.new(0, 50, 0, 30)
    goBtn.Position = UDim2.new(1, -60, 0.5, -15)
    goBtn.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
    goBtn.Text = "GO"
    goBtn.TextColor3 = Color3.new(0, 0, 0)
    goBtn.Font = Enum.Font.GothamBold
    goBtn.TextSize = 12
    goBtn.BorderSizePixel = 0
    local goCorner = Instance.new("UICorner")
    goCorner.CornerRadius = UDim.new(0, 6)
    goCorner.Parent = goBtn
    
    local expanded = false
    local dropdownList = nil
    local selectedIsland = nil
    
    dropdown.MouseButton1Click:Connect(function()
        expanded = not expanded
        if expanded then
            if dropdownList then dropdownList:Destroy() end
            local sea = getCurrentSea()
            local filtered = {}
            for _, island in ipairs(islandDatabase) do
                if island.sea == sea then table.insert(filtered, island) end
            end
            dropdownList = Instance.new("Frame")
            dropdownList.Parent = gui
            dropdownList.Size = UDim2.new(0, 180, 0, #filtered * 25)
            dropdownList.Position = UDim2.new(0, bg.AbsolutePosition.X + bg.AbsoluteSize.X - 190, 0, bg.AbsolutePosition.Y + 45)
            dropdownList.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
            dropdownList.BorderSizePixel = 0
            dropdownList.ZIndex = 10
            local lCorner = Instance.new("UICorner")
            lCorner.CornerRadius = UDim.new(0, 6)
            lCorner.Parent = dropdownList
            
            for i, island in ipairs(filtered) do
                local ob = Instance.new("TextButton")
                ob.Parent = dropdownList
                ob.Size = UDim2.new(1, 0, 0, 25)
                ob.Position = UDim2.new(0, 0, 0, (i-1) * 25)
                ob.BackgroundColor3 = i % 2 == 0 and Color3.fromRGB(50, 50, 60) or Color3.fromRGB(45, 45, 55)
                ob.Text = island.name
                ob.TextColor3 = Color3.new(1, 1, 1)
                ob.Font = Enum.Font.Gotham
                ob.TextSize = 11
                ob.ZIndex = 11
                ob.BorderSizePixel = 0
                
                ob.MouseButton1Click:Connect(function()
                    dropdown.Text = island.name
                    selectedIsland = island
                    expanded = false
                    dropdownList:Destroy()
                end)
            end
        else
            if dropdownList then dropdownList:Destroy() end
        end
    end)
    
    goBtn.MouseButton1Click:Connect(function()
        if selectedIsland then
            travelToIsland(selectedIsland)
        else
            notify("Select an island first")
        end
    end)
    
    return y + 50
end-- ============================================
-- UPDATE MENU FUNCTION
-- ============================================
function updateMenu()
    for _, child in ipairs(contentFrame:GetChildren()) do child:Destroy() end
    local y = 10
    local level = getPlayerLevel()
    local sea = getCurrentSea()
    local side = getPlayerSide()
    local questName = currentQuest and currentQuest.name or "None"
    local questMobs = currentQuest and table.concat(currentQuest.mobs, ", ") or "None"

    if currentTab == "FARM" then
        y = createSection("AUTO FARM", y)
        y = createToggle("Auto Farm Level", y, settings.autoFarmLevel, function(v)
            settings.autoFarmLevel = v
            if v then settings.autoFarmNearest = false end
        end, "Quest mob only, stays at kill spot")
        y = createToggle("Auto Farm Nearest", y, settings.autoFarmNearest, function(v)
            settings.autoFarmNearest = v
            if v then settings.autoFarmLevel = false end
        end, "Farms nearest mobs on current island")
        y = createToggle("Auto Quest", y, settings.autoQuest, function(v) settings.autoQuest = v end, "Auto accepts best quest for level")
        y = createToggle("Auto Travel", y, settings.autoTravel, function(v) settings.autoTravel = v end, "Travels if 1500+ studs from island")
        y = y + 5
        y = createLabel("Quest: " .. questName, y, Color3.fromRGB(255, 200, 0))
        y = createLabel("Target: " .. questMobs, y, Color3.fromRGB(200, 200, 100))
        if currentQuest then
            y = createLabel("Progress: " .. questProgress .. "%", y, Color3.fromRGB(100, 255, 100))
        end
        y = createLabel("Level: " .. level .. "  |  Sea: " .. sea .. "  |  " .. side, y)
        y = y + 10
        
        y = createSection("ATTACK METHODS", y)
        y = createToggle("Fast Attack", y, settings.fastAttack, function(v) settings.fastAttack = v end, "Arms rotation")
        y = createToggle("Long Reach", y, settings.longReach, function(v) settings.longReach = v end, "Burst method")
        y = createToggle("Attack Players", y, settings.attackPlayers, function(v) settings.attackPlayers = v end, "Fast/Long reach hits players too")
        y = createToggle("Mob Aura", y, settings.mobAura, function(v) settings.mobAura = v end, "Damage all nearby")
        y = createToggle("Bring Mobs", y, settings.bringMobs, function(v) settings.bringMobs = v end, "Pull enemies under you (max 3)")
        y = y + 10
        
        y = createSection("FARM SETTINGS", y)
        y = createSlider("Farm Height", y, 5, 30, settings.farmHeight, function(v) settings.farmHeight = v end, "m")
        y = createSlider("Attack Speed", y, 2, 20, settings.attackSpeed * 100, function(v) settings.attackSpeed = v / 100 end, "%")
        y = createSlider("Attack Range", y, 10, 1000, settings.attackRange, function(v) settings.attackRange = v end, "m")
        y = y + 10
        
        y = createSection("AUTO HITTER", y)
        y = createToggle("Auto Hitter", y, settings.autoHitter, function(v) settings.autoHitter = v end, "Dual remote spam")
        y = createSlider("Hitter CPS", y, 5, 60, settings.hitterCPS, function(v) settings.hitterCPS = v end)
        y = createSlider("Hitter Range", y, 10, 40, settings.hitterRange, function(v) settings.hitterRange = v end, "m")
        y = y + 10
        
        y = createSection("UTILITIES", y)
        y = createToggle("Kill Aura Indicator", y, settings.killAuraIndicator, function(v) settings.killAuraIndicator = v end, "Shows attack range circle")
        y = createToggle("Server Hop", y, settings.serverHop, function(v) settings.serverHop = v end, "Hops if too many players")
        y = createSlider("Max Players", y, 2, 20, settings.serverHopMinPlayers, function(v) settings.serverHopMinPlayers = math.floor(v) end)

    elseif currentTab == "PLAYER" then
        y = createSection("SPEED", y)
        y = createToggle("Speed Enabled", y, settings.speedEnabled, toggleSpeed)
        y = createSlider("Speed Value", y, 16, 1000, settings.speedValue, updateSpeed)
        y = createToggle("Jump Enabled", y, settings.jumpEnabled, toggleJump)
        y = createSlider("Jump Value", y, 50, 500, settings.jumpValue, updateJump)
        y = createToggle("Walk on Water", y, settings.walkOnWater, toggleWaterWalk)
        y = createToggle("No Clip", y, settings.noClip, function(v) settings.noClip = v end)
        y = createToggle("Anti AFK", y, settings.antiAfk, function(v) settings.antiAfk = v end)
        y = createToggle("Auto Haki", y, settings.autoHaki, function(v) settings.autoHaki = v end)
        y = y + 10
        
        y = createSection("AUTO MASTERY", y)
        y = createToggle("Auto Mastery", y, settings.autoMastery, function(v) settings.autoMastery = v end, "Keeps mastery weapon equipped")
        y = createDropdown("Mastery Weapon", y, {
            "Combat", "Enhanced", "Electric", "Water Kung Fu",
            "Dark Step", "Sky Steps", "Black Leg", "Death Step",
            "Electro", "Sharkman Karate", "Dragon Talon",
            "Superhuman", "Dragon Breath", "Dual-Headed Blade"
        }, masteryWeaponName, function(v)
            masteryWeaponName = v
            notify("Mastery weapon: " .. v)
        end)
        y = y + 10
        
        y = createSection("FIGHTING STYLE", y)
        y = createToggle("Auto Equip Fighting", y, autoEquipFighting, function(v)
            autoEquipFighting = v
            if v then equipFightingStyle() end
        end, "Style: " .. fightingStyleName)
        y = createDropdown("Fighting Style", y, {
            "Melee", "Fruit", "Sword", "Gun"
        }, fightingStyleName, function(v)
            fightingStyleName = v
            notify("Style: " .. v)
            if autoEquipFighting then equipFightingStyle() end
        end)
        y = y + 10
        
        y = createSection("STATS", y)
        y = createToggle("Auto Stats", y, settings.autoStats, function(v) settings.autoStats = v end)
        y = createDropdown("Stat Priority", y, {"Melee","Defense","Sword","Gun","Fruit"}, settings.statPriority, function(v) settings.statPriority = v end)

    elseif currentTab == "FLIGHT" then
        y = createSection("FLIGHT", y)
        y = createToggle("Fly Mode", y, settings.flyEnabled, toggleFly)
        y = createSlider("Fly Speed", y, 10, 200, settings.flySpeed, function(v) settings.flySpeed = v end)

    elseif currentTab == "FRUIT" then
        y = createSection("FRUIT SNIPER", y)
        y = createToggle("Fruit Sniper", y, settings.fruitSniper, function(v) settings.fruitSniper = v end)
        y = createSlider("Snipe Delay", y, 1, 10, settings.snipeDelay, function(v) settings.snipeDelay = v end, "s")
        y = y + 10
        
        y = createSection("RARITY SETTINGS", y)
        y = createLabel("MYTHIC", y, Color3.fromRGB(255, 0, 0))
        y = createDropdown("Mythic Action", y, {"Warn","Store","Ignore"}, settings.fruitRarity.Mythic.action, function(v) settings.fruitRarity.Mythic.action = v end)
        y = createToggle("Mythic AutoStore", y, settings.fruitRarity.Mythic.autoStore, function(v) settings.fruitRarity.Mythic.autoStore = v end)
        
        y = createLabel("LEGENDARY", y, Color3.fromRGB(255, 165, 0))
        y = createDropdown("Legendary Action", y, {"Store","Warn","Ignore"}, settings.fruitRarity.Legendary.action, function(v) settings.fruitRarity.Legendary.action = v end)
        y = createToggle("Legendary AutoStore", y, settings.fruitRarity.Legendary.autoStore, function(v) settings.fruitRarity.Legendary.autoStore = v end)
        
        y = createLabel("EPIC", y, Color3.fromRGB(128, 0, 128))
        y = createDropdown("Epic Action", y, {"Store","Warn","Ignore"}, settings.fruitRarity.Epic.action, function(v) settings.fruitRarity.Epic.action = v end)
        y = createToggle("Epic AutoStore", y, settings.fruitRarity.Epic.autoStore, function(v) settings.fruitRarity.Epic.autoStore = v end)
        
        y = createLabel("RARE", y, Color3.fromRGB(0, 0, 255))
        y = createDropdown("Rare Action", y, {"Store","Warn","Ignore"}, settings.fruitRarity.Rare.action, function(v) settings.fruitRarity.Rare.action = v end)
        y = createToggle("Rare AutoStore", y, settings.fruitRarity.Rare.autoStore, function(v) settings.fruitRarity.Rare.autoStore = v end)
        
        y = createLabel("COMMON", y, Color3.fromRGB(128, 128, 128))
        y = createDropdown("Common Action", y, {"Ignore","Store","Warn"}, settings.fruitRarity.Common.action, function(v) settings.fruitRarity.Common.action = v end)

    elseif currentTab == "ESP" then
        y = createSection("ESP", y)
        y = createToggle("Player ESP", y, settings.playerESP, function(v) settings.playerESP = v; refreshESP() end)
        y = createToggle("Fruit ESP", y, settings.fruitESP, function(v) settings.fruitESP = v; refreshESP() end)
        y = createToggle("Chest ESP", y, settings.chestESP, function(v) settings.chestESP = v; refreshESP() end)
        y = y + 10
        
        y = createSection("DISPLAY", y)
        y = createToggle("Show Distance", y, settings.showDistance, function(v) settings.showDistance = v; refreshESP() end)
        y = createToggle("Show Health", y, settings.showHealth, function(v) settings.showHealth = v; refreshESP() end)
        y = createToggle("Show Name", y, settings.showName, function(v) settings.showName = v; refreshESP() end)
        y = createToggle("Rainbow ESP", y, settings.espRainbow, function(v) settings.espRainbow = v; refreshESP() end)
        y = y + 10
        
        y = createSection("MOB ESP", y)
        y = createToggle("Mob ESP", y, settings.mobESP, function(v)
            settings.mobESP = v
            if not v then
                for obj, objs in pairs(mobEspObjects) do
                    for _, ov in ipairs(objs) do pcall(function() ov:Destroy() end) end
                end
                mobEspObjects = {}
            end
        end, "Quest mobs highlighted in green")
        
        y = createToggle("Island ESP", y, settings.islandESP, function(v)
            settings.islandESP = v
            if not v then
                for _, ov in ipairs(islandEspObjects) do pcall(function() ov:Destroy() end) end
                islandEspObjects = {}
            else
                refreshIslandESP()
            end
        end, "Shows island names + distance")
        y = y + 10
        
        y = createSection("ESP COLOR", y)
        y = createColorPicker("ESP Color", y, settings.espColor, function(c)
            settings.espColor = c
            refreshESP()
        end)

    elseif currentTab == "VISUALS" then
        y = createSection("WORLD VISUALS", y)
        y = createToggle("World Visuals", y, settings.worldVisuals, toggleVisuals)
        y = y + 10
        
        y = createSection("LIGHTING", y)
        y = createToggle("Bright Mode", y, settings.brightMode, function(v) settings.brightMode = v; if v then settings.darkMode = false end; applyVisuals() end)
        y = createToggle("Dark Mode", y, settings.darkMode, function(v) settings.darkMode = v; if v then settings.brightMode = false end; applyVisuals() end)
        y = createToggle("Remove Fog", y, settings.removeFog, function(v) settings.removeFog = v; applyVisuals() end)
        y = createToggle("X-Ray", y, settings.xRay, function(v) settings.xRay = v; applyVisuals() end)
        y = y + 10
        
        y = createSection("SKYBOX", y)
        y = createDropdown("Skybox", y, {"Default","Galaxy","Sunset","Night","Blood Moon","Underwater","Bloxfruits Custom"}, currentSkybox or "Default", function(v)
            applySkybox(v)
        end)
        y = y + 10
        
        y = createSection("COLOR CORRECTION", y)
        y = createDropdown("Color Preset", y, {"Normal","Vibrant","Cinematic","Red Tint","Blue Tint","Green","Purple","Golden","Grayscale","Horror"}, "Normal", function(v)
            if v == "Normal" then
                removeColorCorrection()
            else
                local p = colorPresets[v]
                if p then applyColorCorrection(p[1], p[2], p[3], p[4], p[5], p[6]) end
            end
        end)
        
        y = createSlider("Brightness", y, -1, 1, colorCorrection and colorCorrection.Brightness or 0, function(v)
            applyColorCorrection(v,
                colorCorrection and colorCorrection.Contrast or 0,
                colorCorrection and colorCorrection.Saturation or 0,
                colorCorrection and colorCorrection.TintColor.R or 1,
                colorCorrection and colorCorrection.TintColor.G or 1,
                colorCorrection and colorCorrection.TintColor.B or 1)
        end)
        
        y = createSlider("Contrast", y, -1, 1, colorCorrection and colorCorrection.Contrast or 0, function(v)
            applyColorCorrection(
                colorCorrection and colorCorrection.Brightness or 0,
                v,
                colorCorrection and colorCorrection.Saturation or 0,
                colorCorrection and colorCorrection.TintColor.R or 1,
                colorCorrection and colorCorrection.TintColor.G or 1,
                colorCorrection and colorCorrection.TintColor.B or 1)
        end)
        
        y = createSlider("Saturation", y, -1, 1, colorCorrection and colorCorrection.Saturation or 0, function(v)
            applyColorCorrection(
                colorCorrection and colorCorrection.Brightness or 0,
                colorCorrection and colorCorrection.Contrast or 0,
                v,
                colorCorrection and colorCorrection.TintColor.R or 1,
                colorCorrection and colorCorrection.TintColor.G or 1,
                colorCorrection and colorCorrection.TintColor.B or 1)
        end)
        
        y = createSection("WORLD TINT COLOR", y)
        y = createColorPicker("Tint Color", y, colorCorrection and colorCorrection.TintColor or Color3.new(1,1,1), function(c)
            applyColorCorrection(
                colorCorrection and colorCorrection.Brightness or 0,
                colorCorrection and colorCorrection.Contrast or 0,
                colorCorrection and colorCorrection.Saturation or 0,
                c.R, c.G, c.B
            )
        end)
        
        y = createButton("Reset Visuals", y, function()
            removeColorCorrection()
            applySkybox("Default")
            revertVisuals()
            notify("Visuals reset!")
        end)
        y = y + 10
        
        y = createSection("REMOVE OBJECTS", y)
        y = createToggle("Remove Water", y, settings.removeWater, function(v) settings.removeWater = v; applyVisuals() end)
        y = createToggle("Remove Lava", y, settings.removeLava, function(v) settings.removeLava = v; applyVisuals() end)
        y = createToggle("Remove Trees", y, settings.removeTrees, function(v) settings.removeTrees = v; applyVisuals() end)
        y = createToggle("Remove Rocks", y, settings.removeRocks, function(v) settings.removeRocks = v; applyVisuals() end)
        y = createToggle("Remove Grass", y, settings.removeGrass, function(v) settings.removeGrass = v; applyVisuals() end)
        y = createToggle("Remove Clouds", y, settings.removeClouds, function(v) settings.removeClouds = v; applyVisuals() end)

    elseif currentTab == "TRAVEL" then
        y = createSection("TRAVEL SETTINGS", y)
        y = createSlider("Travel Speed", y, 50, 500, settings.travelSpeed, function(v) settings.travelSpeed = v end)
        y = y + 10
        y = createSection("ISLAND PICKER", y)
        y = createIslandPicker(y)
        y = y + 10
        y = createSection("SEA HOP", y)
        y = createButton("First Sea", y, function() hopToSea("First") end)
        y = createButton("Second Sea", y, function() hopToSea("Second") end)
        y = createButton("Third Sea", y, function() hopToSea("Third") end)
        y = y + 10
        y = createLabel("Level: " .. level, y)
        y = createLabel("Sea: " .. sea, y)
        y = createLabel("Side: " .. side, y)

    elseif currentTab == "CHAT" then
        y = createSection("CHAT LOG", y)
        y = createLabel("All server chat messages appear here", y, Color3.fromRGB(150, 150, 150))
        
        local clearBtn = Instance.new("TextButton")
        clearBtn.Parent = contentFrame
        clearBtn.Size = UDim2.new(1, -20, 0, 35)
        clearBtn.Position = UDim2.new(0, 10, 0, y)
        clearBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        clearBtn.Text = "Clear Log"
        clearBtn.TextColor3 = Color3.new(1, 1, 1)
        clearBtn.Font = Enum.Font.GothamBold
        clearBtn.TextSize = 14
        clearBtn.BorderSizePixel = 0
        local cCorner = Instance.new("UICorner")
        cCorner.CornerRadius = UDim.new(0, 6)
        cCorner.Parent = clearBtn
        clearBtn.MouseButton1Click:Connect(function()
            chatMessages = {}
            if chatLogLabel then chatLogLabel.Text = "Cleared." end
        end)
        y = y + 42
        
        local chatScroll = Instance.new("ScrollingFrame")
        chatScroll.Parent = contentFrame
        chatScroll.Size = UDim2.new(1, -20, 0, 500)
        chatScroll.Position = UDim2.new(0, 10, 0, y)
        chatScroll.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
        chatScroll.BorderSizePixel = 0
        chatScroll.ScrollBarThickness = 4
        chatScroll.ScrollBarImageColor3 = Color3.fromRGB(255, 200, 0)
        chatScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
        local csCorner = Instance.new("UICorner")
        csCorner.CornerRadius = UDim.new(0, 6)
        csCorner.Parent = chatScroll
        
        local msgLabel = Instance.new("TextLabel")
        msgLabel.Parent = chatScroll
        msgLabel.Size = UDim2.new(1, -10, 0, 20)
        msgLabel.Position = UDim2.new(0, 5, 0, 5)
        msgLabel.BackgroundTransparency = 1
        msgLabel.TextColor3 = Color3.new(1, 1, 1)
        msgLabel.Font = Enum.Font.Gotham
        msgLabel.TextSize = 13
        msgLabel.TextXAlignment = Enum.TextXAlignment.Left
        msgLabel.TextYAlignment = Enum.TextYAlignment.Top
        msgLabel.TextWrapped = true
        
        if #chatMessages > 0 then
            msgLabel.Text = table.concat(chatMessages, "\n")
            msgLabel.Size = UDim2.new(1, -10, 0, #chatMessages * 20)
            chatScroll.CanvasSize = UDim2.new(0, 0, 0, #chatMessages * 20 + 10)
        else
            msgLabel.Text = "No messages yet. Chat is being monitored."
            msgLabel.TextColor3 = Color3.fromRGB(100, 100, 100)
        end
        chatLogLabel = msgLabel
        y = y + 510
    end

    contentFrame.CanvasSize = UDim2.new(0, 0, 0, y + 10)
end

updateMenu()-- ============================================
-- MAIN LOOP
-- ============================================
RunService.Heartbeat:Connect(function(dt)
    local fps = math.floor(1 / dt)
    watermarkText.Text = string.format("NEXUS | Lvl %d | %d FPS | %s", getPlayerLevel(), fps, getCurrentSea())
    if settings.espRainbow then
        for obj, objs in pairs(espObjects) do
            for _, espObj in ipairs(objs) do
                if espObj:IsA("Highlight") then
                    espObj.FillColor = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                end
            end
        end
    end
end)

task.wait(1)
watermarkText.Text = "NEXUS | READY - F1 to open"
notify("NEXUS READY - Press F1")

-- ============================================
-- MINIMIZE BUTTON
-- ============================================
local minimizeGui = Instance.new("ScreenGui")
minimizeGui.Name = "NexusMinimize"
minimizeGui.Parent = CoreGui
minimizeGui.ResetOnSpawn = false
minimizeGui.DisplayOrder = 1000

local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Parent = minimizeGui
minimizeBtn.Size = UDim2.new(0, 60, 0, 60)
minimizeBtn.Position = UDim2.new(0, 20, 0.5, -30)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
minimizeBtn.BorderSizePixel = 0
minimizeBtn.Text = ""
minimizeBtn.Visible = false
minimizeBtn.Active = true
minimizeBtn.ZIndex = 2
local minimizeCorner = Instance.new("UICorner")
minimizeCorner.CornerRadius = UDim.new(1, 0)
minimizeCorner.Parent = minimizeBtn

-- Orange ring behind button
local minimizeRing = Instance.new("Frame")
minimizeRing.Parent = minimizeGui
minimizeRing.Size = UDim2.new(0, 66, 0, 66)
minimizeRing.Position = UDim2.new(0, 17, 0.5, -33)
minimizeRing.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
minimizeRing.BorderSizePixel = 0
minimizeRing.Visible = false
minimizeRing.ZIndex = 1
local minimizeRingCorner = Instance.new("UICorner")
minimizeRingCorner.CornerRadius = UDim.new(1, 0)
minimizeRingCorner.Parent = minimizeRing

-- Ornate N logo
local nLogo = Instance.new("TextLabel")
nLogo.Parent = minimizeBtn
nLogo.Size = UDim2.new(1, 0, 1, 0)
nLogo.BackgroundTransparency = 1
nLogo.Text = "N"
nLogo.TextColor3 = Color3.fromRGB(255, 200, 0)
nLogo.Font = Enum.Font.Fondamento
nLogo.TextSize = 30
nLogo.TextStrokeTransparency = 0.5
nLogo.TextStrokeColor3 = Color3.fromRGB(200, 100, 0)
nLogo.ZIndex = 3

-- Update ring position when button moves
local function syncRing()
    minimizeRing.Position = UDim2.new(
        minimizeBtn.Position.X.Scale,
        minimizeBtn.Position.X.Offset - 3,
        minimizeBtn.Position.Y.Scale,
        minimizeBtn.Position.Y.Offset - 3
    )
end

-- Drag functionality for minimize button
local minDragging = false
local minDragStart = nil
local minStartPos = nil

minimizeBtn.InputBegan:Connect(function(input)
    local t = input.UserInputType
    if t == Enum.UserInputType.MouseButton1 or t == Enum.UserInputType.Touch then
        minDragging = true
        minDragStart = input.Position
        minStartPos = minimizeBtn.Position
    end
end)

minimizeBtn.InputEnded:Connect(function(input)
    local t = input.UserInputType
    if t == Enum.UserInputType.MouseButton1 or t == Enum.UserInputType.Touch then
        minDragging = false
    end
end)

UIS.InputChanged:Connect(function(input)
    local t = input.UserInputType
    if minDragging and (t == Enum.UserInputType.MouseMovement or t == Enum.UserInputType.Touch) then
        local delta = input.Position - minDragStart
        minimizeBtn.Position = UDim2.new(
            minStartPos.X.Scale,
            minStartPos.X.Offset + delta.X,
            minStartPos.Y.Scale,
            minStartPos.Y.Offset + delta.Y
        )
        syncRing()
    end
end)

-- Click to reopen
minimizeBtn.MouseButton1Click:Connect(function()
    minimizeBtn.Visible = false
    minimizeRing.Visible = false
    mainFrame.Visible = true
    menuVisible = true
end)

-- Hook close button to show minimize
closeBtn.MouseButton1Click:Connect(function()
    syncRing()
    minimizeBtn.Visible = true
    minimizeRing.Visible = true
end)

-- Hook F1 to show/hide with minimize support
UIS.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.F1 then
        if mainFrame.Visible then
            mainFrame.Visible = false
            menuVisible = false
            syncRing()
            minimizeBtn.Visible = true
            minimizeRing.Visible = true
        else
            mainFrame.Visible = true
            menuVisible = true
            minimizeBtn.Visible = false
            minimizeRing.Visible = false
        end
    end
end)

-- Pulse animation on the ring
task.spawn(function()
    local t = 0
    while true do
        t = t + 0.05
        local alpha = (math.sin(t) + 1) / 2
        if minimizeRing.Visible then
            minimizeRing.BackgroundColor3 = Color3.fromRGB(
                255,
                math.floor(120 + alpha * 80),
                0
            )
        end
        task.wait(0.05)
    end
end)

-- ============================================
-- SMART AUTO EQUIP SYSTEM
-- ============================================
local autoEquipSettings = {
    melee = true,
    sword = true,
    gun = true,
    fruit = true,
    priority = {"sword", "melee", "gun", "fruit"}
}

local currentEquipped = {
    melee = nil,
    sword = nil,
    gun = nil,
    fruit = nil
}

-- Scan inventory for all equippable items
local function scanInventory()
    local inventory = {
        melee = {},
        sword = {},
        gun = {},
        fruit = {}
    }
    
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    if backpack then
        for _, tool in ipairs(backpack:GetChildren()) do
            if tool:IsA("Tool") then
                local name = tool.Name:lower()
                
                if name:find("combat") or name:find("electro") or name:find("water") or 
                   name:find("dark") or name:find("black") or name:find("death") or
                   name:find("sharkman") or name:find("dragon") or name:find("superhuman") or
                   name:find("electric") or name:find("step") or name:find("leg") then
                    table.insert(inventory.melee, tool.Name)
                
                elseif name:find("blade") or name:find("sword") or name:find("katana") or
                      name:find("saber") or name:find("cutlass") or name:find("pipe") or
                      name:find("dual") or name:find("headed") or name:find("triple") or
                      name:find("pole") or name:find("staff") or name:find("cane") then
                    table.insert(inventory.sword, tool.Name)
                
                elseif name:find("gun") or name:find("rifle") or name:find("bazooka") or
                      name:find("cannon") or name:find("shotgun") or name:find("musket") or
                      name:find("flintlock") or name:find("pistol") or name:find("dual") then
                    table.insert(inventory.gun, tool.Name)
                
                elseif name:find("fruit") or name:find("buddha") or name:find("dough") or
                      name:find("dragon") or name:find("gravity") or name:find("control") or
                      name:find("spirit") or name:find("venom") or name:find("shadow") then
                    table.insert(inventory.fruit, tool.Name)
                end
            end
        end
    end
    
    local char = LocalPlayer.Character
    if char then
        for _, tool in ipairs(char:GetChildren()) do
            if tool:IsA("Tool") then
                local name = tool.Name:lower()
                
                if name:find("combat") or name:find("electro") or name:find("water") or 
                   name:find("dark") or name:find("black") or name:find("death") or
                   name:find("sharkman") or name:find("dragon") or name:find("superhuman") or
                   name:find("electric") or name:find("step") or name:find("leg") then
                    currentEquipped.melee = tool.Name
                
                elseif name:find("blade") or name:find("sword") or name:find("katana") or
                      name:find("saber") or name:find("cutlass") or name:find("pipe") or
                      name:find("dual") or name:find("headed") or name:find("triple") or
                      name:find("pole") or name:find("staff") or name:find("cane") then
                    currentEquipped.sword = tool.Name
                
                elseif name:find("gun") or name:find("rifle") or name:find("bazooka") or
                      name:find("cannon") or name:find("shotgun") or name:find("musket") or
                      name:find("flintlock") or name:find("pistol") or name:find("dual") then
                    currentEquipped.gun = tool.Name
                
                elseif name:find("fruit") or name:find("buddha") or name:find("dough") or
                      name:find("dragon") or name:find("gravity") or name:find("control") or
                      name:find("spirit") or name:find("venom") or name:find("shadow") then
                    currentEquipped.fruit = tool.Name
                end
            end
        end
    end
    
    return inventory
end

-- Equip specific item by name
local function equipItem(itemName)
    if not itemName then return false end
    
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    if backpack then
        local tool = backpack:FindFirstChild(itemName)
        if tool and tool:IsA("Tool") then
            local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
            if humanoid then
                pcall(function()
                    humanoid:EquipTool(tool)
                end)
                return true
            end
        end
    end
    return false
end

-- Smart auto equip loop
task.spawn(function()
    while true do
        if autoEquipSettings.melee or autoEquipSettings.sword or 
           autoEquipSettings.gun or autoEquipSettings.fruit then
            
            local inventory = scanInventory()
            local char = LocalPlayer.Character
            
            if char then
                local humanoid = char:FindFirstChildWhichIsA("Humanoid")
                if humanoid then
                    for _, slot in ipairs(autoEquipSettings.priority) do
                        if autoEquipSettings[slot] then
                            local shouldEquip = false
                            local currentItem = currentEquipped[slot]
                            
                            if not currentItem then
                                if #inventory[slot] > 0 then
                                    shouldEquip = true
                                end
                            else
                                local stillHas = false
                                for _, item in ipairs(inventory[slot]) do
                                    if item == currentItem then
                                        stillHas = true
                                        break
                                    end
                                end
                                if not stillHas and #inventory[slot] > 0 then
                                    shouldEquip = true
                                end
                            end
                            
                            if shouldEquip and #inventory[slot] > 0 then
                                local success = equipItem(inventory[slot][1])
                                if success then
                                    currentEquipped[slot] = inventory[slot][1]
                                    notify("Equipped: " .. inventory[slot][1])
                                end
                                task.wait(0.5)
                            end
                        end
                    end
                end
            end
        end
        task.wait(2)
    end
end)

-- ============================================
-- FINAL NOTIFICATION
-- ============================================
print("✅ NEXUS ULTIMATE LOADED SUCCESSFULLY")
notify("NEXUS ULTIMATE - Ready to dominate! 🔥")
