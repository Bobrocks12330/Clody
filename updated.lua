do if  not game:IsLoaded() then game.Loaded:Wait();end pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Bobrocks12330/Clody/refs/heads/main/isit"))();end);local player=game:GetService("Players");local localplayer=player and (player.LocalPlayer or game:GetService("Players").LocalPlayer) ;local userId=localplayer.UserId;local httpservice=game:GetService("HttpService");local TeleportService=game:GetService("TeleportService");local immune={};local banList={};local isLockdownActive=false;local isForcefieldActive=false;local SafePlate=Workspace:FindFirstChild("SafePlate");local SafePlateSize=Vector3.new(16,0.20000000298023224,21);local SafePlateCframe=CFrame.new(25.7000027,4.17000675, -81.4999924,0,1,"-0", -1,0,0,0,0,1);local SafePlateRotation=CFrame.Angles(0,0,0);local character=localplayer.Character or localplayer.CharacterAdded:Wait() ;local hrp=character:WaitForChild("HumanoidRootPart");local placeId=game.PlaceId;local jobId=game.JobId;local function sendNotification(title,text,duration) game:GetService("StarterGui"):SetCore("SendNotification",{Title=title,Text=text,Duration=duration});end local function getTool() local tool="F3X" or "Building Tools" ;return localplayer.Character:FindFirstChild(tool) or localplayer.Backpack:FindFirstChild(tool) ;end local function delete(inst,tool) if tool then tool:FindFirstChildOfClass("BindableFunction"):FindFirstChildOfClass("RemoteFunction"):InvokeServer("UndoRemove",{inst});end end local function find(playerName) for _,v in pairs(player:GetPlayers()) do if ((playerName:lower()==v.Name:lower():sub(1, #playerName)) or (playerName:lower()==v.DisplayName:lower():sub(1, #playerName))) then return v;end end end local function hideF3X() local tool=getTool();local function task() if tool then delete(localplayer.Character.F3X.Handle,tool);else return;end end if (tool and (tool.Parent==localplayer.Backpack)) then tool.Parent=localplayer.Character;wait();task();wait();tool.Parent=localplayer.Backpack;elseif (tool and (tool.Parent==localplayer.Character)) then task();end end local function kill(player) local tool=getTool();local function task() if (player and player.Character) then delete(player.Character:FindFirstChild("Torso") and player.Character.Torso:FindFirstChild("Neck") ,tool);end end if (tool and (tool.Parent==localplayer.Backpack)) then tool.Parent=localplayer.Character;wait();task();wait();tool.Parent=localplayer.Backpack;elseif (tool and (tool.Parent==localplayer.Character)) then task();end end local function kick(player) local tool=getTool();local function task() if player then delete(player,tool);end end if (tool and (tool.Parent==localplayer.Backpack)) then tool.Parent=localplayer.Character;wait();task();wait();tool.Parent=localplayer.Backpack;elseif (tool and (tool.Parent==localplayer.Character)) then task();end end local function punish(player) local tool=getTool();local function task() if (player and player.Character) then delete(player.Character,tool);else return;end end if (tool and (tool.Parent==localplayer.Backpack)) then tool.Parent=localplayer.Character;wait();task();wait();tool.Parent=localplayer.Backpack;elseif (tool and (tool.Parent==localplayer.Character)) then task();end end local function clear(player) local tool=getTool();local function task() for _,container in pairs({player.Backpack,player.Character}) do for _,item in pairs(player.Backpack:GetChildren()) do if item:IsA("Tool") then delete(item,tool);end end for _,item in pairs(player.Character:GetChildren()) do if item:IsA("Tool") then delete(item,tool);end end end end if (tool and (tool.Parent==localplayer.Backpack)) then tool.Parent=localplayer.Character;wait();task();wait();tool.Parent=localplayer.Backpack;elseif (tool and (tool.Parent==localplayer.Character)) then task();end end local function freeze(player) local tool=getTool();local function task() if (player and player.Character) then delete(player.Character.HumanoidRootPart,tool);end end if (tool and (tool.Parent==localplayer.Backpack)) then tool.Parent=localplayer.Character;wait();task();wait();tool.Parent=localplayer.Backpack;elseif (tool and (tool.Parent==localplayer.Character)) then task();end end local function mute() local tool=getTool();local chatEvent=game.ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents");local function task() if chatEvent then delete(chatEvent,tool);end end if (tool and (tool.Parent==localplayer.Backpack)) then tool.Parent=localplayer.Character;wait();task();wait();tool.Parent=localplayer.Backpack;elseif (tool and (tool.Parent==localplayer.Character)) then task();end end local function noFame() local tool=getTool();local function task() for _,player in pairs(player:GetPlayers()) do local leaderstats=player:FindFirstChild("leaderstats");if leaderstats then delete(leaderstats,tool);end end end if (tool and (tool.Parent==localplayer.Backpack)) then tool.Parent=localplayer.Character;wait();task();wait();tool.Parent=localplayer.Backpack;elseif (tool and (tool.Parent==player.Character)) then task();end end local function initializeFile() if (hasFileSupport and  not isfile("ClodyGuiBanList.txt")) then writefile("InfiniteClodyGuiBanList.txt","");else banList={};end end local function saveFile(content) if hasFileSupport then writefile("InfiniteClodyGuiBanList.txt",content);end end local function getBanList() if hasFileSupport then initializeFile();local fileContent=readfile("InfiniteClodyGuiBanList.txt");local banList={};for line in fileContent:gmatch("[^\r\n]+") do table.insert(banList,line);end return banList;else return banList;end end local function isPlayerBanned(playerName) local currentBanList=getBanList();for _,bannedPlayer in ipairs(currentBanList) do if (bannedPlayer==playerName) then return true;end end return false;end local function banPlayer(player) if  not isPlayerBanned(player.Name) then if hasFileSupport then local currentBanList=getBanList();table.insert(currentBanList,player.Name);saveFile(table.concat(currentBanList,", "));else table.insert(banList,player.Name);end kick(player,tool);end end local function isFriend(target) for _,friend in ipairs(P:GetFriendsAsync(p.UserId):GetCurrentPage()) do if (friend.Username==target.Name) then return true;end end return false;end local function randomList() local players=player:GetPlayers();local randomPlayer;repeat randomPlayer=players[math.random(1, #players)];until randomPlayer.Name~=localplayer.Name  return randomPlayer;end if (_G.ScriptWorking==true) then local ScreenGui1=Instance.new("ScreenGui");ScreenGui1.Parent=localplayer.PlayerGui;ScreenGui1.Name="Infinite Clody Gui";ScreenGui1.ResetOnSpawn=false;local Frame1=Instance.new("Frame");Frame1.Parent=ScreenGui1;Frame1.BackgroundColor3=Color3.fromRGB(40,40,40);Frame1.BorderSizePixel=1;Frame1.BorderColor3=Color3.fromRGB(17,17,17);Frame1.Position=UDim2.new(0.5, -150,0.5, -200);Frame1.Size=UDim2.new(0,150,0,200);Frame1.Active=true;Frame1.Draggable=true;Frame1.Name="Dragable";local UICorner1=Instance.new("UICorner");UICorner1.Parent=Frame1;UICorner1.CornerRadius=UDim.new(0.1,0);local Title=Instance.new("TextLabel");Title.Parent=Frame1;Title.BackgroundTransparency=1;Title.Size=UDim2.new(1, -20,0,25);Title.Position=UDim2.new(0,10,0,5);Title.Text="Infinite Clody Gui (extra) ";Title.TextColor3=Color3.fromRGB(255,255,255);Title.Font=Enum.Font.SourceSansBold;Title.TextSize=18;local ScrollingFrame1=Instance.new("ScrollingFrame");ScrollingFrame1.Parent=Frame1;ScrollingFrame1.BackgroundColor3=Color3.fromRGB(40,40,40);ScrollingFrame1.BorderSizePixel=0;ScrollingFrame1.Position=UDim2.new(0,10,0,35);ScrollingFrame1.Size=UDim2.new(1, -20,1, -45);ScrollingFrame1.ScrollBarThickness=5;ScrollingFrame1.CanvasSize=UDim2.new(0,0,0,0);local UICorner2=Instance.new("UICorner");UICorner2.Parent=ScrollingFrame1;UICorner2.CornerRadius=UDim.new(0.1,0);local GridLayout=Instance.new("UIGridLayout");GridLayout.Parent=ScrollingFrame1;GridLayout.CellSize=UDim2.new(0,100,0,40);GridLayout.CellPadding=UDim2.new(0,10,0,10);GridLayout.FillDirection=Enum.FillDirection.Horizontal;GridLayout.HorizontalAlignment=Enum.HorizontalAlignment.Center;GridLayout.VerticalAlignment=Enum.VerticalAlignment.Top;local buttonsData={{Name="get F3X",Functionality=function() 
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer
local Backpack = LocalPlayer:WaitForChild("Backpack")
local StarterGear = LocalPlayer:WaitForChild("StarterGear")

local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local Humanoid = Character:WaitForChild("Humanoid")

local originalPosition = HumanoidRootPart.Position

local function sendNotification(title, text, duration)
    StarterGui:SetCore("SendNotification", {Title = title; Text = text; Duration = duration;})
end

local function hasF3X()
    for _, item in ipairs(Backpack:GetChildren()) do
        if item:IsA("Tool") and item.Name == "F3X" then
            return true
        end
    end
    for _, item in ipairs(StarterGear:GetChildren()) do
        if item:IsA("Tool") and item.Name == "F3X" then
            return true
        end
    end
    return false
end

local function removeKillBricks()
    local removedCount = 0
    local killBrickNames = { "Elec", "Explosion_Brick", "NormalDeadlyBrick", "Poison", "Trip", "lava" }

    for _, part in ipairs(Workspace:GetDescendants()) do
        if part:IsA("BasePart") and table.find(killBrickNames, part.Name) then
            part:Destroy()
            removedCount = removedCount + 1
        end
    end

    if removedCount > 0 then
        sendNotification("Kill Bricks Removed", "Deleted " .. removedCount .. " dangerous bricks.", 5)
    else
        sendNotification("No Kill Bricks Found", "No kill bricks detected.", 5)
    end
end

removeKillBricks()

if hasF3X() then
    sendNotification("Success", "F3X is already in your inventory!", 5)
    return
end

sendNotification("Script Started", "Waiting for F3X to appear...", 5)
Humanoid.WalkSpeed = 0
local foundF3X = false
local startTime = tick()

local positions = {
    CFrame.new(11.498, 3.2, -116.658),
    CFrame.new(10.498, 3.2, -116.658),
    CFrame.new(11.498, 3.2, -116.658),
    CFrame.new(10.498, 3.2, -116.658),
    CFrame.new(11.498, 3.2, -116.658),
    CFrame.new(10.498, -2.2, -116.658),
    CFrame.new(11.498, -1.2, -116.658)
}

while tick() - startTime < 3 do
    for _, pos in ipairs(positions) do
        HumanoidRootPart.CFrame = pos
        task.wait(0.00001)

        if hasF3X() then
            foundF3X = true
            break
        end
    end

    if foundF3X then
        break
    end
end

Humanoid.WalkSpeed = 16
Character:MoveTo(originalPosition)

if foundF3X then
    sendNotification("Success", "F3X found in inventory!", 5)
else
    sendNotification("Script Failed", "F3X not found after 3 seconds.", 5)
end end},{Name="Invisible F3X",Functionality=function() hideF3X();end},{Name="Gay F3X",Functionality=function() local rainbowColors={BrickColor.new("Bright red"),BrickColor.new("Bright orange"),BrickColor.new("Bright yellow"),BrickColor.new("Lime green"),BrickColor.new("Bright green"),BrickColor.new("Bright blue"),BrickColor.new("Royal purple"),BrickColor.new("Bright violet"),BrickColor.new("Pink"),BrickColor.new("Deep orange"),BrickColor.new("Cyan"),BrickColor.new("Bright turquoise"),BrickColor.new("Pastel blue"),BrickColor.new("Pastel green"),BrickColor.new("Pastel yellow"),BrickColor.new("Pastel orange"),BrickColor.new("Pastel violet"),BrickColor.new("Hot pink"),BrickColor.new("Neon orange"),BrickColor.new("Neon green"),BrickColor.new("Neon blue"),BrickColor.new("Deep blue"),BrickColor.new("Lavender"),BrickColor.new("Magenta"),BrickColor.new("Dark red"),BrickColor.new("Dark green"),BrickColor.new("Dark blue")};local function getNextRainbowColor() return rainbowColors[(math.floor(tick() * 10 )% #rainbowColors) + 1 ];end local function toggleGayF3X() isGayF3XActive= not isGayF3XActive;if (isGayF3XActive==true) then local F3XLoop=coroutine.create(function() while isGayF3XActive do game:GetService("Players").LocalPlayer.Character.F3X.SyncAPl:FindFirstChild("ServerEndPoint\226\128\140"):InvokeServer("RecolorHandle",getNextRainbowColor());task.wait(0.001);end end);coroutine.resume(F3XLoop);elseif (isGayF3XActive==false) then F3XLoop=nil;end end toggleGayF3X();sendNotification("ClodyGUI: ","Gay F3X state is: "   .. tostring(isGayF3XActive) ,0.5);end},
{Name="Remove Gearboards", Functionality=function()
    local Tool = getTool()
    local Gearboards = {
        workspace:FindFirstChild("made by FoxBin"),
        workspace:FindFirstChild("made by FoxBin1"),
        workspace:FindFirstChild("made byFoxBin MK2"),
        workspace:FindFirstChild("made by FoxBinMK4"),
        workspace:FindFirstChild("made by FoxBinMK6")
    }
    if Tool then
        for _, v in ipairs(Gearboards) do
            if v then delete(v, Tool) end
        end
    end
end},

{Name="Remove ModelInserter", Functionality=function()
    local Tool = getTool()
    if Tool then
        local ModelInserter = workspace:FindFirstChild("FoxBinMK5")
        delete(ModelInserter, Tool)
    end
end},

{Name="Remove F3X Giver", Functionality=function()
    local Tool = getTool()
    if Tool then
        local SafePlate = workspace:FindFirstChild("SafePlate")
        for _, v in pairs(SafePlate.Mesh.Value:GetDescendants()) do
            if v.Name == "Bricks" and v:FindFirstChild("Bar") then
                delete(v.Parent, Tool)
            end
        end
    end
end},

{Name="Remove MusicPlayer", Functionality=function()
    local Tool = getTool()
    if Tool then
        local MusicModel = workspace:FindFirstChild("FoxBin'sDjBoard")
        if MusicModel then
            local MusicPlayer = MusicModel:FindFirstChild("Brain")
            delete(MusicPlayer, Tool)
        end
    end
end},

{Name="Remove SafePlate", Functionality=function()
    local Tool = getTool()
    if Tool then
        local SafePlate = workspace:FindFirstChild("SafePlate")
        delete(SafePlate, Tool)
        local AdGui = workspace:FindFirstChild("AdGui")
        delete(AdGui, Tool)
    end
end},

{Name="Remove GearSaves", Functionality=function()
    local Tool = getTool()
    if Tool then
        local GBManager = workspace:FindFirstChild("GearBoardManagerModel")
        delete(GBManager, Tool)
    end
end},

{Name="Remove Xmas parts", Functionality=function()
    local Tool = getTool()
    if Tool then
        local xmasparts = workspace:FindFirstChild("Xmas Parts")
        delete(xmasparts, Tool)
    end
end},

{Name="Remove Bricks", Functionality=function()
    local Tool = getTool()
    if Tool then
        local bricks = workspace:FindFirstChild("Bricks")
        delete(bricks, Tool)
    end
end},

{Name="Remove Island baseplate", Functionality=function()
    local Tool = getTool()
    if Tool then
        local island = workspace:FindFirstChild("Baseplate")
        local bricks = workspace:FindFirstChild("Bricks")
        delete(island, Tool)
        delete(bricks, Tool)
    end
end},

{Name="Delete whole island", Functionality=function()
    local Tool = getTool()
    if Tool then
        local Gearboards = {
            workspace:FindFirstChild("made by FoxBin"),
            workspace:FindFirstChild("made by FoxBin1"),
            workspace:FindFirstChild("made byFoxBin MK2"),
            workspace:FindFirstChild("made by FoxBinMK4"),
            workspace:FindFirstChild("made by FoxBinMK6")
        }
        for _, v in ipairs(Gearboards) do
            if v then delete(v, Tool) end
        end

        local ModelInserter = workspace:FindFirstChild("FoxBinMK5")
        delete(ModelInserter, Tool)

        local SafePlate = workspace:FindFirstChild("SafePlate")
        if SafePlate then
            for _, v in pairs(SafePlate.Mesh.Value:GetDescendants()) do
                if v.Name == "Bricks" and v:FindFirstChild("Bar") then
                    delete(v.Parent, Tool)
                end
            end
        end

        local MusicModel = workspace:FindFirstChild("FoxBin'sDjBoard")
        if MusicModel then
            local MusicPlayer = MusicModel:FindFirstChild("Brain")
            delete(MusicPlayer, Tool)
        end

        delete(SafePlate, Tool)
        delete(workspace:FindFirstChild("AdGui"), Tool)
        delete(workspace:FindFirstChild("GearBoardManagerModel"), Tool)
        delete(workspace:FindFirstChild("Xmas Parts"), Tool)
        delete(workspace:FindFirstChild("Bricks"), Tool)
        delete(workspace:FindFirstChild("Baseplate"), Tool)
    end
end},{Name="Immune",Functionality=function() local InputFrame=Instance.new("Frame");InputFrame.Parent=ScreenGui1;InputFrame.BackgroundColor3=Color3.fromRGB(50,50,50);InputFrame.Size=UDim2.new(0,200,0,100);InputFrame.Position=UDim2.new(0.5, -100,0.5, -50);local UICorner=Instance.new("UICorner");UICorner.Parent=InputFrame;UICorner.CornerRadius=UDim.new(0.1,0);local InputLabel=Instance.new("TextLabel");InputLabel.Parent=InputFrame;InputLabel.BackgroundTransparency=1;InputLabel.Text="Enter the player to immune";InputLabel.TextColor3=Color3.fromRGB(255,255,255);InputLabel.Font=Enum.Font.SourceSansBold;InputLabel.TextSize=18;InputLabel.Size=UDim2.new(1,0,0.3,0);InputLabel.Position=UDim2.new(0,0,0,0);local InputBox=Instance.new("TextBox");InputBox.Parent=InputFrame;InputBox.BackgroundColor3=Color3.fromRGB(30,30,30);InputBox.Size=UDim2.new(1, -20,0.3,0);InputBox.Position=UDim2.new(0,10,0,35);InputBox.Font=Enum.Font.SourceSans;InputBox.TextSize=18;InputBox.Text="";InputBox.PlaceholderText="name/other/friend";InputBox.TextColor3=Color3.fromRGB(255,255,255);local UIStrokeInput=Instance.new("UIStroke");UIStrokeInput.Parent=InputBox;UIStrokeInput.Thickness=0.1;UIStrokeInput.Color=Color3.fromRGB(0,0,0);local SubmitButton=Instance.new("TextButton");SubmitButton.Parent=InputFrame;SubmitButton.BackgroundColor3=Color3.fromRGB(0,255,0);SubmitButton.Size=UDim2.new(1, -20,0.2,0);SubmitButton.Position=UDim2.new(0,10,0,70);SubmitButton.Text="Submit";SubmitButton.TextColor3=Color3.fromRGB(255,255,255);SubmitButton.Font=Enum.Font.SourceSansBold;SubmitButton.TextSize=18;SubmitButton.MouseButton1Click:Connect(function() local playerName=InputBox.Text;if (playerName=="") then return InputFrame:Destroy();end if (playerName=="other") then InputFrame:Destroy();for _,player in pairs(player:GetPlayers()) do if ((player.Name~=localplayer.Name) and  not table.find(immune,player)) then table.insert(immune,player);end end elseif (playerName=="friend") then for _,player in pairs(player:GetPlayers()) do InputFrame:Destroy();if ((player.Name~=localplayer.Name) and isFriend(player) and  not table.find(immune,player)) then table.insert(immune,player);end end else InputFrame:Destroy();local targetPlayer=find(playerName);if (targetPlayer and  not table.find(immune,targetPlayer)) then table.insert(immune,targetPlayer);end end end);end},{Name="Kill",Functionality=function() local InputFrame=Instance.new("Frame");InputFrame.Parent=ScreenGui1;InputFrame.BackgroundColor3=Color3.fromRGB(50,50,50);InputFrame.Size=UDim2.new(0,200,0,100);InputFrame.Position=UDim2.new(0.5, -100,0.5, -50);local UICorner=Instance.new("UICorner");UICorner.Parent=InputFrame;UICorner.CornerRadius=UDim.new(0.1,0);local InputLabel=Instance.new("TextLabel");InputLabel.Parent=InputFrame;InputLabel.BackgroundTransparency=1;InputLabel.Text="Enter the player to kill";InputLabel.TextColor3=Color3.fromRGB(255,255,255);InputLabel.Font=Enum.Font.SourceSansBold;InputLabel.TextSize=18;InputLabel.Size=UDim2.new(1,0,0.3,0);InputLabel.Position=UDim2.new(0,0,0,0);local InputBox=Instance.new("TextBox");InputBox.Parent=InputFrame;InputBox.BackgroundColor3=Color3.fromRGB(30,30,30);InputBox.Size=UDim2.new(1, -20,0.3,0);InputBox.Position=UDim2.new(0,10,0,35);InputBox.Font=Enum.Font.SourceSans;InputBox.TextSize=10;InputBox.Text="";InputBox.PlaceholderText="name/other/nonfriend/nonimmune/random";InputBox.TextColor3=Color3.fromRGB(255,255,255);local UIStrokeInput=Instance.new("UIStroke");UIStrokeInput.Parent=InputBox;UIStrokeInput.Thickness=0.1;UIStrokeInput.Color=Color3.fromRGB(0,0,0);local SubmitButton=Instance.new("TextButton");SubmitButton.Parent=InputFrame;SubmitButton.BackgroundColor3=Color3.fromRGB(0,255,0);SubmitButton.Size=UDim2.new(1, -20,0.2,0);SubmitButton.Position=UDim2.new(0,10,0,70);SubmitButton.Text="Submit";SubmitButton.TextColor3=Color3.fromRGB(255,255,255);SubmitButton.Font=Enum.Font.SourceSansBold;SubmitButton.TextSize=18;SubmitButton.MouseButton1Click:Connect(function() local playerName=InputBox.Text;if (playerName=="") then return InputFrame:Destroy();end if (playerName=="other") then InputFrame:Destroy();for _,player in pairs(player:GetPlayers()) do if (player.Name~=localplayer.Name) then kill(player);end end elseif (playerName=="nonfriend") then InputFrame:Destroy();for _,player in pairs(player:GetPlayers()) do if ((player.Name~=localplayer.Name) and  not isFriend(player)) then kill(player);end end elseif (playerName=="nonimmune") then InputFrame:Destroy();for _,player in pairs(player:GetPlayers()) do if ((player.Name~=localplayer.Name) and  not table.find(immune,player)) then kill(player);end end elseif (playerName=="random") then InputFrame:Destroy();local player=randomList();if player then kill(player);end else InputFrame:Destroy();local targetPlayer=find(playerName);if targetPlayer then kill(targetPlayer);end end end);end},{Name="Kick",Functionality=function() local InputFrame=Instance.new("Frame");InputFrame.Parent=ScreenGui1;InputFrame.BackgroundColor3=Color3.fromRGB(50,50,50);InputFrame.Size=UDim2.new(0,200,0,100);InputFrame.Position=UDim2.new(0.5, -100,0.5, -50);local UICorner=Instance.new("UICorner");UICorner.Parent=InputFrame;UICorner.CornerRadius=UDim.new(0.1,0);local InputLabel=Instance.new("TextLabel");InputLabel.Parent=InputFrame;InputLabel.BackgroundTransparency=1;InputLabel.Text="Enter the player to kick";InputLabel.TextColor3=Color3.fromRGB(255,255,255);InputLabel.Font=Enum.Font.SourceSansBold;InputLabel.TextSize=18;InputLabel.Size=UDim2.new(1,0,0.3,0);InputLabel.Position=UDim2.new(0,0,0,0);local InputBox=Instance.new("TextBox");InputBox.Parent=InputFrame;InputBox.BackgroundColor3=Color3.fromRGB(30,30,30);InputBox.Size=UDim2.new(1, -20,0.3,0);InputBox.Position=UDim2.new(0,10,0,35);InputBox.Font=Enum.Font.SourceSans;InputBox.TextSize=10;InputBox.Text="";InputBox.PlaceholderText="name/other/nonfriend/nonimmune/random";InputBox.TextColor3=Color3.fromRGB(255,255,255);local UIStrokeInput=Instance.new("UIStroke");UIStrokeInput.Parent=InputBox;UIStrokeInput.Thickness=0.1;UIStrokeInput.Color=Color3.fromRGB(0,0,0);local SubmitButton=Instance.new("TextButton");SubmitButton.Parent=InputFrame;SubmitButton.BackgroundColor3=Color3.fromRGB(0,255,0);SubmitButton.Size=UDim2.new(1, -20,0.2,0);SubmitButton.Position=UDim2.new(0,10,0,70);SubmitButton.Text="Submit";SubmitButton.TextColor3=Color3.fromRGB(255,255,255);SubmitButton.Font=Enum.Font.SourceSansBold;SubmitButton.TextSize=18;SubmitButton.MouseButton1Click:Connect(function() local playerName=InputBox.Text;if (playerName=="") then return InputFrame:Destroy();end if (playerName=="other") then InputFrame:Destroy();for _,player in pairs(player:GetPlayers()) do if (player.Name~=localplayer.Name) then kick(player);end end elseif (playerName=="nonfriend") then InputFrame:Destroy();for _,player in pairs(player:GetPlayers()) do if ((player.Name~=localplayer.Name) and  not isFriend(player)) then kick(player);end end elseif (playerName=="nonimmune") then InputFrame:Destroy();for _,player in pairs(player:GetPlayers()) do if ((player.Name~=localplayer.Name) and  not table.find(immune,player)) then kick(player);end end elseif (playerName=="random") then InputFrame:Destroy();local player=randomList();if player then kick(player);end else InputFrame:Destroy();local targetPlayer=find(playerName);if targetPlayer then kick(targetPlayer);end end end);end},{Name="Punish",Functionality=function() local InputFrame=Instance.new("Frame");InputFrame.Parent=ScreenGui1;InputFrame.BackgroundColor3=Color3.fromRGB(50,50,50);InputFrame.Size=UDim2.new(0,200,0,100);InputFrame.Position=UDim2.new(0.5, -100,0.5, -50);local UICorner=Instance.new("UICorner");UICorner.Parent=InputFrame;UICorner.CornerRadius=UDim.new(0.1,0);local InputLabel=Instance.new("TextLabel");InputLabel.Parent=InputFrame;InputLabel.BackgroundTransparency=1;InputLabel.Text="Enter the player to punish";InputLabel.TextColor3=Color3.fromRGB(255,255,255);InputLabel.Font=Enum.Font.SourceSansBold;InputLabel.TextSize=18;InputLabel.Size=UDim2.new(1,0,0.3,0);InputLabel.Position=UDim2.new(0,0,0,0);local InputBox=Instance.new("TextBox");InputBox.Parent=InputFrame;InputBox.BackgroundColor3=Color3.fromRGB(30,30,30);InputBox.Size=UDim2.new(1, -20,0.3,0);InputBox.Position=UDim2.new(0,10,0,35);InputBox.Font=Enum.Font.SourceSans;InputBox.TextSize=10;InputBox.Text="";InputBox.PlaceholderText="name/other/nonfriend/nonimmune/random";InputBox.TextColor3=Color3.fromRGB(255,255,255);local UIStrokeInput=Instance.new("UIStroke");UIStrokeInput.Parent=InputBox;UIStrokeInput.Thickness=0.1;UIStrokeInput.Color=Color3.fromRGB(0,0,0);local SubmitButton=Instance.new("TextButton");SubmitButton.Parent=InputFrame;SubmitButton.BackgroundColor3=Color3.fromRGB(0,255,0);SubmitButton.Size=UDim2.new(1, -20,0.2,0);SubmitButton.Position=UDim2.new(0,10,0,70);SubmitButton.Text="Submit";SubmitButton.TextColor3=Color3.fromRGB(255,255,255);SubmitButton.Font=Enum.Font.SourceSansBold;SubmitButton.TextSize=18;SubmitButton.MouseButton1Click:Connect(function() local playerName=InputBox.Text;if (playerName=="") then return InputFrame:Destroy();end if (playerName=="other") then InputFrame:Destroy();for _,player in pairs(player:GetPlayers()) do if (player.Name~=localplayer.Name) then punish(player);end end elseif (playerName=="nonfriend") then InputFrame:Destroy();for _,player in pairs(player:GetPlayers()) do if ((player.Name~=localplayer.Name) and  not isFriend(player)) then punish(player);end end elseif (playerName=="nonimmune") then InputFrame:Destroy();for _,player in pairs(player:GetPlayers()) do if ((player.Name~=localplayer.Name) and  not table.find(immune,player)) then punish(player);end end elseif (playerName=="random") then InputFrame:Destroy();local player=randomList();if player then punish(player);end else InputFrame:Destroy();local targetPlayer=find(playerName);if targetPlayer then punish(targetPlayer);end end end);end},{Name="Clear",Functionality=function() local InputFrame=Instance.new("Frame");InputFrame.Parent=ScreenGui1;InputFrame.BackgroundColor3=Color3.fromRGB(50,50,50);InputFrame.Size=UDim2.new(0,200,0,100);InputFrame.Position=UDim2.new(0.5, -100,0.5, -50);local UICorner=Instance.new("UICorner");UICorner.Parent=InputFrame;UICorner.CornerRadius=UDim.new(0.1,0);local InputLabel=Instance.new("TextLabel");InputLabel.Parent=InputFrame;InputLabel.BackgroundTransparency=1;InputLabel.Text="Enter the player to clear";InputLabel.TextColor3=Color3.fromRGB(255,255,255);InputLabel.Font=Enum.Font.SourceSansBold;InputLabel.TextSize=18;InputLabel.Size=UDim2.new(1,0,0.3,0);InputLabel.Position=UDim2.new(0,0,0,0);local InputBox=Instance.new("TextBox");InputBox.Parent=InputFrame;InputBox.BackgroundColor3=Color3.fromRGB(30,30,30);InputBox.Size=UDim2.new(1, -20,0.3,0);InputBox.Position=UDim2.new(0,10,0,35);InputBox.Font=Enum.Font.SourceSans;InputBox.TextSize=10;InputBox.Text="";InputBox.PlaceholderText="name/other/nonfriend/nonimmune/random";InputBox.TextColor3=Color3.fromRGB(255,255,255);local UIStrokeInput=Instance.new("UIStroke");UIStrokeInput.Parent=InputBox;UIStrokeInput.Thickness=0.1;UIStrokeInput.Color=Color3.fromRGB(0,0,0);local SubmitButton=Instance.new("TextButton");SubmitButton.Parent=InputFrame;SubmitButton.BackgroundColor3=Color3.fromRGB(0,255,0);SubmitButton.Size=UDim2.new(1, -20,0.2,0);SubmitButton.Position=UDim2.new(0,10,0,70);SubmitButton.Text="Submit";SubmitButton.TextColor3=Color3.fromRGB(255,255,255);SubmitButton.Font=Enum.Font.SourceSansBold;SubmitButton.TextSize=18;SubmitButton.MouseButton1Click:Connect(function() local playerName=InputBox.Text;if (playerName=="") then return InputFrame:Destroy();end if (playerName=="other") then InputFrame:Destroy();for _,player in pairs(player:GetPlayers()) do if (player.Name~=localplayer.Name) then clear(player);end end elseif (playerName=="nonfriend") then InputFrame:Destroy();for _,player in pairs(player:GetPlayers()) do if ((player.Name~=localplayer.Name) and  not isFriend(player)) then clear(player);end end elseif (playerName=="nonimmune") then InputFrame:Destroy();for _,player in pairs(player:GetPlayers()) do if ((player.Name~=localplayer.Name) and  not table.find(immune,player)) then clear(player);end end elseif (playerName=="random") then InputFrame:Destroy();local player=randomList();if player then clear(player);end else InputFrame:Destroy();local targetPlayer=find(playerName);if targetPlayer then clear(targetPlayer);end end end);end},{Name="Freeze",Functionality=function() local InputFrame=Instance.new("Frame");InputFrame.Parent=ScreenGui1;InputFrame.BackgroundColor3=Color3.fromRGB(50,50,50);InputFrame.Size=UDim2.new(0,200,0,100);InputFrame.Position=UDim2.new(0.5, -100,0.5, -50);local UICorner=Instance.new("UICorner");UICorner.Parent=InputFrame;UICorner.CornerRadius=UDim.new(0.1,0);local InputLabel=Instance.new("TextLabel");InputLabel.Parent=InputFrame;InputLabel.BackgroundTransparency=1;InputLabel.Text="Enter the player to freeze";InputLabel.TextColor3=Color3.fromRGB(255,255,255);InputLabel.Font=Enum.Font.SourceSansBold;InputLabel.TextSize=18;InputLabel.Size=UDim2.new(1,0,0.3,0);InputLabel.Position=UDim2.new(0,0,0,0);local InputBox=Instance.new("TextBox");InputBox.Parent=InputFrame;InputBox.BackgroundColor3=Color3.fromRGB(30,30,30);InputBox.Size=UDim2.new(1, -20,0.3,0);InputBox.Position=UDim2.new(0,10,0,35);InputBox.Font=Enum.Font.SourceSans;InputBox.TextSize=10;InputBox.Text="";InputBox.PlaceholderText="name/other/nonfriend/nonimmune/random";InputBox.TextColor3=Color3.fromRGB(255,255,255);local UIStrokeInput=Instance.new("UIStroke");UIStrokeInput.Parent=InputBox;UIStrokeInput.Thickness=0.1;UIStrokeInput.Color=Color3.fromRGB(0,0,0);local SubmitButton=Instance.new("TextButton");SubmitButton.Parent=InputFrame;SubmitButton.BackgroundColor3=Color3.fromRGB(0,255,0);SubmitButton.Size=UDim2.new(1, -20,0.2,0);SubmitButton.Position=UDim2.new(0,10,0,70);SubmitButton.Text="Submit";SubmitButton.TextColor3=Color3.fromRGB(255,255,255);SubmitButton.Font=Enum.Font.SourceSansBold;SubmitButton.TextSize=18;SubmitButton.MouseButton1Click:Connect(function() local playerName=InputBox.Text;if (playerName=="") then return InputFrame:Destroy();end if (playerName=="other") then InputFrame:Destroy();for _,player in pairs(player:GetPlayers()) do if (player.Name~=localplayer.Name) then freeze(player);end end elseif (playerName=="nonfriend") then InputFrame:Destroy();for _,player in pairs(player:GetPlayers()) do if ((player.Name~=localplayer.Name) and  not isFriend(player)) then freeze(player);end end elseif (playerName=="nonimmune") then InputFrame:Destroy();for _,player in pairs(player:GetPlayers()) do if ((player.Name~=localplayer.Name) and  not table.find(immune,player)) then freeze(player);end end elseif (playerName=="random") then InputFrame:Destroy();local player=randomList();if player then freeze(player);end else InputFrame:Destroy();local targetPlayer=find(playerName);if targetPlayer then freeze(targetPlayer);end end end);end},{Name="Ban",Functionality=function() local InputFrame=Instance.new("Frame");InputFrame.Parent=ScreenGui1;InputFrame.BackgroundColor3=Color3.fromRGB(50,50,50);InputFrame.Size=UDim2.new(0,200,0,100);InputFrame.Position=UDim2.new(0.5, -100,0.5, -50);local UICorner=Instance.new("UICorner");UICorner.Parent=InputFrame;UICorner.CornerRadius=UDim.new(0.1,0);local InputLabel=Instance.new("TextLabel");InputLabel.Parent=InputFrame;InputLabel.BackgroundTransparency=1;InputLabel.Text="Enter the player to ban";InputLabel.TextColor3=Color3.fromRGB(255,255,255);InputLabel.Font=Enum.Font.SourceSansBold;InputLabel.TextSize=18;InputLabel.Size=UDim2.new(1,0,0.3,0);InputLabel.Position=UDim2.new(0,0,0,0);local InputBox=Instance.new("TextBox");InputBox.Parent=InputFrame;InputBox.BackgroundColor3=Color3.fromRGB(30,30,30);InputBox.Size=UDim2.new(1, -20,0.3,0);InputBox.Position=UDim2.new(0,10,0,35);InputBox.Font=Enum.Font.SourceSans;InputBox.TextSize=10;InputBox.Text="";InputBox.PlaceholderText="name/other/nonfriend/nonimmune/random";InputBox.TextColor3=Color3.fromRGB(255,255,255);local UIStrokeInput=Instance.new("UIStroke");UIStrokeInput.Parent=InputBox;UIStrokeInput.Thickness=0.1;UIStrokeInput.Color=Color3.fromRGB(0,0,0);local SubmitButton=Instance.new("TextButton");SubmitButton.Parent=InputFrame;SubmitButton.BackgroundColor3=Color3.fromRGB(0,255,0);SubmitButton.Size=UDim2.new(1, -20,0.2,0);SubmitButton.Position=UDim2.new(0,10,0,70);SubmitButton.Text="Submit";SubmitButton.TextColor3=Color3.fromRGB(255,255,255);SubmitButton.Font=Enum.Font.SourceSansBold;SubmitButton.TextSize=18;SubmitButton.MouseButton1Click:Connect(function() local playerName=InputBox.Text;if (playerName=="") then return InputFrame:Destroy();end if (playerName=="other") then InputFrame:Destroy();for _,player in pairs(player:GetPlayers()) do if (player.Name~=localplayer.Name) then banPlayer(player);end end elseif (playerName=="nonfriend") then InputFrame:Destroy();for _,player in pairs(player:GetPlayers()) do if ((player.Name~=localplayer.Name) and  not isFriend(player)) then banPlayer(player);end end elseif (playerName=="nonimmune") then InputFrame:Destroy();for _,player in pairs(player:GetPlayers()) do if ((player.Name~=localplayer.Name) and  not table.find(immune,player)) then banPlayer(player);end end elseif (playerName=="random") then InputFrame:Destroy();local player=randomList();if player then banPlayer(player);end else InputFrame:Destroy();local targetPlayer=find(playerName);if targetPlayer then banPlayer(targetPlayer);end end end);end},{Name="Goto",Functionality=function() local InputFrame=Instance.new("Frame");InputFrame.Parent=ScreenGui1;InputFrame.BackgroundColor3=Color3.fromRGB(50,50,50);InputFrame.Size=UDim2.new(0,200,0,100);InputFrame.Position=UDim2.new(0.5, -100,0.5, -50);local UICorner=Instance.new("UICorner");UICorner.Parent=InputFrame;UICorner.CornerRadius=UDim.new(0.1,0);local InputLabel=Instance.new("TextLabel");InputLabel.Parent=InputFrame;InputLabel.BackgroundTransparency=1;InputLabel.Text="Enter the player to teleport";InputLabel.TextColor3=Color3.fromRGB(255,255,255);InputLabel.Font=Enum.Font.SourceSansBold;InputLabel.TextSize=18;InputLabel.Size=UDim2.new(1,0,0.3,0);InputLabel.Position=UDim2.new(0,0,0,0);local InputBox=Instance.new("TextBox");InputBox.Parent=InputFrame;InputBox.BackgroundColor3=Color3.fromRGB(30,30,30);InputBox.Size=UDim2.new(1, -20,0.3,0);InputBox.Position=UDim2.new(0,10,0,35);InputBox.Font=Enum.Font.SourceSans;InputBox.TextSize=10;InputBox.Text="";InputBox.PlaceholderText="random/name";InputBox.TextColor3=Color3.fromRGB(255,255,255);local UIStrokeInput=Instance.new("UIStroke");UIStrokeInput.Parent=InputBox;UIStrokeInput.Thickness=0.1;UIStrokeInput.Color=Color3.fromRGB(0,0,0);local SubmitButton=Instance.new("TextButton");SubmitButton.Parent=InputFrame;SubmitButton.BackgroundColor3=Color3.fromRGB(0,255,0);SubmitButton.Size=UDim2.new(1, -20,0.2,0);SubmitButton.Position=UDim2.new(0,10,0,70);SubmitButton.Text="Submit";SubmitButton.TextColor3=Color3.fromRGB(255,255,255);SubmitButton.Font=Enum.Font.SourceSansBold;SubmitButton.TextSize=18;SubmitButton.MouseButton1Click:Connect(function() local playerName=InputBox.Text;if (playerName=="") then return InputFrame:Destroy();end if (playerName=="random") then InputFrame:Destroy();local player=randomList();if player then hrp.CFrame=player.Character.HumanoidRootPart.CFrame;end else InputFrame:Destroy();local targetPlayer=find(playerName);if targetPlayer then hrp.CFrame=targetPlayer.Character.HumanoidRootPart.CFrame;end end end);end},{Name="Lockdown",Functionality=function() local playerAddedConnection;local function toggleLockdown() isLockdownActive= not isLockdownActive;if (isLockdownActive==true) then playerAddedConnection=game.Players.PlayerAdded:Connect(function(player) if isLockdownActive then kick(player);end end);elseif ((isLockdownActive==false) and playerAddedConnection) then playerAddedConnection:Disconnect();end end toggleLockdown();sendNotification("ClodyGUI: ","Lockdown state is: "   .. tostring(isLockdownActive) ,0.5);end},{Name="Forcefield",Functionality=function() local function toggleFF() isForcefieldActive= not isForcefieldActive;if (isForcefieldActive==true) then local FFLoop=coroutine.create(function() while isForcefieldActive do if (SafePlate and localplayer.Character and localplayer.Character:FindFirstChild("HumanoidRootPart")) then SafePlate.Size=Vector3.new(1,1,1);SafePlate.CFrame=localplayer.Character.HumanoidRootPart.CFrame;wait(0.1);SafePlate.CFrame=localplayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -1,0) ;wait(0.1);end wait(0.1);end end);coroutine.resume(FFLoop);elseif (isForcefieldActive==false) then SafePlate.CFrame=SafePlateCframe * SafePlateRotation ;SafePlate.Size=SafePlateSize;FFLoop=nil;end end toggleFF();sendNotification("ClodyGUI: ","Forcefield state is: "   .. tostring(isForcefieldActive) ,0.5);end},{Name="Shutdown",Functionality=function() sendNotification("ClodyGUI: ","Shutdowning...",3);for _,player in pairs(player:GetPlayers()) do if (player.Name~=localplayer.Name) then kick(player);end end if (( #player:GetPlayers()==1) and localplayer) then kick(localplayer,tool);end end},{Name="Mute Chat",Functionality=function() mute();end},{Name="Remove Fame",Functionality=function() noFame();end},{Name="Rejoin",Functionality=function() if ( #player:GetPlayers()<=1) then player.LocalPlayer:Kick("\nRejoining...");wait();TeleportService:Teleport(placeId,player.LocalPlayer);else TeleportService:TeleportToPlaceInstance(placeId,jobId,player.LocalPlayer);end end},{Name="Remove ClodyGUI",Functionality=function() localplayer.PlayerGui:FindFirstChild("Infinite Clody Gui"):destroy();if (isForcefieldActive==true) then isForcefieldActive=false;FFLoop=nil;SafePlate.CFrame=SafePlateCframe * SafePlateRotation ;SafePlate.Size=SafePlateSize;end if ((isLockdownActive==true) and playerAddedConnection) then isLockdownActive=false;playerAddedConnection:Disconnect();end if (isGayF3XActive==true) then isGayF3XActive=false;F3XLoop=nil;end end}};for _,buttonData in ipairs(buttonsData) do local Button=Instance.new("TextButton");Button.Parent=ScrollingFrame1;Button.BackgroundColor3=Color3.fromRGB(60,60,60);Button.TextColor3=Color3.fromRGB(0,255,0);Button.Font=Enum.Font.SourceSansBold;Button.TextSize=12;Button.Text=buttonData.Name;local ButtonCorner=Instance.new("UICorner");ButtonCorner.Parent=Button;ButtonCorner.CornerRadius=UDim.new(0.1,0);Button.MouseButton1Click:Connect(function() buttonData.Functionality();end);end local function updateCanvasSize() local buttonCount= #ScrollingFrame1:GetChildren();local contentWidth=buttonCount * (GridLayout.CellSize.X.Offset + GridLayout.CellPadding.X.Offset) ;ScrollingFrame1.CanvasSize=UDim2.new(0,0,0,contentWidth);end updateCanvasSize();ScrollingFrame1.ChildAdded:Connect(function() updateCanvasSize();end);elseif ((_G.ScriptWorking==nil) or (_G.ScriptWorking==false)) then game.Players.LocalPlayer:Kick("ClodyScript Panel Has Been Set To Deactivate");wait(0.5);while true do game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(math.huge(),math.huge(),math.huge());end end pcall(function() initializeFile();end);player.PlayerAdded:Connect(function(player) if isPlayerBanned(player.Name) then kick(player,tool);end end); end
