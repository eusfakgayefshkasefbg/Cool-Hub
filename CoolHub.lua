if game.PlaceId == 8884433153 then -- Collect All Pets
    getgenv().autofuseall = false
    getgenv().PetOpen = false
    getgenv().autocollect = false
    getgenv().orbs = false
    getgenv().autoClaimEgg = false
    getgenv().autoSkipPetScreen = false
    getgenv().autoBuyDamage = false
    getgenv().autoBuyDropRate = false
    getgenv().autoBuyCollectionRange = false
    getgenv().autoEquipBestPet = false
    getgenv().autoquest = false
    getgenv().autocrystal = false
    local autopetunlock = "false"
    local waitforselectpet = 20
    local waitfortp = 1
    local selectedpet = "None"
    local fuse_equipped = false
    local player = game:GetService("Players").LocalPlayer
    codes = {"shipwrecked", "SpeedPlayzTree", "ImFlying", "FFR", "FinalForm", "Shinier", "Massproduction", "ProsperousGrounds", "MountIn", "OneOutOfEight", "MusketeersAndAmigos", "OneZero", "AndIThinkToMyself", "SeasonsAndAMovie", "LookOut", "InfiniteLoop", "BurgersandFries", "Metallic", "GenAutoCalc", "Plasmatic_Void", "eaglenight222", "CrazyDiamond", "Viper_Toffi", "Unihorns", "Meerkat", "ChocolateMilk", "CommonLoon", "Sub2PHMittens", "MrPocket", "FusionIndy", "Amebas", "ToPointOh", "Buttertom_1m", "FromTheMachine"}
 
 
    function ClaimCodes()
        for i, v in ipairs(codes) do
            wait()
            pprint("claimed code: "..v)
 
            local A_1 = v
            local Event = game:GetService("ReplicatedStorage").Remotes.RedeemCode
            Event:FireServer(A_1)
        end
    end
 
    function autoEquipBestPet()
        spawn(function()
            while getgenv().autoEquipBestPet == true do
                local Event = game:GetService("ReplicatedStorage").Remotes.EquipBest
                Event:FireServer()
                wait(waitforselectpet)
            end
        end)
    end
 
    function autoBuyCollectionRange()
        spawn(function()
            while getgenv().autoBuyCollectionRange == true do
                local Event = game:GetService("ReplicatedStorage").Remotes.BuyStatIncrease
                Event:FireServer("DropCollectionRange")
                wait(1)
            end
        end)
    end
 
    function autoBuyDropRate()
        spawn(function()
            while getgenv().autoBuyDropRate == true do
                local Event = game:GetService("ReplicatedStorage").Remotes.BuyStatIncrease
                Event:FireServer("DropRate")
                wait(1)
            end
        end)
    end
 
    function autoBuyDamage()
        spawn(function()
            while getgenv().autoBuyDamage == true do
                local Event = game:GetService("ReplicatedStorage").Remotes.BuyStatIncrease
                Event:FireServer("Damage")
                wait(1)
            end
        end)
    end
 
    function zona(zona)
        local Event = game:GetService("ReplicatedStorage").Remotes.SetLockedArea
        Event:FireServer(zona)
    end
 
    function autoSkipPetScreen()
        spawn(function()
            while getgenv().autoSkipPetScreen == true do
                wait()
                if game.Players.LocalPlayer.PlayerGui.ScreenGui.Hatcher.Visible == true then
 
                game:GetService("VirtualInputManager"):SendKeyEvent(true,Enum.KeyCode.E,false,game)
 
                end
            end
        end)
    end
 
    function autoClaimEgg()
        spawn(function()
            while getgenv().autoClaimEgg == true do
                local Event = game:GetService("ReplicatedStorage").Remotes.ClaimDailyEgg
                Event:FireServer()
                wait(10)
            end
        end)
    end
 
    function autoOrb()
        spawn(function()
            while getgenv().orbs == true do
                for _,v in pairs(game:GetService("Workspace"):GetDescendants()) do
                    if v:IsA"Model" and v.Parent.Name == "Drops" then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Base.CFrame
                    end
                end
                wait(waitfortp)
            end
        end)
    end
 
    function fuseall(equipped)
        spawn(function()
            local A_1 = 
            {
                [1] = true, 
                [2] = true, 
                [3] = true, 
                [4] = true, 
                [5] = true, 
                [6] = true, 
                [7] = true, 
                [8] = equipped
            }
            local Event = game:GetService("ReplicatedStorage").Remotes.AutoFuse
            Event:FireServer(A_1)
            wait(1)
 
        end)
    end
 
    function autofuseall()
        spawn(function()
            while getgenv().autofuseall == true do
                local A_1 = 
                {
                    [1] = true, 
                    [2] = true, 
                    [3] = true, 
                    [4] = true, 
                    [5] = true, 
                    [6] = true, 
                    [7] = true, 
                    [8] = fuse_equipped
                }
                local Event = game:GetService("ReplicatedStorage").Remotes.AutoFuse
                Event:FireServer(A_1)
                wait(1)
            end     
        end)
    end
 
    function PetOpen(PetOpenType)
        spawn(function()
            while getgenv().PetOpen == true do
                wait()
                local Event = game:GetService("ReplicatedStorage").Remotes.BuyEgg
                Event:FireServer(PetOpenType)
            end
        end)
    end
 
    function openOnePet(PetOpenType)
        local GenerationSpeedTier = player:WaitForChild("GenerationSpeedTier").Value
        if GenerationSpeedTier > 0 then
            game:GetService("ReplicatedStorage").Remotes.SetGeneratorEgg:FireServer(PetOpenType)
            game:GetService("ReplicatedStorage").Remotes.SetGeneratorOn:FireServer(true)
            wait(0.1)
            game:GetService("ReplicatedStorage").Remotes.SetGeneratorOn:FireServer(false)
        else
            game:GetService("ReplicatedStorage").Remotes.BuyEgg:FireServer(PetOpenType)
 
        end
    end
 
    function nokick()
        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title = "Cool Hub - Anti Afk", 
            Text = "Activated.", 
            Duration = 5;
        })
 
        local bb = game:service "VirtualUser"
        game:service "Players".LocalPlayer.Idled:connect(
        function()
        bb:CaptureController()
        bb:ClickButton2(Vector2.new())
        end)
    end
 
    function panicbutton()
        getgenv().autofuseall = false;
        getgenv().PetOpen = false;
        getgenv().autocollect = false;
        getgenv().orbs = false;
        getgenv().autoClaimEgg = false;
        getgenv().autoSkipPetScreen = false;
        getgenv().autoBuyDamage = false;
        getgenv().autoBuyDropRate = false;
        getgenv().autoBuyCollectionRange = false;
        getgenv().autoEquipBestPet = false;
        getgenv().autoquest = false;
 
        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title = "Cool Hub - Panic", 
            Text = "All hacks are now deactivated.", 
            Duration = 5;
        })
 
    end
 
    function autoquest()
        spawn(function()
            while getgenv().autoquest == true do
                wait()
                local zonadaselezionare = player:WaitForChild("QuestArea").Value
                local questtask = player:WaitForChild("QuestTask").Value
                local playerUnLockedArea = player:WaitForChild("UnlockedArea").Value
 
                local Event = game:GetService("ReplicatedStorage").Remotes.ClaimQuestReward -- claim quest
                Event:FireServer()
 
 
                if zonadaselezionare == 0 then
 
                    if questtask == 1 then -- get drops
 
                        zona(playerUnLockedArea)
 
                    elseif questtask == 2 then
 
                        zona(playerUnLockedArea)
 
                     elseif questtask == 3 then 
 
                        zona(1)
 
                    else
                        pprint("!! error on quest decoding !!")
                    end
                else
                    if questtask == 4 then
 
                        if zonadaselezionare == 4 then --leggendary from epics
 
                            local Event = game:GetService("ReplicatedStorage").Remotes.BuyEgg
                            Event:FireServer(4)
 
                        elseif zonadaselezionare == 5 then -- prodiguis from leggendary
 
                            local Event = game:GetService("ReplicatedStorage").Remotes.BuyEgg
                            Event:FireServer(5)
 
                        elseif zonadaselezionare == 6 then -- ashended from prodigius
 
                            local Event = game:GetService("ReplicatedStorage").Remotes.BuyEgg
                            Event:FireServer(6)
 
                        end
                        zona(playerUnLockedArea)
                    else
                        zona(zonadaselezionare)
                    end
                    wait(1)
                end
            end
        end)
    end
 
    function autopetunlockk()
        spawn(function()
            while autopetunlock == "true" do
                wait()
                --get unlocked
                local Message = game.Players.LocalPlayer.PlayerGui.ScreenGui.Main.Left.Checklist[1].DiscoveredLabel.Text local SplitMessage = string.split(Message, " / ") local common1, common2 = SplitMessage[1], SplitMessage[2] --get common
                local Message = game.Players.LocalPlayer.PlayerGui.ScreenGui.Main.Left.Checklist[2].DiscoveredLabel.Text local SplitMessage = string.split(Message, " / ") local uncommon1, uncommon2 = SplitMessage[1], SplitMessage[2] --get uncommon
                local Message = game.Players.LocalPlayer.PlayerGui.ScreenGui.Main.Left.Checklist[3].DiscoveredLabel.Text local SplitMessage = string.split(Message, " / ") local rare1, rare2 = SplitMessage[1], SplitMessage[2] --get rare
                local Message = game.Players.LocalPlayer.PlayerGui.ScreenGui.Main.Left.Checklist[4].DiscoveredLabel.Text local SplitMessage = string.split(Message, " / ") local epic1, epic2 = SplitMessage[1], SplitMessage[2] --get epic
                local Message = game.Players.LocalPlayer.PlayerGui.ScreenGui.Main.Left.Checklist[5].DiscoveredLabel.Text local SplitMessage = string.split(Message, " / ") local leggendary1, leggendary2 = SplitMessage[1], SplitMessage[2] --get leggendary
                local Message = game.Players.LocalPlayer.PlayerGui.ScreenGui.Main.Left.Checklist[6].DiscoveredLabel.Text local SplitMessage = string.split(Message, " / ") local prodigius1, prodigius2 = SplitMessage[1], SplitMessage[2] --get prodigius
                local Message = game.Players.LocalPlayer.PlayerGui.ScreenGui.Main.Left.Checklist[7].DiscoveredLabel.Text local SplitMessage = string.split(Message, " / ") local ashended1, ashended2 = SplitMessage[1], SplitMessage[2] --get ashended
                local Message = game.Players.LocalPlayer.PlayerGui.ScreenGui.Main.Left.Checklist[8].DiscoveredLabel.Text local SplitMessage = string.split(Message, " / ") local mityc1, mityc2 = SplitMessage[1], SplitMessage[2] --get mityc
 
                local has_auto_fuse_all = game:GetService("Workspace").UpgradeTree.OneTimers.Automation_Station.Wires:WaitForChild("Wire").Color
                if common1 ~= common2 then
                    openOnePet(1)
                elseif uncommon1 ~= uncommon2 then
                    openOnePet(2)
                elseif rare1 ~= rare2 then
                    openOnePet(3)
                elseif epic1 ~= epic2 then
                    openOnePet(4)
                elseif leggendary1 ~= leggendary2 then
                    openOnePet(5)
                elseif prodigius1 ~= prodigius2 then
                    openOnePet(6)
                elseif ashended1 ~= ashended2 or mityc1 ~= mityc2 then
                    openOnePet(6)
                    if has_auto_fuse_all == "Bright green" then
                        game:GetService("ReplicatedStorage").Remotes.SetAutoFuse:FireServer(true)
                    else
                        fuseall(false)
                    end
                end
            end
        end)
    end
 
    function autocrystal()
        spawn(function()
            while getgenv().autocrystal == true do
                wait(2)
                local playerUnLockedArea = player:WaitForChild("UnlockedArea").Value
                local folder = game.Workspace.Crystals.Super:GetChildren()
                for i, v in pairs(folder) do
                    local zonacrystal = v:FindFirstChild("Area").Value
                    if zonacrystal <= playerUnLockedArea then
                        zona(zonacrystal)
                    end
                end
                pprint(playerUnLockedArea)
                pprint(zonacrystal)
            end
        end)
    end
 
    function pprint(txt)
        print("[Cool Hub]: "..txt)
    end
 
    function comma_value(amount)
        local formatted = amount
        while true do  
            formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
                if (k==0) then
                    break
                end
            end
        return formatted
    end
 
    -- Gui
 
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("Collect all pets - Cool Hub", "GrapeTheme")
 
 
    local Tab = Window:NewTab("--> Info")
        local Section = Tab:NewSection("--> Tab")
 
        Section:NewButton("Anti Afk", "Enables the anti afk script (Remade by me)", function()
            nokick()
        end)  
 
        Section:NewButton("Claim Codes", "Claims the game codes", function()
            ClaimCodes()
        end)
 
        Section:NewLabel("Auto fuse works only if you have the gamepass")
 
        Section:NewKeybind("Hidegui key", "This is for hide the gui", Enum.KeyCode.V, function()
            Library:ToggleUI()
        end)
 
        Section:NewKeybind("Panic Button", "Use this to disable the hacks in one key  (anti afk not included)", Enum.KeyCode.P, function()
            panicbutton()
        end)  
 
        Section:NewLabel("Have fun :D, or i will find you.")
 
 
    local Tab = Window:NewTab("--> Auto Farming")
 
        local Section = Tab:NewSection("--> Auto Farming")
 
            Section:NewToggle("Auto Quest", "Does zone quests automaticly", function(state)
                getgenv().autoquest = state
                autoquest();
            end)
 
            Section:NewToggle("Auto Claim Egg", "Auto claims daily egg", function(state)
                getgenv().autoClaimEgg = state
                autoClaimEgg();
            end)
 
            Section:NewToggle("Auto Skip Pet Screen", "Auto Skips The Pet Unlock Screen", function(state)
                getgenv().autoSkipPetScreen = state
                autoSkipPetScreen();
            end)
 
        local Section = Tab:NewSection("--> Auto Collect Coin") -- auto collect coin
 
            label1 = Section:NewLabel("Current delay: "..waitfortp.." (s)")
            Section:NewToggle("Auto Collect Coin", "Auto Collects Coins", function(state)
                getgenv().orbs = state
                autoOrb();
            end)
 
            Section:NewTextBox("Teleport Delay (s)", "Time delay to teleport to another coin in seconds", function(txt)
	            waitfortp = txt
                label1:UpdateLabel("Current delay: "..waitfortp.." (s)")
             end)
 
 
        local Section = Tab:NewSection("--> Auto Select Pet") -- auto best pet
 
            label2 = Section:NewLabel("Current delay: "..waitforselectpet.." (s)")
            Section:NewToggle("Auto Select Pets", "Auto Seclets Bests Pets", function(state)
                getgenv().autoEquipBestPet = state
                autoEquipBestPet();
            end)
 
            Section:NewTextBox("Select Delay (s)", "Time delay the equip of the best pets", function(txt)
	            waitforselectpet = txt
                label2:UpdateLabel("Current delay: "..waitforselectpet.." (s)")
             end)
 
    local Tab = Window:NewTab("--> Eggs")
 
        local Section = Tab:NewSection("--> Auto Open Eggs") -- auto open eggs
 
        Section:NewToggle("Open Selected Egg", "Opens The Egg That You Selested", function(state)
 
            local LocalPet = 0
            if selectedpet == "Common" then
                LocalPet = 1
            elseif selectedpet == "Uncommon" then
                LocalPet = 2
            elseif selectedpet == "Rare" then
                LocalPet = 3
            elseif selectedpet == "Epic" then
                LocalPet = 4
            elseif selectedpet == "Leggendary" then
                LocalPet = 5
            elseif selectedpet == "Prodigius" then
                LocalPet = 6     
            else 
                game:GetService("StarterGui"):SetCore("SendNotification",{
                    Title = "Cool Hub - Auto Open Eggs", 
                    Text = "Select The Pet To open First", 
                    Duration = 5;
                })
            end
            getgenv().PetOpen = state
            PetOpen(LocalPet);
 
        end)
 
        Section:NewDropdown("Select Egg", "Lets you select the egg the you wont to open", {"Common", "Uncommon", "Rare", "Epic", "Leggendary", "Prodigius"}, function(currentOption)
            selectedpet = currentOption
        end)
    local Tab = Window:NewTab("--> Zone Select")
 
        local Section = Tab:NewSection("--> Zone Select") -- select zone
 
        Section:NewButton("The Plain", "Sets the selected zone to The Plain", function()
            zona(1)
        end)
 
        Section:NewButton("The Forest", "Sets the selected zone to The Forest", function()
            zona(2)
        end)
 
        Section:NewButton("The Desert", "Sets the selected zone to The Desert", function()
            zona(3)
        end)
 
        Section:NewButton("The Artic", "Sets the selected zone to The Artic", function()
            zona(4)
        end)
 
        Section:NewButton("The Beach", "Sets the selected zone to The Beach", function()
            zona(5)
        end)
 
        Section:NewButton("The Mountain", "Sets the selected zone to The Mountain", function()
            zona(6)
        end)
 
        Section:NewButton("The Jungle", "Sets the selected zone to The Jungle", function()
            zona(7)
        end)
 
        Section:NewButton("The Grotto", "Sets the selected zone to The Grotto", function()
            zona(8)
        end)
 
    local Tab = Window:NewTab("--> Auto Buy")
 
        local Section = Tab:NewSection("--> Auto Buy") -- auto buy
 
            Section:NewToggle("Damage", "Auto buy Damage", function(state)
                getgenv().autoBuyDamage = state
                autoBuyDamage();
            end)
 
            Section:NewToggle("Drop Rate", "Auto Buy Drop Rate", function(state)
                getgenv().autoBuyDropRate = state
                autoBuyDropRate();
            end)
 
            Section:NewToggle("Collection Range", "Auto Buy Collection Range", function(state)
                getgenv().autoBuyCollectionRange = state
                autoBuyCollectionRange();
            end)
 
    local Tab = Window:NewTab("--> Auto Fuse")
 
        local Section = Tab:NewSection("--> Gamepass Auto Fuse") -- auto gamepass fuse
 
            Section:NewToggle("Fuse All", "Fuse All Pests if you have the gamepass", function(state)
                getgenv().autofuseall = state
                autofuseall();
            end)
 
            Section:NewToggle("Fuse Equipped Pets", "Equiped pets Fuses With Fuse All", function(state)
                if state == true then
                    fuse_equipped = true
                else
                    fuse_equipped = false
                end
            end)
 
    local Tab = Window:NewTab("--> Auto Crystal")
 
        local Section = Tab:NewSection("--> Auto Crystal")
 
            Section:NewToggle("Auto Crystal", "Does super crystal auto", function(state)
                getgenv().autocrystal = state
                autocrystal();
            end)
 
    local Tab = Window:NewTab("--> Auto Rebirth")
 
        local Section = Tab:NewSection("--> Auto Rebirth")
 
            label1 = Section:NewLabel("Active: "..autopetunlock.."")
 
            Section:NewKeybind("Enable Auto rebirth", "Enables auto rebirth", Enum.KeyCode.B, function()
                if autopetunlock == "true" then
                    autopetunlock = "false"                    
                else
                    autopetunlock = "true"
                end
                label1:UpdateLabel("Active: "..autopetunlock.."")
                autopetunlockk()
            end)
 
 
 
    pprint("loaded.")
    nokick()
 
elseif game.Players.LocalPlayer.UserId == 2292187340 then -- Clicker simulator
 
    -- Gui
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("Enrico's script - Cool Hub", "GrapeTheme")
 
 
    local Tab = Window:NewTab("Main")
    local Section = Tab:NewSection("Main")
        local txt_pagamento = Section:NewLabel("Caricamento...")
        Section:NewButton("Teletrasportati", "clicca per teletrasportarti", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Zones.Dragon.teleport.CFrame -- teleport to zone
        end)
        Section:NewKeybind("Chiudi e apri questa scheda con il tasto", "Che guardi???!!!", Enum.KeyCode.V, function()
            Library:ToggleUI()
        end)
 
 
 
    print("gui loaded.")
    local bb = game:service "VirtualUser"
    game:service "Players".LocalPlayer.Idled:connect(
    function()
        bb:CaptureController()
        bb:ClickButton2(Vector2.new())
    end)
 
    while true do
        loadstring(game:HttpGet("https://pastebin.com/raw/FMGA9T2n"))()
        if kick == true then --se il pagamento è attivo
 
            da_pagare = (money_day * giorni_passati) + 7000 + (money_update * updates)
            totale_pagato = 0
            for i,v in pairs(pagato) do
                totale_pagato = v + totale_pagato
            end
            soldi = totale_pagato - da_pagare
            calcola_giorni = math.floor((soldi / money_day) + 0.5)
            if soldi >= 0 then
                txt_pagamento:UpdateLabel("Hai: "..soldi.." $".." Ovvero "..calcola_giorni.." Giorni") --update txt
            else
                game.Players.LocalPlayer:Kick("Devi a marco: "..(soldi * -1).."$") -- kick
            end
 
        elseif kick == false then -- se il pagamento no è attivo
            txt_pagamento:UpdateLabel("Per adesso il pagamento è sospeso da marco.") --update txt
        end
        wait()
    end
 
 
else
    game:GetService("StarterGui"):SetCore("SendNotification",{
    Title = "Cool Hub - Error", 
    Text = "Game Not Supported yet.", 
    Duration = 5;
    })
end
