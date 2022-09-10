if game.Players.LocalPlayer.UserId == 2292187340 then -- Clicker simulator
 
    -- Gui
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("Enrico's script - Cool Hub", "GrapeTheme")
 
 
    local Tab = Window:NewTab("Main")
    local Section = Tab:NewSection("Main")
        local txt_pagamento = Section:NewLabel("Caricamento...")
        Section:NewButton("Teletrasportati", "clicca per teletrasportarti", function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Zones.Dark_Fantasy.teleport.CFrame -- teleport to zone
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
