repeat
    task.wait()
until game:IsLoaded()

if game.Players.LocalPlayer.Name ~= "xoProdigy3" then
    setclipboard("https://discord.gg/c7H6H72h")
    game.Players.LocalPlayer:Kick("Script in maintenance, Discord server invite copied to clipboard for details")
else
    if not getgenv().StingrayLoaded then
        getgenv().StingrayLoaded = true
        -- Load Configs
        pcall(function()
            if getgenv().Webhook then
                writefile("JJI_Webhook.txt", getgenv().Webhook)
            end
            if readfile("JJI_Webhook.txt") then
                getgenv().Webhook = readfile("JJI_Webhook.txt")
            end
        end)

        -- Init
        local StartTime = tick()
        local LocalPlayer = game:GetService("Players").LocalPlayer
        local Boosts = {"Luck Vial", "Withered Beckoning Cat"}

        -- UI
        local UI = loadstring(game:HttpGet("http://www.stingray-digital.online/script/ui"))()
        local MainUI = UI.InitUI()
        local Toggle = "ON"
        pcall(function()
            if readfile("JJI_State.txt") then
                Toggle = readfile("JJI_State.txt")
            else
                writefile("JJI_State.txt", "ON")
            end
        end)
        print("QUEUE TOGGLE: "..Toggle)
        if Toggle == "ON" then
            UI.SetState(true)
        else
            UI.SetState(false)
        end
        UI.SetMain(function(State)
            if State == 1 then
                Toggle = "ON"
            else
                Toggle = "OFF"
            end
            writefile("JJI_State.txt", Toggle)
            print(readfile("JJI_State.txt"))
        end)

        -- Constants
        local Cats = {"Withered Beckoning Cat", "Wooden Beckoning Cat", "Polished Beckoning Cat"}
        local Highlight = {"Maximum Scroll", "Domain Shard", "Iridescent Lotus", "Polished Beckoning Cat", "Sapphire Lotus", "Fortune Gourd", "Demon Finger", "Energy Nature Scroll", "Purified Curse Hand", "Jade Lotus", "Cloak of Inferno", "Split Soul", "Soul Robe", "Playful Cloud", "Ocean Blue Sailor's Vest", "Deep Black Sailor's Vest", "Demonic Tobi", "Demonic Robe", "Rotten Chains"}
        
        if Toggle == "ON" then
            local s, e = pcall(function()
                queue_on_teleport('loadstring(game:HttpGet("http://www.stingray-digital.online/script/jji"))()')
            end)
        end

        -- Black screen check
        task.spawn(function()
            task.wait(120)
            -- if LocalPlayer.PlayerGui.Main.Frame.BottomLeft.Bars.Health.Amount.Text == "50" then
            -- game:GetService("TeleportService"):Teleport(10450270085)
            -- end
        end)

        if game.PlaceId == 10450270085 then
            game:GetService("TeleportService"):Teleport(119359147980471)
        elseif game.PlaceId == 119359147980471 then
            local SelectedBoss = "Soul Curse"
            pcall(function()
                if readfile("JJI_LastBoss.txt") then
                    SelectedBoss = readfile("JJI_LastBoss.txt")
                end
            end)
            task.wait(3)
            while task.wait(1) do
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Raids"):WaitForChild("QuickStart"):InvokeServer("Boss", SelectedBoss, "Nightmare")
            end
        end

        repeat
            task.wait()
        until LocalPlayer.Character
        local Root = LocalPlayer.Character:WaitForChild("HumanoidRootPart")

        if not s then
            print("Better put this in auto execute, your thing doesn't support queue on tp:", e)
        end

        local Objects = workspace:WaitForChild("Objects")
        local Mobs = Objects:WaitForChild("Mobs")
        local Spawns = Objects:WaitForChild("Spawns")
        local Drops = Objects:WaitForChild("Drops")
        local Effects = Objects:WaitForChild("Effects")
        local Destructibles = Objects:WaitForChild("Destructibles")
        local LootUI = LocalPlayer.PlayerGui:WaitForChild("Loot")
        local Flip = LootUI:WaitForChild("Frame"):WaitForChild("Flip")
        local Replay = LocalPlayer.PlayerGui:WaitForChild("ReadyScreen"):WaitForChild("Frame"):WaitForChild("Re
