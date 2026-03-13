-- ============================================
-- NEXUS ULTIMATE - COMPLETE EDITION
-- ============================================
-- ✅ ALL FARM FEATURES IN ONE TAB
-- ✅ Auto Travel to correct island
-- ✅ Auto Quest acceptance
-- ✅ Mob detection from current quest
-- ✅ Auto Farm above mobs
-- ✅ Attack Range up to 150m
-- ============================================

-- Kill old menus
for _, v in ipairs(game.CoreGui:GetChildren()) do
    if v.Name:find("Nexus") then v:Destroy() end
end
task.wait(0.5)

-- ============================================
-- LAUNCH SCREEN
-- ============================================
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
launchFrame.BackgroundColor3 = Color3.new(0, 0, 0)
launchFrame.BackgroundTransparency = 0
launchFrame.BorderSizePixel = 0

local launchText = Instance.new("TextLabel")
launchText.Parent = launchFrame
launchText.Size = UDim2.new(1, 0, 1, 0)
launchText.Text = "HAVE FUN USING NEXUS"
launchText.TextColor3 = Color3.new(1, 0.5, 0)
launchText.TextScaled = true
launchText.BackgroundTransparency = 1
launchText.Font = Enum.Font.GothamBold
launchText.TextStrokeTransparency = 0.5
launchText.TextStrokeColor3 = Color3.new(1, 1, 1)

-- Fade in
for i = 0, 1, 0.05 do
    launchText.TextTransparency = 1 - i
    launchText.TextStrokeTransparency = 1 - i
    task.wait(0.03)
end
task.wait(2)

-- Fade out
for i = 0, 1, 0.05 do
    launchText.TextTransparency = i
    launchText.TextStrokeTransparency = i
    task.wait(0.03)
end

launchGui:Destroy()
task.wait(0.5)

-- ============================================
-- SERVICES
-- ============================================
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local VirtualUser = game:GetService("VirtualUser")
local CoreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")
local Stats = game:GetService("Stats")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local camera = Workspace.CurrentCamera

-- Wait for character
repeat task.wait() until LocalPlayer.Character

-- ============================================
-- WATERMARK
-- ============================================
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
watermarkHolder.Size = UDim2.new(0, 500, 0, 35)
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
watermarkText.Text = "NEXUS | LOADING..."
watermarkText.Font = Enum.Font.GothamBold
watermarkText.TextSize = 16
watermarkText.TextXAlignment = Enum.TextXAlignment.Center

-- ============================================
-- SETTINGS TABLE
-- ============================================
local settings = {
    -- FARM TAB (ALL FARMING FEATURES HERE)
    autoFarmEnabled = false,           -- Master toggle
    autoTravelEnabled = false,         -- Travel to correct island
    autoQuestEnabled = false,           -- Auto accept quests
    
    -- Farm Settings
    farmHeight = 15,
    attackRange = 50,                   -- Up to 150m
    attackSpeed = 0.05,
    
    -- Attack Methods
    fastAttack = false,
    longReach = false,
    mobAura = false,
    bringMobs = false,
    
    -- Auto Hitter
    autoHitter = false,
    hitterRange = 25,
    hitterCPS = 20,
    
    -- Other Tabs
    flyEnabled = false,
    flySpeed = 50,
    
    fruitSniper = false,
    autoStore = false,
    snipeDelay = 2,
    
    fruitRarity = {
        Mythic = { action = "Warn", autoStore = false },
        Legendary = { action = "Store", autoStore = true },
        Epic = { action = "Store", autoStore = true },
        Rare = { action = "Store", autoStore = true },
        Common = { action = "Ignore", autoStore = false },
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
    autoHaki = false,
    
    autoTravel = false,
    travelSpeed = 250,
}

-- ============================================
-- UTILITY FUNCTIONS
-- ============================================
local function getHRP(char)
    if not char then return nil end
    return char:FindFirstChild("HumanoidRootPart") or 
           char:FindFirstChild("Torso") or 
           char:FindFirstChild("UpperTorso")
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

local function notify(msg)
    StarterGui:SetCore("SendNotification", {
        Title = "NEXUS",
        Text = msg,
        Duration = 2
    })
end

-- ============================================
-- COMPLETE QUEST DATABASE
-- ============================================
local questDatabase = {
    -- FIRST SEA
    {name = "Trainee", questName = "MarineQuest", index = 1, level = 0, sea = "First", mobs = {"Trainee"}},
    {name = "Bandit", questName = "BanditQuest1", index = 1, level = 0, sea = "First", mobs = {"Bandit"}},
    {name = "Monkey", questName = "JungleQuest", index = 1, level = 10, sea = "First", mobs = {"Monkey"}},
    {name = "Gorilla", questName = "JungleQuest", index = 2, level = 15, sea = "First", mobs = {"Gorilla"}},
    {name = "Gorilla King", questName = "JungleQuest", index = 3, level = 20, sea = "First", mobs = {"Gorilla King"}},
    {name = "Pirate", questName = "PirateQuest", index = 1, level = 30, sea = "First", mobs = {"Pirate"}},
    {name = "Brute", questName = "PirateQuest", index = 2, level = 40, sea = "First", mobs = {"Brute"}},
    {name = "Bobby", questName = "PirateQuest", index = 3, level = 55, sea = "First", mobs = {"Bobby"}},
    {name = "Desert Bandit", questName = "DesertQuest", index = 1, level = 60, sea = "First", mobs = {"Desert Bandit"}},
    {name = "Desert Officer", questName = "DesertQuest", index = 2, level = 75, sea = "First", mobs = {"Desert Officer"}},
    {name = "Snow Bandit", questName = "SnowQuest", index = 1, level = 90, sea = "First", mobs = {"Snow Bandit"}},
    {name = "Snowman", questName = "SnowQuest", index = 2, level = 100, sea = "First", mobs = {"Snowman"}},
    {name = "Yeti", questName = "SnowQuest", index = 3, level = 105, sea = "First", mobs = {"Yeti"}},
    {name = "Chief Petty Officer", questName = "MarineQuest2", index = 1, level = 120, sea = "First", mobs = {"Chief Petty Officer"}},
    {name = "Vice Admiral", questName = "MarineQuest2", index = 2, level = 130, sea = "First", mobs = {"Vice Admiral"}},
    {name = "Sky Bandit", questName = "SkyQuest", index = 1, level = 150, sea = "First", mobs = {"Sky Bandit"}},
    {name = "Dark Master", questName = "SkyQuest", index = 2, level = 175, sea = "First", mobs = {"Dark Master"}},
    {name = "Prisoner", questName = "PrisonerQuest", index = 1, level = 190, sea = "First", mobs = {"Prisoner"}},
    {name = "Dangerous Prisoner", questName = "PrisonerQuest", index = 2, level = 210, sea = "First", mobs = {"Dangerous Prisoner"}},
    {name = "Magma Admiral", questName = "ImpelQuest", index = 1, level = 240, sea = "First", mobs = {"Magma Admiral"}},
    {name = "Toga Warrior", questName = "ColosseumQuest", index = 1, level = 250, sea = "First", mobs = {"Toga Warrior"}},
    {name = "Gladiator", questName = "ColosseumQuest", index = 2, level = 275, sea = "First", mobs = {"Gladiator"}},
    {name = "Military Soldier", questName = "MagmaQuest", index = 1, level = 300, sea = "First", mobs = {"Military Soldier"}},
    {name = "Military Spy", questName = "MagmaQuest", index = 2, level = 325, sea = "First", mobs = {"Military Spy"}},
    {name = "Military Officer", questName = "MagmaQuest", index = 3, level = 350, sea = "First", mobs = {"Military Officer"}},
    {name = "Fishman Warrior", questName = "FishmanQuest", index = 1, level = 375, sea = "First", mobs = {"Fishman Warrior"}},
    {name = "Fishman Commando", questName = "FishmanQuest", index = 2, level = 400, sea = "First", mobs = {"Fishman Commando"}},
    {name = "Fishman Lord", questName = "FishmanQuest", index = 3, level = 425, sea = "First", mobs = {"Fishman Lord"}},
    {name = "God's Guard", questName = "SkyExp1Quest", index = 1, level = 450, sea = "First", mobs = {"God's Guard"}},
    {name = "Shanda", questName = "SkyExp1Quest", index = 2, level = 475, sea = "First", mobs = {"Shanda"}},
    {name = "Wysper", questName = "SkyExp1Quest", index = 3, level = 500, sea = "First", mobs = {"Wysper"}},
    {name = "Royal Squad", questName = "SkyExp2Quest", index = 1, level = 525, sea = "First", mobs = {"Royal Squad"}},
    {name = "Royal Soldier", questName = "SkyExp2Quest", index = 2, level = 550, sea = "First", mobs = {"Royal Soldier"}},
    {name = "Thunder God", questName = "SkyExp2Quest", index = 3, level = 575, sea = "First", mobs = {"Thunder God"}},
    {name = "Galley Pirate", questName = "FountainQuest", index = 1, level = 625, sea = "First", mobs = {"Galley Pirate"}},
    {name = "Galley Captain", questName = "FountainQuest", index = 2, level = 650, sea = "First", mobs = {"Galley Captain"}},
    {name = "Cyborg", questName = "FountainQuest", index = 3, level = 675, sea = "First", mobs = {"Cyborg"}},
    
    -- SECOND SEA
    {name = "Raiders", questName = "Area1Quest", index = 1, level = 700, sea = "Second", mobs = {"Raider"}},
    {name = "Mercenaries", questName = "Area1Quest", index = 2, level = 725, sea = "Second", mobs = {"Mercenary"}},
    {name = "Swan Pirates", questName = "Area1Quest", index = 3, level = 750, sea = "Second", mobs = {"Swan Pirate"}},
    {name = "Factory Staff", questName = "Area2Quest", index = 1, level = 775, sea = "Second", mobs = {"Factory Staff"}},
    {name = "Jeremy's Forces", questName = "Area2Quest", index = 2, level = 825, sea = "Second", mobs = {"Jeremy's Force"}},
    {name = "Jeremy", questName = "Area2Quest", index = 3, level = 850, sea = "Second", mobs = {"Jeremy"}},
    {name = "Marine Lieutenants", questName = "MarineQuest3", index = 1, level = 875, sea = "Second", mobs = {"Marine Lieutenant"}},
    {name = "Marine Captains", questName = "MarineQuest3", index = 2, level = 900, sea = "Second", mobs = {"Marine Captain"}},
    {name = "Fajita", questName = "MarineQuest3", index = 3, level = 925, sea = "Second", mobs = {"Fajita"}},
    {name = "Zombies", questName = "ZombieQuest", index = 1, level = 950, sea = "Second", mobs = {"Zombie"}},
    {name = "Vampires", questName = "ZombieQuest", index = 2, level = 975, sea = "Second", mobs = {"Vampire"}},
    {name = "Snow Troopers", questName = "SnowMountainQuest", index = 1, level = 1000, sea = "Second", mobs = {"Snow Trooper"}},
    {name = "Winter Warriors", questName = "SnowMountainQuest", index = 2, level = 1050, sea = "Second", mobs = {"Winter Warrior"}},
    {name = "Lab Subordinates", questName = "FireSideQuest", index = 1, level = 1100, sea = "Second", mobs = {"Lab Subordinate"}},
    {name = "Horned Warriors", questName = "FireSideQuest", index = 2, level = 1125, sea = "Second", mobs = {"Horned Warrior"}},
    {name = "Magma Ninja", questName = "FireSideQuest", index = 3, level = 1150, sea = "Second", mobs = {"Magma Ninja"}},
    {name = "Lava Pirates", questName = "IceSideQuest", index = 1, level = 1175, sea = "Second", mobs = {"Lava Pirate"}},
    {name = "Order", questName = "IceSideQuest", index = 2, level = 1200, sea = "Second", mobs = {"Order Member"}},
    {name = "Smoke Admiral", questName = "IceSideQuest", index = 3, level = 1225, sea = "Second", mobs = {"Smoke Admiral"}},
    {name = "Ship Deckhands", questName = "ShipQuest1", index = 1, level = 1250, sea = "Second", mobs = {"Ship Deckhand"}},
    {name = "Ship Engineers", questName = "ShipQuest1", index = 2, level = 1275, sea = "Second", mobs = {"Ship Engineer"}},
    {name = "Ship Stewards", questName = "ShipQuest2", index = 1, level = 1300, sea = "Second", mobs = {"Ship Steward"}},
    {name = "Ship Officers", questName = "ShipQuest2", index = 2, level = 1325, sea = "Second", mobs = {"Ship Officer"}},
    {name = "Cursed Captain", questName = "ShipQuest2", index = 3, level = 1350, sea = "Second", mobs = {"Cursed Captain"}},
    {name = "Arctic Warriors", questName = "FrostQuest", index = 1, level = 1350, sea = "Second", mobs = {"Arctic Warrior"}},
    {name = "Snow Lurkers", questName = "FrostQuest", index = 2, level = 1375, sea = "Second", mobs = {"Snow Lurker"}},
    {name = "Awakened Ice Admiral", questName = "FrostQuest", index = 3, level = 1400, sea = "Second", mobs = {"Awakened Ice Admiral"}},
    {name = "Sea Soldiers", questName = "ForgottenQuest", index = 1, level = 1425, sea = "Second", mobs = {"Sea Soldier"}},
    {name = "Water Fighters", questName = "ForgottenQuest", index = 2, level = 1450, sea = "Second", mobs = {"Water Fighter"}},
    {name = "Tide Keeper", questName = "ForgottenQuest", index = 3, level = 1475, sea = "Second", mobs = {"Tide Keeper"}},
}

-- ============================================
-- QUEST DETECTION
-- ============================================
local currentQuestData = nil
local questCompleteTime = 0

local function getCurrentQuest()
    local questFolder = LocalPlayer:FindFirstChild("PlayerGui") and 
                        LocalPlayer.PlayerGui:FindFirstChild("Main") and
                        LocalPlayer.PlayerGui.Main:FindFirstChild("Quests")
    
    if questFolder then
        for _, quest in ipairs(questFolder:GetChildren()) do
            if quest:IsA("Frame") then
                local questName = quest:FindFirstChild("QuestName")
                if questName then
                    local questText = questName.Text
                    for _, questData in ipairs(questDatabase) do
                        if questText:find(questData.name) then
                            return questData
                        end
                    end
                end
            end
        end
    end
    return currentQuestData
end

local function checkQuestComplete()
    if not currentQuestData then return false end
    
    local questFolder = LocalPlayer:FindFirstChild("PlayerGui") and 
                        LocalPlayer.PlayerGui:FindFirstChild("Main") and
                        LocalPlayer.PlayerGui.Main:FindFirstChild("Quests")
    
    if questFolder then
        for _, quest in ipairs(questFolder:GetChildren()) do
            if quest:IsA("Frame") then
                local questName = quest:FindFirstChild("QuestName")
                if questName and questName.Text:find(currentQuestData.name) then
                    return false
                end
            end
        end
    end
    return true
end

local function getBestQuestForLevel()
    local level = getPlayerLevel()
    local sea = getCurrentSea()
    local bestQuest = nil
    local highestLevel = -1
    
    for _, quest in ipairs(questDatabase) do
        if quest.sea == sea and level >= quest.level and quest.level > highestLevel then
            highestLevel = quest.level
            bestQuest = quest
        end
    end
    
    if not bestQuest then
        for _, quest in ipairs(questDatabase) do
            if level >= quest.level and quest.level > highestLevel then
                highestLevel = quest.level
                bestQuest = quest
            end
        end
    end
    return bestQuest
end

local function acceptQuest(quest)
    if not quest then return false end
    if currentQuestData and currentQuestData.name == quest.name then return true end
    
    local success = pcall(function()
        ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest", quest.questName, quest.index)
        currentQuestData = quest
        questCompleteTime = tick()
        print("✅ Quest Accepted:", quest.name)
    end)
    return success
end

-- ============================================
-- ISLAND DATABASE
-- ============================================
local islandDatabase = {
    -- FIRST SEA
    {name = "Marine Starter", level = 0, cframe = CFrame.new(-2710.6, 25.0, 2104.1), sea = "First"},
    {name = "Pirate Starter", level = 0, cframe = CFrame.new(1060.7, 16.9, 1550.2), sea = "First"},
    {name = "Jungle", level = 10, cframe = CFrame.new(-1599.7, 37.4, 153.4), sea = "First"},
    {name = "Pirate Village", level = 30, cframe = CFrame.new(-1138.8, 5.3, 3827.9), sea = "First"},
    {name = "Desert", level = 60, cframe = CFrame.new(894.4, 7.0, 4389.6), sea = "First"},
    {name = "Frozen Village", level = 90, cframe = CFrame.new(1385.0, 87.8, -1296.0), sea = "First"},
    {name = "Marine Ford", level = 120, cframe = CFrame.new(-5037.5, 29.2, 4323.7), sea = "First"},
    {name = "Lower Skylands", level = 150, cframe = CFrame.new(-4836.8, 718.2, -2619.1), sea = "First"},
    {name = "Prison 1", level = 190, cframe = CFrame.new(-1580.1, 7.9, -2984.0), sea = "First"},
    {name = "Prison 2", level = 210, cframe = CFrame.new(5189.4, 4.1, 687.0), sea = "First"},
    {name = "Colosseum", level = 250, cframe = CFrame.new(-1580.1, 7.9, -2984.0), sea = "First"},
    {name = "Magma Village", level = 300, cframe = CFrame.new(-5315.7, 12.8, 8515.8), sea = "First"},
    {name = "Underwater City", level = 375, cframe = CFrame.new(61122.3, 19.0, 1566.7), sea = "First"},
    {name = "Upper Skylands 1", level = 450, cframe = CFrame.new(-4722.6, 845.8, -1953.5), sea = "First"},
    {name = "Upper Skylands 2", level = 525, cframe = CFrame.new(-7859.4, 5546.0, -378.9), sea = "First"},
    {name = "Second Upper Skylands", level = 575, cframe = CFrame.new(-7906.3, 5636.5, -1412.0), sea = "First"},
    {name = "Fountain City", level = 625, cframe = CFrame.new(5257.5, 39.0, 4048.8), sea = "First"},
    
    -- SECOND SEA
    {name = "Kingdom of Rose", level = 700, cframe = CFrame.new(71.71, 27.95, 2769.51), sea = "Second"},
    {name = "Green Zone", level = 875, cframe = CFrame.new(-2458.5, 73.6, -3248.1), sea = "Second"},
    {name = "Graveyard", level = 950, cframe = CFrame.new(-5422.2, 49.0, -803.0), sea = "Second"},
    {name = "Snow Mountain", level = 1000, cframe = CFrame.new(530.2, 401.9, -5382.1), sea = "Second"},
    {name = "Darkbeard Island", level = 1000, cframe = CFrame.new(3779.7, 23.2, -3499.7), sea = "Second"},
    {name = "Hot and Cold Hot", level = 1100, cframe = CFrame.new(-5379.8, 29.7, -5330.8), sea = "Second"},
    {name = "Hot and Cold Ice", level = 1175, cframe = CFrame.new(-5972.6, 29.7, -5041.1), sea = "Second"},
    {name = "Cursed Ship", level = 1250, cframe = CFrame.new(-6503.2, 83.7, -123.1), sea = "Second"},
    {name = "Ice Castle", level = 1350, cframe = CFrame.new(5672.9, 28.9, -6393.4), sea = "Second"},
    {name = "Forgotten Island", level = 1425, cframe = CFrame.new(-3164.1, 299.2, -10562.2), sea = "Second"},
}

-- ============================================
-- AUTO TRAVEL (Integrated into Farm system)
-- ============================================
local currentTween = nil

local function getTargetIsland()
    local level = getPlayerLevel()
    local sea = getCurrentSea()
    local bestIsland = nil
    local highestLevel = -1
    
    for _, island in ipairs(islandDatabase) do
        if island.sea == sea and level >= island.level and island.level > highestLevel then
            highestLevel = island.level
            bestIsland = island
        end
    end
    
    if not bestIsland then
        for _, island in ipairs(islandDatabase) do
            if level >= island.level and island.level > highestLevel then
                highestLevel = island.level
                bestIsland = island
            end
        end
    end
    return bestIsland
end

local function travelToIsland(island)
    if not island or not LocalPlayer.Character then return end
    
    local hrp = getHRP(LocalPlayer.Character)
    if not hrp then return end
    
    if currentTween then currentTween:Cancel() end
    
    local distance = (island.cframe.Position - hrp.Position).Magnitude
    local travelTime = distance / settings.travelSpeed
    
    local tweenInfo = TweenInfo.new(travelTime, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
    local tween = TweenService:Create(hrp, tweenInfo, {CFrame = island.cframe})
    tween:Play()
    currentTween = tween
    
    tween.Completed:Connect(function() currentTween = nil end)
end

-- ============================================
-- FAST ATTACK CORE
-- ============================================
local hitRemote = ReplicatedStorage:FindFirstChild("Modules") and 
                  ReplicatedStorage.Modules:FindFirstChild("Net") and 
                  ReplicatedStorage.Modules.Net:FindFirstChild("RE/RegisterHit")

local attackRemote = ReplicatedStorage:FindFirstChild("Modules") and 
                     ReplicatedStorage.Modules:FindFirstChild("Net") and 
                     ReplicatedStorage.Modules.Net:FindFirstChild("RE/RegisterAttack")

local hitDamage = "45397155"

local ARMS = {
    "LeftArm", "RightArm", "LeftHand", "RightHand",
    "LeftUpperArm", "RightUpperArm", "LeftLowerArm", "RightLowerArm"
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
        if arm then
            lastUsedArm[name] = time
            return arm
        end
    end
    return char:FindFirstChild("HumanoidRootPart")
end

local function registerHit(target)
    if not target or not hitRemote then return false end
    local arm = getArm(target)
    if not arm then return false end
    
    return pcall(function()
        hitRemote:FireServer(arm, {{target, arm}}, hitDamage)
    end)
end

local function registerAttack()
    if not attackRemote then return false end
    return pcall(function() attackRemote:FireServer(0.4) end)
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
                if hitRemote then
                    hitRemote:FireServer(arm, {{target, arm}}, hitDamage)
                end
            end)
            task.wait(0.005)
        end
    end
end

local function dualSpam(target)
    if not target then return false end
    local success = false
    
    if attackRemote then
        pcall(function() attackRemote:FireServer(0.4); success = true end)
    end
    
    if target and hitRemote then
        local arm = getArm(target)
        if arm then
            pcall(function() hitRemote:FireServer(arm, {{target, arm}}, hitDamage); success = true end)
        end
    end
    return success
end

-- ============================================
-- TARGET DETECTION (Filters by quest mobs)
-- ============================================
local function getTargetsInRange(range)
    local targets = {}
    
    if not LocalPlayer.Character then return targets end
    
    local hrp = getHRP(LocalPlayer.Character)
    if not hrp then return targets end
    
    -- Get current quest mob names
    local validMobNames = {}
    if currentQuestData and currentQuestData.mobs then
        validMobNames = currentQuestData.mobs
    end
    
    local enemiesFolder = Workspace:FindFirstChild("Enemies")
    if enemiesFolder then
        for _, enemy in ipairs(enemiesFolder:GetChildren()) do
            local humanoid = enemy:FindFirstChild("Humanoid")
            if humanoid and humanoid.Health > 0 then
                -- If we have quest mobs, only target those
                if #validMobNames == 0 or table.find(validMobNames, enemy.Name) then
                    local enemyHrp = getHRP(enemy)
                    if enemyHrp then
                        local dist = (enemyHrp.Position - hrp.Position).Magnitude
                        if dist <= range then
                            table.insert(targets, enemy)
                        end
                    end
                end
            end
        end
    end
    
    return targets
end

local function getClosestTarget()
    local targets = getTargetsInRange(settings.attackRange)
    if #targets == 0 then return nil end
    
    local hrp = getHRP(LocalPlayer.Character)
    if not hrp then return nil end
    
    local closest, shortest = nil, math.huge
    
    for _, target in ipairs(targets) do
        local targetHrp = getHRP(target)
        if targetHrp then
            local dist = (targetHrp.Position - hrp.Position).Magnitude
            if dist < shortest then
                shortest = dist
                closest = target
            end
        end
    end
    return closest
end

-- Table.find helper
function table.find(t, value)
    for i, v in ipairs(t) do
        if v == value then return i end
    end
    return nil
end

-- ============================================
-- FARM SYSTEM - COMPLETE AUTOMATION
-- ============================================
local farmConnection = nil
local currentFarmTarget = nil

local function startFarming(target)
    if not target then return end
    
    if farmConnection then farmConnection:Disconnect() end
    
    currentFarmTarget = target
    
    farmConnection = RunService.Heartbeat:Connect(function()
        if not settings.autoFarmEnabled or not currentFarmTarget or not LocalPlayer.Character then
            return
        end
        
        local targetHrp = getHRP(currentFarmTarget)
        if not targetHrp or not currentFarmTarget:FindFirstChild("Humanoid") or currentFarmTarget.Humanoid.Health <= 0 then
            currentFarmTarget = getClosestTarget()
            return
        end
        
        local hrp = getHRP(LocalPlayer.Character)
        if not hrp then return end
        
        local targetPos = targetHrp.Position + Vector3.new(0, settings.farmHeight, 0)
        
        if (hrp.Position - targetPos).Magnitude > 1 then
            hrp.CFrame = CFrame.lookAt(targetPos, targetHrp.Position)
        end
    end)
end

-- MAIN FARM LOOP (Handles everything)
task.spawn(function()
    while true do
        if settings.autoFarmEnabled then
            -- 1. Travel to correct island if needed
            if settings.autoTravelEnabled then
                local targetIsland = getTargetIsland()
                if targetIsland and LocalPlayer.Character then
                    local hrp = getHRP(LocalPlayer.Character)
                    if hrp and (hrp.Position - targetIsland.cframe.Position).Magnitude > 100 then
                        travelToIsland(targetIsland)
                        task.wait(5)
                    end
                end
            end
            
            -- 2. Accept quest if needed
            if settings.autoQuestEnabled then
                if not currentQuestData or checkQuestComplete() then
                    if tick() - questCompleteTime > 2 then
                        local quest = getBestQuestForLevel()
                        if quest then
                            acceptQuest(quest)
                            task.wait(2)
                        end
                    end
                end
            end
            
            -- 3. Farm current target
            if not currentFarmTarget or not currentFarmTarget:FindFirstChild("Humanoid") or currentFarmTarget.Humanoid.Health <= 0 then
                currentFarmTarget = getClosestTarget()
                if currentFarmTarget then
                    startFarming(currentFarmTarget)
                end
            end
        else
            if farmConnection then
                farmConnection:Disconnect()
                farmConnection = nil
                currentFarmTarget = nil
            end
        end
        task.wait(0.5)
    end
end)

-- ============================================
-- ATTACK LOOPS (Use currentFarmTarget)
-- ============================================
task.spawn(function()
    while true do
        if settings.fastAttack and settings.autoFarmEnabled and currentFarmTarget then
            for i = 1, 3 do
                registerHit(currentFarmTarget)
                task.wait(settings.attackSpeed)
            end
        end
        task.wait(0.01)
    end
end)

task.spawn(function()
    while true do
        if settings.longReach and settings.autoFarmEnabled and currentFarmTarget then
            burstAttack(currentFarmTarget)
            task.wait(0.2)
        end
        task.wait(0.1)
    end
end)

task.spawn(function()
    while true do
        if settings.mobAura and settings.autoFarmEnabled then
            local targets = getTargetsInRange(20)
            for _, target in ipairs(targets) do
                registerHit(target)
            end
        end
        task.wait(settings.attackSpeed)
    end
end)

task.spawn(function()
    while true do
        if settings.bringMobs and settings.autoFarmEnabled then
            local targets = getTargetsInRange(40)
            if #targets > 0 and LocalPlayer.Character then
                local hrp = getHRP(LocalPlayer.Character)
                if hrp then
                    for _, target in ipairs(targets) do
                        local targetHrp = getHRP(target)
                        if targetHrp then
                            targetHrp.CFrame = CFrame.new(
                                hrp.Position.X,
                                targetHrp.Position.Y,
                                hrp.Position.Z
                            ) * CFrame.Angles(0, targetHrp.Orientation.Y, 0)
                        end
                    end
                end
            end
        end
        task.wait(0.3)
    end
end)

-- ============================================
-- AUTO HITTER (Menu-aware)
-- ============================================
local menuVisible = true

task.spawn(function()
    while true do
        if settings.autoHitter and not menuVisible then
            local target = getClosestTarget()
            if target then
                dualSpam(target)
            end
        end
        task.wait(1 / settings.hitterCPS)
    end
end)

-- ============================================
-- PLAYER SPEED SYSTEM
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
    
    if not originalSpeed[char] then
        originalSpeed[char] = humanoid.WalkSpeed
    end
    if jp and not originalJump[char] then
        originalJump[char] = humanoid.JumpPower
    end
    
    humanoid.WalkSpeed = ws
    if jp then humanoid.JumpPower = jp end
end

local function toggleSpeed(state)
    settings.speedEnabled = state
    speedEnabled = state
    
    if state then
        for _, conn in ipairs(speedConnections) do
            conn:Disconnect()
        end
        speedConnections = {}
        
        if LocalPlayer.Character then
            applySpeed(LocalPlayer.Character, settings.speedValue, settings.jumpEnabled and settings.jumpValue or nil)
        end
        
        if speedThread then
            speedThread = nil
        end
        
        speedThread = task.spawn(function()
            while settings.speedEnabled and LocalPlayer.Character do
                local humanoid = LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
                if humanoid and humanoid.WalkSpeed ~= settings.speedValue then
                    humanoid.WalkSpeed = settings.speedValue
                end
                if settings.jumpEnabled and humanoid and humanoid.JumpPower ~= settings.jumpValue then
                    humanoid.JumpPower = settings.jumpValue
                end
                task.wait(0.1)
            end
        end)
        
        local function watchCharacter(char)
            local humanoid = char:FindFirstChildWhichIsA("Humanoid")
            if humanoid then
                local wsConn = humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
                    if settings.speedEnabled and humanoid.WalkSpeed ~= settings.speedValue then
                        humanoid.WalkSpeed = settings.speedValue
                    end
                end)
                table.insert(speedConnections, wsConn)
                
                if settings.jumpEnabled then
                    local jpConn = humanoid:GetPropertyChangedSignal("JumpPower"):Connect(function()
                        if settings.speedEnabled and humanoid.JumpPower ~= settings.jumpValue then
                            humanoid.JumpPower = settings.jumpValue
                        end
                    end)
                    table.insert(speedConnections, jpConn)
                end
            end
        end
        
        if LocalPlayer.Character then
            watchCharacter(LocalPlayer.Character)
        end
        
        local charConn = LocalPlayer.CharacterAdded:Connect(function(char)
            task.wait(0.5)
            if settings.speedEnabled then
                applySpeed(char, settings.speedValue, settings.jumpEnabled and settings.jumpValue or nil)
                watchCharacter(char)
            end
        end)
        table.insert(speedConnections, charConn)
        
        notify("🚀 Speed ON: " .. settings.speedValue)
    else
        if speedThread then
            speedThread = nil
        end
        
        for _, conn in ipairs(speedConnections) do
            conn:Disconnect()
        end
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
        
        notify("⏹️ Speed OFF")
    end
end

local function updateSpeed(value)
    settings.speedValue = value
    if speedEnabled and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = value
        end
    end
end

local function toggleJump(state)
    settings.jumpEnabled = state
end

local function updateJump(value)
    settings.jumpValue = value
    if settings.jumpEnabled and speedEnabled and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
        if humanoid then
            humanoid.JumpPower = value
        end
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
        
        local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        
        local cameraCF = camera.CFrame
        local moveDirection = Vector3.new(0, 0, 0)
        
        if UIS:IsKeyDown(Enum.KeyCode.W) then
            moveDirection = moveDirection + (cameraCF.LookVector * Vector3.new(1, 0, 1))
        end
        if UIS:IsKeyDown(Enum.KeyCode.S) then
            moveDirection = moveDirection - (cameraCF.LookVector * Vector3.new(1, 0, 1))
        end
        if UIS:IsKeyDown(Enum.KeyCode.A) then
            moveDirection = moveDirection - (cameraCF.RightVector * Vector3.new(1, 0, 1))
        end
        if UIS:IsKeyDown(Enum.KeyCode.D) then
            moveDirection = moveDirection + (cameraCF.RightVector * Vector3.new(1, 0, 1))
        end
        if UIS:IsKeyDown(Enum.KeyCode.Space) then
            moveDirection = moveDirection + Vector3.new(0, 1, 0)
        end
        if UIS:IsKeyDown(Enum.KeyCode.LeftControl) or UIS:IsKeyDown(Enum.KeyCode.RightControl) then
            moveDirection = moveDirection + Vector3.new(0, -1, 0)
        end
        
        if moveDirection.Magnitude > 0 then
            moveDirection = moveDirection.Unit * settings.flySpeed
            flyBodyVelocity.Velocity = moveDirection
            hrp.CFrame = CFrame.lookAt(hrp.Position, hrp.Position + cameraCF.LookVector * Vector3.new(1, 0, 1))
        else
            flyBodyVelocity.Velocity = Vector3.new(0, 0, 0)
        end
    end)
end

local function stopFlying()
    if LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.PlatformStand = false
            humanoid.AutoRotate = true
        end
    end
    
    if flyBodyVelocity then
        flyBodyVelocity:Destroy()
        flyBodyVelocity = nil
    end
    
    if flyConnection then
        flyConnection:Disconnect()
        flyConnection = nil
    end
end

local function toggleFly(state)
    settings.flyEnabled = state
    if state then
        startFlying()
        notify("✈️ Flight ON")
    else
        stopFlying()
        notify("✈️ Flight OFF")
    end
end

-- ============================================
-- WATER WALK
-- ============================================
local waterBlock = nil
local waterLevel = -4.8

local function toggleWaterWalk(state)
    settings.walkOnWater = state
    
    if state then
        if waterBlock then waterBlock:Destroy() end
        
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then 
            notify("Can't create water block - no character")
            return 
        end
        
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
                    local hrp = LocalPlayer.Character.HumanoidRootPart
                    waterBlock.Position = Vector3.new(hrp.Position.X, waterLevel, hrp.Position.Z)
                end
                task.wait(0.1)
            end
        end)
        
        notify("💧 Water walk ON")
    else
        if waterBlock then
            waterBlock:Destroy()
            waterBlock = nil
            notify("💧 Water walk OFF")
        end
    end
end

-- ============================================
-- AUTO STATS
-- ============================================
local function distributeStats()
    if not settings.autoStats then return end
    
    local data = LocalPlayer:FindFirstChild("Data")
    if not data then return end
    
    local points = data:FindFirstChild("StatPoints")
    if not points or points.Value <= 0 then return end
    
    local remote = ReplicatedStorage:FindFirstChild("Remotes") and 
                   ReplicatedStorage.Remotes:FindFirstChild("CommF_")
    
    if remote then
        for i = 1, points.Value do
            remote:InvokeServer("AddPoint", settings.statPriority)
            task.wait(0.1)
        end
    end
end

task.spawn(function()
    while true do
        if settings.autoStats then
            distributeStats()
        end
        task.wait(2)
    end
end)

-- ============================================
-- AUTO HAKI
-- ============================================
task.spawn(function()
    while true do
        if settings.autoHaki then
            pcall(function()
                ReplicatedStorage.Remotes.CommF_:InvokeServer("Buso")
            end)
        end
        task.wait(10)
    end
end)

-- ============================================
-- ANTI AFK
-- ============================================
task.spawn(function()
    while true do
        if settings.antiAfk then
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end
        task.wait(60)
    end
end)

-- ============================================
-- NO CLIP
-- ============================================
task.spawn(function()
    while true do
        if settings.noClip and LocalPlayer.Character then
            for _, part in ipairs(LocalPlayer.Character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
        task.wait(0.5)
    end
end)

-- ============================================
-- SEA HOP
-- ============================================
local seaIds = {
    ["First"] = 2753915549,
    ["Second"] = 4442272183,
    ["Third"] = 7449423635
}

local function hopToSea(seaName)
    local targetId = seaIds[seaName]
    if not targetId or game.PlaceId == targetId then return end
    TeleportService:Teleport(targetId, LocalPlayer)
end

-- ============================================
-- FRUIT RARITY SYSTEM
-- ============================================
local FRUIT_RARITY = {
    Mythic = {"Kitsune", "Dragon", "Dough", "Tiger", "Yeti", "Gas", "T-Rex", "Mammoth", "Spirit", "Venom", "Control", "Shadow", "Gravity"},
    Legendary = {"Buddha", "Sound", "Pain", "Blizzard", "Lightning", "Portal", "Phoenix", "Quake", "Love", "Spider", "Creation"},
    Epic = {"Magma", "Light", "Ghost", "Rubber"},
    Rare = {"Diamond", "Flame", "Eagle", "Ice", "Sand", "Dark"},
    Common = {"Rocket", "Spin", "Blade", "Spring", "Bomb", "Smoke", "Spike"}
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
    
    local remotes = {
        fruit:FindFirstChild("StoreRemote"),
        fruit:FindFirstChild("EatRemote"),
        fruit:FindFirstChild("RemoteFunction"),
        fruit:FindFirstChild("RemoteEvent")
    }
    
    for _, remote in ipairs(remotes) do
        if remote then
            local success = pcall(function()
                if remote:IsA("RemoteFunction") then
                    remote:InvokeServer("Store")
                elseif remote:IsA("RemoteEvent") then
                    remote:FireServer("Store")
                end
            end)
            if success then
                return true
            end
        end
    end
    return false
end

task.spawn(function()
    while true do
        if settings.fruitSniper then
            local fruits = {}
            for _, obj in ipairs(Workspace:GetDescendants()) do
                if isFruit(obj) and obj:FindFirstChild("Handle") then
                    table.insert(fruits, obj)
                end
            end
            
            if #fruits > 0 and LocalPlayer.Character then
                local hrp = getHRP(LocalPlayer.Character)
                if hrp then
                    table.sort(fruits, function(a, b)
                        local da = (a.Handle.Position - hrp.Position).Magnitude
                        local db = (b.Handle.Position - hrp.Position).Magnitude
                        return da < db
                    end)
                    
                    local fruit = fruits[1]
                    local rarity = getFruitRarity(fruit.Name)
                    local raritySettings = settings.fruitRarity[rarity]
                    
                    if raritySettings.action == "Warn" then
                        notify("⚠️ " .. rarity .. ": " .. fruit.Name)
                        hrp.CFrame = CFrame.new(fruit.Handle.Position + Vector3.new(0, 8, 0))
                        task.wait(3)
                    elseif raritySettings.action == "Store" then
                        hrp.CFrame = CFrame.new(fruit.Handle.Position + Vector3.new(0, 8, 0))
                        task.wait(1)
                        if raritySettings.autoStore then
                            storeFruit(fruit)
                        end
                        task.wait(settings.snipeDelay)
                    end
                end
            end
        end
        task.wait(1)
    end
end)

-- ============================================
-- WORLD VISUALS
-- ============================================
local function applyVisuals()
    if not settings.worldVisuals then return end
    
    if settings.brightMode then
        Lighting.Brightness = 2
        Lighting.ClockTime = 12
        Lighting.FogEnd = 100000
        Lighting.GlobalShadows = false
        Lighting.Ambient = Color3.new(1, 1, 1)
    elseif settings.darkMode then
        Lighting.Brightness = 0
        Lighting.ClockTime = 0
        Lighting.FogEnd = 50
        Lighting.GlobalShadows = true
        Lighting.Ambient = Color3.new(0, 0, 0)
    end
    
    if settings.removeFog then
        Lighting.FogEnd = 100000
    end
    
    if settings.xRay then
        for _, v in ipairs(Workspace:GetDescendants()) do
            if v:IsA("BasePart") and not v:IsA("Terrain") and v.Transparency < 0.5 then
                if not v:FindFirstChild("OriginalTransparency") then
                    local tag = Instance.new("NumberValue")
                    tag.Name = "OriginalTransparency"
                    tag.Value = v.Transparency
                    tag.Parent = v
                end
                v.Transparency = 0.7
                v.Material = Enum.Material.Glass
            end
        end
    end
    
    if settings.removeWater then
        for _, v in ipairs(Workspace:GetDescendants()) do
            if v:IsA("Part") and v.Name:lower():find("water") then
                v.Transparency = 1
                v.CanCollide = false
            end
        end
    end
    
    if settings.removeLava then
        for _, v in ipairs(Workspace:GetDescendants()) do
            if v:IsA("Part") and v.Name:lower():find("lava") then
                v.Transparency = 1
                v.CanCollide = false
            end
        end
    end
    
    if settings.removeTrees then
        for _, v in ipairs(Workspace:GetDescendants()) do
            if v:IsA("Model") and (v.Name:lower():find("tree") or v.Name:lower():find("palm")) then
                v:Destroy()
            end
        end
    end
    
    if settings.removeRocks then
        for _, v in ipairs(Workspace:GetDescendants()) do
            if v:IsA("Model") and v.Name:lower():find("rock") then
                v:Destroy()
            end
        end
    end
    
    if settings.removeGrass then
        for _, v in ipairs(Workspace:GetDescendants()) do
            if v:IsA("Part") and v.Name:lower():find("grass") then
                v.Transparency = 1
            end
        end
    end
    
    if settings.removeClouds then
        for _, v in ipairs(Workspace:GetDescendants()) do
            if v:IsA("Part") and v.Name:lower():find("cloud") then
                v.Transparency = 1
            end
        end
    end
end

local function revertVisuals()
    Lighting.Brightness = 1
    Lighting.ClockTime = 14
    Lighting.FogEnd = 100000
    Lighting.GlobalShadows = true
    Lighting.Ambient = Color3.new(0, 0, 0)
    
    for _, v in ipairs(Workspace:GetDescendants()) do
        if v:IsA("BasePart") and v:FindFirstChild("OriginalTransparency") then
            v.Transparency = v.OriginalTransparency.Value
            v.Material = Enum.Material.Plastic
            v.OriginalTransparency:Destroy()
        end
    end
end

local function toggleVisuals(state)
    settings.worldVisuals = state
    if state then
        applyVisuals()
    else
        revertVisuals()
    end
end

-- ============================================
-- ESP SYSTEM
-- ============================================
local espObjects = {}

local function createESP(obj)
    if not obj then return end
    
    if espObjects[obj] then
        for _, espObj in ipairs(espObjects[obj]) do
            pcall(function() espObj:Destroy() end)
        end
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
            healthLabel.Text = "❤️ " .. math.floor(obj.Humanoid.Health)
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
            distLabel.Text = "📏 ?"
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
        for _, espObj in ipairs(objs) do
            pcall(function() espObj:Destroy() end)
        end
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
            if isFruit(obj) then
                createESP(obj)
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
        if settings.playerESP or settings.fruitESP or settings.chestESP then
            refreshESP()
        end
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
                                    if objHrp then
                                        local dist = (objHrp.Position - hrp.Position).Magnitude
                                        distLabel.Text = "📏 " .. math.floor(dist) .. "m"
                                    end
                                end
                                
                                local healthLabel = espObj:FindFirstChild("Health")
                                if healthLabel and obj.Humanoid then
                                    healthLabel.Text = "❤️ " .. math.floor(obj.Humanoid.Health)
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
-- ISLAND PICKER
-- ============================================
local function createIslandPicker(y)
    local bg = Instance.new("Frame")
    bg.Parent = contentFrame
    bg.Size = UDim2.new(1, -20, 0, 45)
    bg.Position = UDim2.new(0, 10, 0, y)
    bg.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    bg.BorderSizePixel = 0
    
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
    dropdown.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    dropdown.Text = "Select Island"
    dropdown.TextColor3 = Color3.new(1, 1, 1)
    dropdown.Font = Enum.Font.Gotham
    dropdown.TextSize = 12
    
    local dropdownCorner = Instance.new("UICorner")
    dropdownCorner.CornerRadius = UDim.new(0, 6)
    dropdownCorner.Parent = dropdown
    
    local goBtn = Instance.new("TextButton")
    goBtn.Parent = bg
    goBtn.Size = UDim2.new(0, 50, 0, 30)
    goBtn.Position = UDim2.new(1, -60, 0.5, -15)
    goBtn.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
    goBtn.Text = "GO"
    goBtn.TextColor3 = Color3.new(0, 0, 0)
    goBtn.Font = Enum.Font.GothamBold
    goBtn.TextSize = 12
    
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
            
            local currentSea = getCurrentSea()
            local filteredIslands = {}
            for _, island in ipairs(islandDatabase) do
                if island.sea == currentSea then
                    table.insert(filteredIslands, island)
                end
            end
            
            dropdownList = Instance.new("Frame")
            dropdownList.Parent = gui
            dropdownList.Size = UDim2.new(0, 180, 0, #filteredIslands * 25)
            dropdownList.Position = UDim2.new(0, bg.AbsolutePosition.X + bg.AbsoluteSize.X - 190, 0, bg.AbsolutePosition.Y + 45)
            dropdownList.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
            dropdownList.BorderSizePixel = 0
            dropdownList.ZIndex = 10
            
            local listCorner = Instance.new("UICorner")
            listCorner.CornerRadius = UDim.new(0, 6)
            listCorner.Parent = dropdownList
            
            for i, island in ipairs(filteredIslands) do
                local optionBtn = Instance.new("TextButton")
                optionBtn.Parent = dropdownList
                optionBtn.Size = UDim2.new(1, 0, 0, 25)
                optionBtn.Position = UDim2.new(0, 0, 0, (i-1) * 25)
                optionBtn.BackgroundColor3 = i % 2 == 0 and Color3.fromRGB(70, 70, 80) or Color3.fromRGB(60, 60, 70)
                optionBtn.Text = island.name
                optionBtn.TextColor3 = Color3.new(1, 1, 1)
                optionBtn.Font = Enum.Font.Gotham
                optionBtn.TextSize = 11
                optionBtn.ZIndex = 11
                
                optionBtn.MouseButton1Click:Connect(function()
                    dropdown.Text = island.name
                    selectedIsland = island
                    expanded = false
                    dropdownList:Destroy()
                end)
            end
        else
            if dropdownList then
                dropdownList:Destroy()
            end
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
end

-- ============================================
-- MAIN MENU
-- ============================================
local gui = Instance.new("ScreenGui")
gui.Name = "NexusMenu"
gui.Parent = CoreGui
gui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame")
mainFrame.Parent = gui
mainFrame.Size = UDim2.new(0, 800, 0, 850)
mainFrame.Position = UDim2.new(0.5, -400, 0.5, -425)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Active = false

menuVisible = true
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
titleText.Text = "🔥 NEXUS ULTIMATE"
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

-- Dragging
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
local tabs = {"FARM", "PLAYER", "FLIGHT", "FRUIT", "ESP", "VISUALS", "TRAVEL"}
local tabButtons = {}
local currentTab = "FARM"

for i, name in ipairs(tabs) do
    local btn = Instance.new("TextButton")
    btn.Parent = mainFrame
    btn.Size = UDim2.new(0, 105, 0, 35)
    btn.Position = UDim2.new(0, 15 + (i-1) * 110, 0, 50)
    btn.BackgroundColor3 = name == currentTab and Color3.fromRGB(255, 200, 0) or Color3.fromRGB(40, 40, 50)
    btn.Text = name
    btn.TextColor3 = name == currentTab and Color3.new(0,0,0) or Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = btn
    
    btn.MouseButton1Click:Connect(function()
        currentTab = name
        for _, b in ipairs(tabButtons) do
            b.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
            b.TextColor3 = Color3.new(1,1,1)
        end
        btn.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
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

-- UI Helper Functions
local function createSection(title, y)
    local section = Instance.new("TextLabel")
    section.Parent = contentFrame
    section.Size = UDim2.new(1, -20, 0, 25)
    section.Position = UDim2.new(0, 10, 0, y)
    section.BackgroundTransparency = 1
    section.Text = "▶ " .. title
    section.TextColor3 = Color3.fromRGB(255, 200, 0)
    section.Font = Enum.Font.GothamBold
    section.TextSize = 16
    section.TextXAlignment = Enum.TextXAlignment.Left
    return y + 30
end

local function createToggle(name, y, default, callback, desc)
    local bg = Instance.new("Frame")
    bg.Parent = contentFrame
    bg.Size = UDim2.new(1, -20, 0, 45)
    bg.Position = UDim2.new(0, 10, 0, y)
    bg.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    bg.BorderSizePixel = 0
    
    local bgCorner = Instance.new("UICorner")
    bgCorner.CornerRadius = UDim.new(0, 6)
    bgCorner.Parent = bg
    
    local label = Instance.new("TextLabel")
    label.Parent = bg
    label.Size = UDim2.new(0.7, -15, 0.6, 0)
    label.Position = UDim2.new(0, 15, 0, 5)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.new(1, 1, 1)
    label.Font = Enum.Font.Gotham
    label.TextSize = 15
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    if desc then
        local descLabel = Instance.new("TextLabel")
        descLabel.Parent = bg
        descLabel.Size = UDim2.new(0.7, -15, 0.4, 0)
        descLabel.Position = UDim2.new(0, 15, 0, 22)
        descLabel.BackgroundTransparency = 1
        descLabel.Text = desc
        descLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
        descLabel.Font = Enum.Font.Gotham
        descLabel.TextSize = 11
        descLabel.TextXAlignment = Enum.TextXAlignment.Left
    end
    
    local btn = Instance.new("TextButton")
    btn.Parent = bg
    btn.Size = UDim2.new(0, 60, 0, 30)
    btn.Position = UDim2.new(1, -75, 0.5, -15)
    btn.BackgroundColor3 = default and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(80, 80, 90)
    btn.Text = default and "ON" or "OFF"
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = btn
    
    local state = default
    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.BackgroundColor3 = state and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(80, 80, 90)
        btn.Text = state and "ON" or "OFF"
        callback(state)
    end)
    
    return y + 50
end

local function createSlider(name, y, min, max, default, callback, suffix)
    local bg = Instance.new("Frame")
    bg.Parent = contentFrame
    bg.Size = UDim2.new(1, -20, 0, 60)
    bg.Position = UDim2.new(0, 10, 0, y)
    bg.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    bg.BorderSizePixel = 0
    
    local bgCorner = Instance.new("UICorner")
    bgCorner.CornerRadius = UDim.new(0, 6)
    bgCorner.Parent = bg
    
    local label = Instance.new("TextLabel")
    label.Parent = bg
    label.Size = UDim2.new(1, -30, 0, 25)
    label.Position = UDim2.new(0, 15, 0, 5)
    label.BackgroundTransparency = 1
    label.Text = name .. ": " .. default .. (suffix or "")
    label.TextColor3 = Color3.new(1, 1, 1)
    label.Font = Enum.Font.Gotham
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local sliderBg = Instance.new("Frame")
    sliderBg.Parent = bg
    sliderBg.Size = UDim2.new(1, -30, 0, 10)
    sliderBg.Position = UDim2.new(0, 15, 0, 35)
    sliderBg.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    sliderBg.BorderSizePixel = 0
    
    local sliderBgCorner = Instance.new("UICorner")
    sliderBgCorner.CornerRadius = UDim.new(1, 0)
    sliderBgCorner.Parent = sliderBg
    
    local percent = (default - min) / (max - min)
    
    local sliderFill = Instance.new("Frame")
    sliderFill.Parent = sliderBg
    sliderFill.Size = UDim2.new(percent, 0, 1, 0)
    sliderFill.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
    sliderFill.BorderSizePixel = 0
    
    local sliderFillCorner = Instance.new("UICorner")
    sliderFillCorner.CornerRadius = UDim.new(1, 0)
    sliderFillCorner.Parent = sliderFill
    
    local dragCircle = Instance.new("Frame")
    dragCircle.Parent = sliderBg
    dragCircle.Size = UDim2.new(0, 16, 0, 16)
    dragCircle.Position = UDim2.new(percent, -8, 0.5, -8)
    dragCircle.BackgroundColor3 = Color3.new(1, 1, 1)
    dragCircle.BorderSizePixel = 0
    
    local dragCorner = Instance.new("UICorner")
    dragCorner.CornerRadius = UDim.new(1, 0)
    dragCorner.Parent = dragCircle
    
    local value = default
    
    local function updateSlider(x)
        local relX = math.clamp(x - sliderBg.AbsolutePosition.X, 0, sliderBg.AbsoluteSize.X)
        local percent = relX / sliderBg.AbsoluteSize.X
        value = min + (max - min) * percent
        sliderFill.Size = UDim2.new(percent, 0, 1, 0)
        dragCircle.Position = UDim2.new(percent, -8, 0.5, -8)
        label.Text = name .. ": " .. math.floor(value * 10) / 10 .. (suffix or "")
        callback(value)
    end
    
    dragCircle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            updateSlider(input.Position.X)
        end
    end)
    
    dragCircle.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement and UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
            updateSlider(input.Position.X)
        end
    end)
    
    sliderBg.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            updateSlider(input.Position.X)
        end
    end)
    
    return y + 70
end

local function createButton(name, y, callback)
    local btn = Instance.new("TextButton")
    btn.Parent = contentFrame
    btn.Size = UDim2.new(1, -20, 0, 40)
    btn.Position = UDim2.new(0, 10, 0, y)
    btn.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
    btn.Text = name
    btn.TextColor3 = Color3.new(0, 0, 0)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = btn
    
    btn.MouseButton1Click:Connect(callback)
    return y + 45
end

local function createLabel(text, y, color)
    local label = Instance.new("TextLabel")
    label.Parent = contentFrame
    label.Size = UDim2.new(1, -20, 0, 25)
    label.Position = UDim2.new(0, 10, 0, y)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = color or Color3.fromRGB(200, 200, 200)
    label.Font = Enum.Font.Gotham
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    return y + 30
end

local function createDropdown(name, y, options, default, callback)
    local bg = Instance.new("Frame")
    bg.Parent = contentFrame
    bg.Size = UDim2.new(1, -20, 0, 45)
    bg.Position = UDim2.new(0, 10, 0, y)
    bg.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    bg.BorderSizePixel = 0
    
    local bgCorner = Instance.new("UICorner")
    bgCorner.CornerRadius = UDim.new(0, 6)
    bgCorner.Parent = bg
    
    local label = Instance.new("TextLabel")
    label.Parent = bg
    label.Size = UDim2.new(0.5, -10, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.new(1, 1, 1)
    label.Font = Enum.Font.Gotham
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local dropdown = Instance.new("TextButton")
    dropdown.Parent = bg
    dropdown.Size = UDim2.new(0, 120, 0, 30)
    dropdown.Position = UDim2.new(1, -130, 0.5, -15)
    dropdown.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    dropdown.Text = default
    dropdown.TextColor3 = Color3.new(1, 1, 1)
    dropdown.Font = Enum.Font.Gotham
    dropdown.TextSize = 12
    
    local dropdownCorner = Instance.new("UICorner")
    dropdownCorner.CornerRadius = UDim.new(0, 6)
    dropdownCorner.Parent = dropdown
    
    local expanded = false
    local dropdownList = nil
    
    dropdown.MouseButton1Click:Connect(function()
        expanded = not expanded
        
        if expanded then
            if dropdownList then dropdownList:Destroy() end
            
            dropdownList = Instance.new("Frame")
            dropdownList.Parent = gui
            dropdownList.Size = UDim2.new(0, 120, 0, #options * 30)
            dropdownList.Position = UDim2.new(0, bg.AbsolutePosition.X + bg.AbsoluteSize.X - 130, 0, bg.AbsolutePosition.Y + 45)
            dropdownList.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
            dropdownList.BorderSizePixel = 0
            dropdownList.ZIndex = 10
            
            local listCorner = Instance.new("UICorner")
            listCorner.CornerRadius = UDim.new(0, 6)
            listCorner.Parent = dropdownList
            
            for i, option in ipairs(options) do
                local optionBtn = Instance.new("TextButton")
                optionBtn.Parent = dropdownList
                optionBtn.Size = UDim2.new(1, 0, 0, 30)
                optionBtn.Position = UDim2.new(0, 0, 0, (i-1) * 30)
                optionBtn.BackgroundColor3 = i % 2 == 0 and Color3.fromRGB(70, 70, 80) or Color3.fromRGB(60, 60, 70)
                optionBtn.Text = option
                optionBtn.TextColor3 = Color3.new(1, 1, 1)
                optionBtn.Font = Enum.Font.Gotham
                optionBtn.TextSize = 12
                optionBtn.ZIndex = 11
                
                optionBtn.MouseButton1Click:Connect(function()
                    dropdown.Text = option
                    callback(option)
                    expanded = false
                    dropdownList:Destroy()
                end)
            end
        else
            if dropdownList then
                dropdownList:Destroy()
            end
        end
    end)
    
    return y + 50
end

-- Menu update
function updateMenu()
    for _, child in ipairs(contentFrame:GetChildren()) do
        child:Destroy()
    end
    
    local y = 10
    local level = getPlayerLevel()
    local sea = getCurrentSea()
    
    if currentTab == "FARM" then
        y = createSection("AUTO FARM SYSTEM", y)
        y = createToggle("Auto Farm", y, settings.autoFarmEnabled, function(v) settings.autoFarmEnabled = v end, "Master toggle - handles everything")
        y = createToggle("Auto Travel", y, settings.autoTravelEnabled, function(v) settings.autoTravelEnabled = v end, "Travel to correct island")
        y = createToggle("Auto Quest", y, settings.autoQuestEnabled, function(v) settings.autoQuestEnabled = v end, "Auto accept quests")
        
        y = y + 10
        y = createSection("ATTACK METHODS", y)
        y = createToggle("Fast Attack", y, settings.fastAttack, function(v) settings.fastAttack = v end, "Arms rotation")
        y = createToggle("Long Reach", y, settings.longReach, function(v) settings.longReach = v end, "Burst method")
        y = createToggle("Mob Aura", y, settings.mobAura, function(v) settings.mobAura = v end, "Damage all nearby")
        y = createToggle("Bring Mobs", y, settings.bringMobs, function(v) settings.bringMobs = v end, "Pull enemies under you")
        
        y = y + 10
        y = createSection("FARM SETTINGS", y)
        y = createSlider("Farm Height", y, 5, 30, settings.farmHeight, function(v) settings.farmHeight = v end, "m")
        y = createSlider("Attack Range", y, 10, 150, settings.attackRange, function(v) settings.attackRange = v end, "m")
        y = createSlider("Attack Speed", y, 2, 20, settings.attackSpeed * 100, function(v) settings.attackSpeed = v / 100 end, "%")
        
        y = y + 10
        y = createSection("AUTO HITTER", y)
        y = createToggle("Auto Hitter", y, settings.autoHitter, function(v) settings.autoHitter = v end, "Dual remote spam")
        y = createSlider("Hitter CPS", y, 5, 60, settings.hitterCPS, function(v) settings.hitterCPS = v end)
        y = createSlider("Hitter Range", y, 10, 40, settings.hitterRange, function(v) settings.hitterRange = v end, "m")
        
        y = y + 10
        y = createSection("CURRENT STATUS", y)
        if currentQuestData then
            y = createLabel("Quest: " .. currentQuestData.name, y, Color3.fromRGB(255, 200, 0))
            y = createLabel("Mobs: " .. table.concat(currentQuestData.mobs, ", "), y)
        else
            y = createLabel("No active quest", y)
        end
        y = createLabel("Level: " .. level, y)
        y = createLabel("Sea: " .. sea, y)
        
    elseif currentTab == "PLAYER" then
        y = createSection("SPEED (Up to 1000)", y)
        y = createToggle("Speed Enabled", y, settings.speedEnabled, toggleSpeed)
        y = createSlider("Speed Value", y, 16, 1000, settings.speedValue, updateSpeed)
        y = createToggle("Jump Enabled", y, settings.jumpEnabled, toggleJump)
        y = createSlider("Jump Value", y, 50, 500, settings.jumpValue, updateJump)
        y = createToggle("Walk on Water", y, settings.walkOnWater, toggleWaterWalk)
        y = createToggle("No Clip", y, settings.noClip, function(v) settings.noClip = v end)
        y = createToggle("Anti AFK", y, settings.antiAfk, function(v) settings.antiAfk = v end)
        y = createToggle("Auto Haki", y, settings.autoHaki, function(v) settings.autoHaki = v end)
        y = createToggle("Auto Stats", y, settings.autoStats, function(v) settings.autoStats = v end)
        y = createDropdown("Stat Priority", y, {"Melee", "Defense", "Sword", "Gun", "Fruit"}, settings.statPriority, function(v)
            settings.statPriority = v
        end)
        
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
        
        y = createLabel("⚠️ MYTHIC", y, Color3.fromRGB(255, 0, 0))
        y = createDropdown("Mythic Action", y, {"Warn", "Store", "Ignore"}, settings.fruitRarity.Mythic.action, function(v)
            settings.fruitRarity.Mythic.action = v
        end)
        y = createToggle("Mythic AutoStore", y, settings.fruitRarity.Mythic.autoStore, function(v)
            settings.fruitRarity.Mythic.autoStore = v
        end)
        
        y = createLabel("✨ LEGENDARY", y, Color3.fromRGB(255, 165, 0))
        y = createDropdown("Legendary Action", y, {"Store", "Warn", "Ignore"}, settings.fruitRarity.Legendary.action, function(v)
            settings.fruitRarity.Legendary.action = v
        end)
        y = createToggle("Legendary AutoStore", y, settings.fruitRarity.Legendary.autoStore, function(v)
            settings.fruitRarity.Legendary.autoStore = v
        end)
        
        y = createLabel("💜 EPIC", y, Color3.fromRGB(128, 0, 128))
        y = createDropdown("Epic Action", y, {"Store", "Warn", "Ignore"}, settings.fruitRarity.Epic.action, function(v)
            settings.fruitRarity.Epic.action = v
        end)
        y = createToggle("Epic AutoStore", y, settings.fruitRarity.Epic.autoStore, function(v)
            settings.fruitRarity.Epic.autoStore = v
        end)
        
        y = createLabel("🔵 RARE", y, Color3.fromRGB(0, 0, 255))
        y = createDropdown("Rare Action", y, {"Store", "Warn", "Ignore"}, settings.fruitRarity.Rare.action, function(v)
            settings.fruitRarity.Rare.action = v
        end)
        y = createToggle("Rare AutoStore", y, settings.fruitRarity.Rare.autoStore, function(v)
            settings.fruitRarity.Rare.autoStore = v
        end)
        
        y = createLabel("⚪ COMMON", y, Color3.fromRGB(128, 128, 128))
        y = createDropdown("Common Action", y, {"Ignore", "Store", "Warn"}, settings.fruitRarity.Common.action, function(v)
            settings.fruitRarity.Common.action = v
        end)
        
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
        y = createSection("REMOVE OBJECTS", y)
        y = createToggle("Remove Water", y, settings.removeWater, function(v) settings.removeWater = v; applyVisuals() end)
        y = createToggle("Remove Lava", y, settings.removeLava, function(v) settings.removeLava = v; applyVisuals() end)
        y = createToggle("Remove Trees", y, settings.removeTrees, function(v) settings.removeTrees = v; applyVisuals() end)
        y = createToggle("Remove Rocks", y, settings.removeRocks, function(v) settings.removeRocks = v; applyVisuals() end)
        y = createToggle("Remove Grass", y, settings.removeGrass, function(v) settings.removeGrass = v; applyVisuals() end)
        y = createToggle("Remove Clouds", y, settings.removeClouds, function(v) settings.removeClouds = v; applyVisuals() end)
        
    elseif currentTab == "TRAVEL" then
        y = createSection("AUTO TRAVEL", y)
        y = createToggle("Auto Travel", y, settings.autoTravel, function(v) settings.autoTravel = v end)
        y = createSlider("Travel Speed", y, 50, 300, settings.travelSpeed, function(v) settings.travelSpeed = v end)
        
        y = y + 10
        y = createSection("ISLAND PICKER", y)
        y = createIslandPicker(y)
        
        y = y + 10
        y = createSection("SEA HOP", y)
        y = createButton("🌊 First Sea", y, function() hopToSea("First") end)
        y = createButton("🌊 Second Sea", y, function() hopToSea("Second") end)
        y = createButton("🌊 Third Sea", y, function() hopToSea("Third") end)
    end
    
    contentFrame.CanvasSize = UDim2.new(0, 0, 0, y + 10)
end

updateMenu()

-- Menu toggle
UIS.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.F1 then
        mainFrame.Visible = not mainFrame.Visible
        menuVisible = mainFrame.Visible
    end
end)

-- ============================================
-- MAIN LOOP
-- ============================================
RunService.Heartbeat:Connect(function()
    local ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue() or 0)
    local fps = math.floor(1 / RunService.Heartbeat:Wait())
    local level = getPlayerLevel()
    local sea = getCurrentSea()
    
    watermarkText.Text = string.format("🔥 NEXUS | Lvl %d | %d FPS | %dms | %s", level, fps, ping, sea)
    
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

-- ============================================
-- FINAL
-- ============================================
task.wait(1)
watermarkText.Text = "🔥 NEXUS | READY"
print("=" .. string.rep("=", 50) .. "=")
print("🔥 NEXUS ULTIMATE LOADED")
print("=" .. string.rep("=", 50) .. "=")
print("✅ FARM TAB: Auto Farm, Auto Travel, Auto Quest")
print("✅ Attack Range: Up to 150m")
print("✅ Quest Detection + Mob Filtering")
print("✅ All other features: Player, Flight, Fruit,")
print("✅ ESP, Visuals, Travel")
print("📊 Press F1 to toggle menu")
print("=" .. string.rep("=", 50) .. "=")

notify("🔥 NEXUS ULTIMATE READY")
