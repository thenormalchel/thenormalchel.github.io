local MacLib = loadstring(
    game:HttpGet(
        'https://raw.githubusercontent.com/thenormalchel/thenormalchel.github.io/refs/heads/main/libreal.txt'
    )
)()

local currentgame = "???"

local function getCurrentGameName()
    local success, gameName = pcall(function()
        local MarketplaceService = game:GetService("MarketplaceService")
        local productInfo = MarketplaceService:GetProductInfo(game.PlaceId)
        return productInfo.Name
    end)
    
    if success and gameName then
        return gameName
    else
        return "???"
    end
end

currentgame = getCurrentGameName()

if currentgame == "Game" then
    print("Loaded For : Ink Game")
elseif currentgame == "mm2" or currentgame:lower():find("murder") or currentgame:lower():find("mystery") then
    print("Loaded For : Murder Mystery 2")
elseif currentgame == "???" then
    print("???")
else
    print("???")
end
_G.currentgame = currentgame

versionofscript = 'B1.0'

local Window = MacLib:Window({
    Title = 'Dolphin DLC',
    Subtitle = 'Telegram : @DeepGit | v1.0',
    Size = UDim2.fromOffset(868, 650),
    DragStyle = 1,
    DisabledWindowControls = {},
    ShowUserInfo = true,
    Keybind = Enum.KeyCode.RightControl,
    AcrylicBlur = true,
})

local globalSettings = {
    UIBlurToggle = Window:GlobalSetting({
        Name = 'UI Blur',
        Default = Window:GetAcrylicBlurState(),
        Callback = function(bool)
            Window:SetAcrylicBlurState(bool)
            Window:Notify({
                Title = Window.Settings.Title,
                Description = (bool and 'Enabled' or 'Disabled') .. ' UI Blur',
                Lifetime = 5,
            })
        end,
    }),
    NotificationToggler = Window:GlobalSetting({
        Name = 'Notifications',
        Default = Window:GetNotificationsState(),
        Callback = function(bool)
            Window:SetNotificationsState(bool)
            Window:Notify({
                Title = Window.Settings.Title,
                Description = (bool and 'Enabled' or 'Disabled')
                    .. ' Notifications',
                Lifetime = 5,
            })
        end,
    }),
    ShowUserInfo = Window:GlobalSetting({
        Name = 'Show User Info',
        Default = Window:GetUserInfoState(),
        Callback = function(bool)
            Window:SetUserInfoState(bool)
            Window:Notify({
                Title = Window.Settings.Title,
                Description = (bool and 'Showing' or 'Redacted')
                    .. ' User Info',
                Lifetime = 5,
            })
        end,
    }),
}

local tabGroups = {
    TabGroup1 = Window:TabGroup(),
}

local tabs = {
    Main = tabGroups.TabGroup1:Tab({
        Name = 'Main',
        Image = 'rbxassetid://10734950309',
    }),
    Combat = tabGroups.TabGroup1:Tab({
        Name = 'Combat',
        Image = 'rbxassetid://10734950309',
    }),
    Visuals = tabGroups.TabGroup1:Tab({
        Name = 'Visual',
        Image = 'rbxassetid://10734950309',
    }),
    PlayerDonk = tabGroups.TabGroup1:Tab({
        Name = 'Player',
        Image = 'rbxassetid://10734950309',
    }),
    Troll = tabGroups.TabGroup1:Tab({
        Name = 'Troll',
        Image = 'rbxassetid://10734950309',
    }),
    AntiAim = tabGroups.TabGroup1:Tab({
        Name = 'Anti-Aim',
        Image = 'rbxassetid://10734950309',
    }),
    Settings = tabGroups.TabGroup1:Tab({
        Name = 'Settings',
        Image = 'rbxassetid://10734950309',
    }),
}

local sections = {
    MainSection1 = tabs.Main:Section({ Side = 'Left' }),
    AASection = tabs.AntiAim:Section({ Side = 'Left' }),
    VSection = tabs.Visuals:Section({ Side = 'Left' }),
    CSection = tabs.Combat:Section({ Side = 'Left' }),
    PlrSection = tabs.PlayerDonk:Section({ Side = 'Left' }),
    SSection = tabs.Settings:Section({ Side = 'Left' }),
    Troection = tabs.Troll:Section({ Side = 'Left' }),
}

sections.MainSection1:Header({
    Name = 'My Socials',
})

sections.PlrSection:Header({
    Name = 'Jump & Speed',
})

sections.VSection:Header({
    Name = 'Players',
})

sections.CSection:Header({
    Name = 'Sherif',
})

sections.Troection:Header({
    Name = 'FE',
})

local function findMurderer()
    -- Fallback
    for _, i in ipairs(game.Players:GetPlayers()) do
        if i.Backpack:FindFirstChild('Knife') then
            return i
        end
    end

    for _, i in ipairs(game.Players:GetPlayers()) do
        if not i.Character then
            continue
        end
        if i.Character:FindFirstChild('Knife') then
            return i
        end
    end

    if playerData then
        for player, data in playerData do
            if data.Role == 'Murderer' then
                if game.Players:FindFirstChild(player) then
                    return game.Players:FindFirstChild(player)
                end
            end
        end
    end
    return nil
end

local function findSheriff()
    -- Fallback
    for _, i in ipairs(game.Players:GetPlayers()) do
        if i.Backpack:FindFirstChild('Gun') then
            return i
        end
    end

    for _, i in ipairs(game.Players:GetPlayers()) do
        if not i.Character then
            continue
        end
        if i.Character:FindFirstChild('Gun') then
            return i
        end
    end

    if playerData then
        for player, data in playerData do
            if data.Role == 'Sheriff' then
                if game.Players:FindFirstChild(player) then
                    return game.Players:FindFirstChild(player)
                end
            end
        end
    end
    return nil
end

local function findSheriffThatsNotMe()
    -- Fallback
    for _, i in ipairs(game.Players:GetPlayers()) do
        if i == localplayer then
            continue
        end
        if i.Backpack:FindFirstChild('Gun') then
            return i
        end
    end

    for _, i in ipairs(game.Players:GetPlayers()) do
        if i == localplayer then
            continue
        end
        if not i.Character then
            continue
        end
        if i.Character:FindFirstChild('Gun') then
            return i
        end
    end

    if playerData then
        for player, data in playerData do
            if data.Role == 'Sheriff' then
                if game.Players:FindFirstChild(player) then
                    if game.Players:FindFirstChild(player) == localplayer then
                        continue
                    end
                    return game.Players:FindFirstChild(player)
                end
            end
        end
    end
    return nil
end

sections.MainSection1:Button({
    Name = 'Telegram',
    Callback = function()
        Window:Dialog({
            Title = Window.Settings.Title,
            Description = 'My telegram username.',
            Buttons = {
                {
                    Name = 'Copy',
                    Callback = function()
                        local textToCopy = 'https://t.me/deepgit' -- Замени это на нужный текст
                        local function copyToClipboard(text)
                            if setclipboard then
                                setclipboard(text)
                            else
                                warn(
                                    'Функция setclipboard не доступна'
                                )
                            end
                        end
                        copyToClipboard(textToCopy)
                        Window:Notify({
                            Title = Window.Settings.Title,
                            Description = 'Link is copied',
                            Lifetime = 5,
                        })
                    end,
                },
                {
                    Name = 'Cancel',
                },
            },
        })
    end,
})

sections.Troection:Button({
    Name = 'Jerk-Off | R15',
    Callback = function()
        Window:Dialog({
            Title = Window.Settings.Title,
            Description = '💀',
            Buttons = {
                {
                    Name = 'Execute',
                    Callback = function()
                        loadstring(
                            game:HttpGet('https://pastefy.app/YZoglOyJ/raw')
                        )()
                        Window:Notify({
                            Title = Window.Settings.Title,
                            Description = '💀💀💀',
                            Lifetime = 5,
                        })
                    end,
                },
                {
                    Name = 'Cancel',
                },
            },
        })
    end,
})

sections.SSection:Paragraph({
    Header = 'I need a rest.',
    Body = 'in the next update.',
})

sections.PlrSection:Slider({
    Name = 'Speed',
    Default = 25,
    Minimum = 0,
    Maximum = 100,
    DisplayMethod = 'Percent',
    Precision = 0,
    Callback = function(Value)
        -- LocalScript в StarterPlayerScripts
        local Players = game:GetService('Players')
        local RunService = game:GetService('RunService')

        local player = Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild('Humanoid')

        -- Установите желаемую скорость (по умолчанию 16)
        local desiredSpeed = 25 -- Измените это значение на нужную скорость

        -- Функция для установки скорости
        local function setWalkSpeed()
            if humanoid then
                humanoid.WalkSpeed = Value
            end
        end

        -- Устанавливаем скорость при появлении персонажа
        setWalkSpeed()

        -- Обновляем скорость при возрождении персонажа
        player.CharacterAdded:Connect(function(newCharacter)
            character = newCharacter
            humanoid = newCharacter:WaitForChild('Humanoid')
            setWalkSpeed()
        end)
    end,
}, 'Slider')

sections.PlrSection:Slider({
    Name = 'Jump',
    Default = 50,
    Minimum = 0,
    Maximum = 100,
    DisplayMethod = 'Percent',
    Precision = 0,
    Callback = function(Value)
        -- LocalScript в StarterPlayerScripts
        local Players = game:GetService('Players')
        local RunService = game:GetService('RunService')

        local player = Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild('Humanoid')

        -- Установите желаемую скорость (по умолчанию 16)
        local desJump = 25 -- Измените это значение на нужную скорость

        -- Функция для установки скорости
        local function setjp()
            if humanoid then
                humanoid.JumpPower = Value
            end
        end

        -- Устанавливаем скорость при появлении персонажа
        setjp()

        -- Обновляем скорость при возрождении персонажа
        player.CharacterAdded:Connect(function(newCharacter)
            character = newCharacter
            humanoid = newCharacter:WaitForChild('Humanoid')
            setjp()
        end)
    end,
}, 'Slider')

sections.PlrSection:Paragraph({
    Header = 'Warning',
    Body = 'You may be kicked under the name "Invalid Position", this can happen often. Therefore, use a speed of up to 45.',
})

sections.CSection:Keybind({
    Name = 'Shoot Murder (Not Work, use YARHM)',
    Blacklist = false,
    Callback = function(binded)
        task.spawn(function()
            while task.wait(1) do
                if findSheriff() == localplayer and autoShooting then
                    fu.notification('Auto-shooting started.')
                    repeat
                        task.wait(0.1)
                        local murderer = findMurderer()
                        if not murderer then
                            fu.notification('No murderer.')
                            continue
                        end
                        local murdererPosition =
                            murderer.Character.HumanoidRootPart.Position
                        local characterRootPart =
                            localplayer.Character.HumanoidRootPart
                        local rayDirection = murdererPosition
                            - characterRootPart.Position

                        local raycastParams = RaycastParams.new()
                        raycastParams.FilterType =
                            Enum.RaycastFilterType.Exclude
                        raycastParams.FilterDescendantsInstances =
                            { localplayer.Character }

                        local hit = workspace:Raycast(
                            characterRootPart.Position,
                            rayDirection,
                            raycastParams
                        )
                        if
                            not hit
                            or hit.Instance.Parent == murderer.Character
                        then -- Check if nothing collides or if it collides with the murderer
                            fu.notification('Auto-shooting!')
                            if
                                not localplayer.Character:FindFirstChild('Gun')
                            then
                                local hum =
                                    localplayer.Character:FindFirstChild(
                                        'Humanoid'
                                    )
                                if
                                    localplayer.Backpack:FindFirstChild('Gun')
                                then
                                    localplayer.Character
                                        :FindFirstChild('Humanoid')
                                        :EquipTool(
                                            localplayer.Backpack:FindFirstChild(
                                                'Gun'
                                            )
                                        )
                                else
                                    fu.notification("You don't have the gun..?")
                                    return
                                end
                            end
                            local murdererHRP =
                                murderer.Character:FindFirstChild(
                                    'HumanoidRootPart'
                                )
                            if not murdererHRP then
                                fu.notification(
                                    "Could not find the murderer's HumanoidRootPart."
                                )
                                return
                            end

                            local predictedPosition =
                                getPredictedPosition(murderer, shootOffset)

                            local args = {
                                [1] = 1,
                                [2] = predictedPosition,
                                [3] = 'AH2',
                            }

                            localplayer.Character.Gun.KnifeLocal.CreateBeam.RemoteFunction:InvokeServer(
                                unpack(args)
                            )
                        end
                    until findSheriff() ~= localplayer or not autoShooting
                end
            end
        end)
        Window:Notify({
            Title = 'Demo Window',
            Description = 'Successfully Binded Keybind to - '
                .. tostring(bind.Name),
            Lifetime = 3,
        })
    end,
}, 'Keybind')

sections.VSection:Toggle({
    Name = 'ESP',
    Default = false,
    Callback = function(value)
        loadstring(
            game:HttpGet(
                'https://raw.githubusercontent.com/Ihaveash0rtnamefordiscord/Releases/main/MurderMystery2HighlightESP'
            )
        )(' Watermelon ?')

        Window:Notify({
            Title = Window.Settings.Title,
            Description = (value and 'Enabled ' or 'Disabled ') .. 'ESP',
        })
    end,
}, 'Toggle')

sections.VSection:Header({
    Name = 'Aspect Ratio',
})

sections.VSection:Toggle({
    Name = 'Aspect Ratio',
    Default = false,
    Callback = function(value)
        if value then
            -- Включение ESP - устанавливаем значение 0.5
            getgenv().AspectRatio = 0.7

            -- Удаляем старый коннект если он существует
            if getgenv().AspectRatioConnection then
                getgenv().AspectRatioConnection:Disconnect()
                getgenv().AspectRatioConnection = nil
            end

            -- Создаем новый коннект с значением 0.5
            getgenv().AspectRatioConnection = game:GetService('RunService').RenderStepped
                :Connect(function()
                    local Camera = workspace.CurrentCamera
                    if Camera then
                        Camera.CFrame = Camera.CFrame
                            * CFrame.new(0, 0, 0, 1, 0, 0, 0, 0.5, 0, 0, 0, 1)
                    end
                end)
        else
            -- Выключение ESP - возвращаем исходное значение 1
            if getgenv().AspectRatioConnection then
                getgenv().AspectRatioConnection:Disconnect()
                getgenv().AspectRatioConnection = nil
            end

            -- Восстанавливаем нормальный aspect ratio (значение 1)
            local Camera = workspace.CurrentCamera
            if Camera then
                Camera.CFrame = Camera.CFrame
                    * CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
            end
        end

        getgenv().gg_scripters = 'Aori0001'
    end,
}, 'Toggle')

sections.VSection:Header({
    Name = 'World',
})

local originalSettings = {}
local connections = {}

local function saveOriginalSettings()
    local Terrain = workspace:FindFirstChildOfClass('Terrain')
    local Lighting = game:GetService('Lighting')

    if Terrain then
        originalSettings.WaterWaveSize = Terrain.WaterWaveSize
        originalSettings.WaterWaveSpeed = Terrain.WaterWaveSpeed
        originalSettings.WaterReflectance = Terrain.WaterReflectance
        originalSettings.WaterTransparency = Terrain.WaterTransparency
    end

    originalSettings.GlobalShadows = Lighting.GlobalShadows
    originalSettings.FogEnd = Lighting.FogEnd
    originalSettings.QualityLevel = settings().Rendering.QualityLevel
end

local function activateFPSBoost()
    saveOriginalSettings()

    local RunService = game:GetService('RunService')
    local Lighting = game:GetService('Lighting')
    local Terrain = workspace:FindFirstChildOfClass('Terrain')

    if Terrain then
        Terrain.WaterWaveSize = 0
        Terrain.WaterWaveSpeed = 0
        Terrain.WaterReflectance = 0
        Terrain.WaterTransparency = 0
    end

    Lighting.GlobalShadows = false
    Lighting.FogEnd = 9e9
    settings().Rendering.QualityLevel = 1

    local function optimizeObject(v)
        if
            v:IsA('Part')
            or v:IsA('UnionOperation')
            or v:IsA('MeshPart')
            or v:IsA('CornerWedgePart')
            or v:IsA('TrussPart')
        then
            v.Material = 'Plastic'
            v.Reflectance = 0
        elseif v:IsA('Decal') then
            v.Transparency = 1
        elseif v:IsA('ParticleEmitter') or v:IsA('Trail') then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA('Explosion') then
            v.BlastPressure = 1
            v.BlastRadius = 1
        end
    end

    local function disableEffect(v)
        if
            v:IsA('BlurEffect')
            or v:IsA('SunRaysEffect')
            or v:IsA('ColorCorrectionEffect')
            or v:IsA('BloomEffect')
            or v:IsA('DepthOfFieldEffect')
        then
            v.Enabled = false
        end
    end

    for i, v in pairs(game:GetDescendants()) do
        optimizeObject(v)
    end

    for i, v in pairs(Lighting:GetDescendants()) do
        disableEffect(v)
    end

    local wsConnection = workspace.DescendantAdded:Connect(function(child)
        task.wait()
        optimizeObject(child)
        if
            child:IsA('ForceField')
            or child:IsA('Sparkles')
            or child:IsA('Smoke')
            or child:IsA('Fire')
        then
            child:Destroy()
        end
    end)

    local lightConnection = Lighting.DescendantAdded:Connect(function(child)
        task.wait()
        disableEffect(child)
    end)

    connections.workspace = wsConnection
    connections.lighting = lightConnection
end

local function deactivateFPSBoost()
    local Terrain = workspace:FindFirstChildOfClass('Terrain')
    local Lighting = game:GetService('Lighting')

    -- Восстанавливаем оригинальные настройки
    if Terrain and originalSettings.WaterWaveSize then
        Terrain.WaterWaveSize = originalSettings.WaterWaveSize
        Terrain.WaterWaveSpeed = originalSettings.WaterWaveSpeed
        Terrain.WaterReflectance = originalSettings.WaterReflectance
        Terrain.WaterTransparency = originalSettings.WaterTransparency
    end

    if originalSettings.GlobalShadows then
        Lighting.GlobalShadows = originalSettings.GlobalShadows
    end

    if originalSettings.FogEnd then
        Lighting.FogEnd = originalSettings.FogEnd
    end

    if originalSettings.QualityLevel then
        settings().Rendering.QualityLevel = originalSettings.QualityLevel
    end

    -- Отключаем соединения
    if connections.workspace then
        connections.workspace:Disconnect()
        connections.workspace = nil
    end

    if connections.lighting then
        connections.lighting:Disconnect()
        connections.lighting = nil
    end
end
sections.VSection:Toggle({
    Name = 'FPS Boost',
    Default = false,
    Callback = function(value)
        if value then
            -- Активация FPS Boost
            activateFPSBoost()
        else
            -- Деактивация FPS Boost (опционально)
            deactivateFPSBoost()
        end
    end,
}, 'Toggle')

-- Переменная для хранения состояния ночного режима

-- Переменная для хранения состояния ночного режима
local isNightMode = false

-- Функция для включения ночного режима
local function activateNightMode()
    isNightMode = true

    -- Визуальные изменения для ночного режима
    game.Lighting.Ambient = Color3.fromRGB(50, 50, 80) -- Синеватый свет
    game.Lighting.Brightness = 0.3 -- Темнее
    game.Lighting.ClockTime = 22 -- Ночное время (10 вечера)
    game.Lighting.FogColor = Color3.fromRGB(30, 30, 60) -- Туман ночью
    game.Lighting.FogEnd = 500
end

local function deactivateNightMode()
    isNightMode = false

    -- Возвращаем стандартные настройки освещения
    game.Lighting.Ambient = Color3.fromRGB(125, 125, 125) -- Стандартный свет
    game.Lighting.Brightness = 1 -- Нормальная яркость
    game.Lighting.ClockTime = 14 -- Дневное время (2 дня)
    game.Lighting.FogColor = Color3.fromRGB(191, 191, 191) -- Стандартный туман
    game.Lighting.FogEnd = 100000
end

sections.VSection:Toggle({
    Name = 'Night Mode',
    Default = false,
    Callback = function(value)
        if value then
            activateNightMode()
        else
            deactivateNightMode()
        end
        Window:Notify({
            Title = Window.Settings.Title,
            Description = (value and 'Enabled ' or 'Disabled ') .. 'Night',
        })
    end,
}, 'Toggle')

sections.VSection:Paragraph({
    Header = 'Warning',
    Body = 'Perhaps there are bugs that the textures did not return. And you will have to re-join :(',
})

sections.CSection:Header({
    Name = 'Murder',
})

sections.CSection:Button({
    Name = 'Kill All ',
    Callback = function()
        Window:Dialog({
            Title = Window.Settings.Title,
            Description = 'Kill All, only if you murder.',
            Buttons = {
                {
                    Name = 'Execute',
                    Callback = function()
                        local Players = game:GetService('Players')
                        local RunService = game:GetService('RunService')

                        local function freezePlayersInOneSpot()
                            if not RunService:IsClient() then
                                return
                            end

                            local localPlayer = Players.LocalPlayer
                            if not localPlayer.Character then
                                return
                            end

                            local localRoot =
                                localPlayer.Character:FindFirstChild(
                                    'HumanoidRootPart'
                                )
                            if not localRoot then
                                return
                            end

                            local frozenPlayers = {}
                            local freezePosition = localRoot.Position
                                + localRoot.CFrame.LookVector * 5

                            for _, otherPlayer in ipairs(Players:GetPlayers()) do
                                if
                                    otherPlayer ~= localPlayer
                                    and otherPlayer.Character
                                then
                                    local humanoidRootPart =
                                        otherPlayer.Character:FindFirstChild(
                                            'HumanoidRootPart'
                                        )
                                    local humanoid =
                                        otherPlayer.Character:FindFirstChild(
                                            'Humanoid'
                                        )

                                    if humanoidRootPart and humanoid then
                                        frozenPlayers[otherPlayer] = {
                                            root = humanoidRootPart,
                                            humanoid = humanoid,
                                            originalWalkSpeed = humanoid.WalkSpeed,
                                            originalJumpPower = humanoid.JumpPower,
                                        }

                                        humanoidRootPart.Anchored = true
                                        humanoid.PlatformStand = true
                                        humanoid.WalkSpeed = 0
                                        humanoid.JumpPower = 0
                                        humanoidRootPart.CFrame =
                                            CFrame.new(freezePosition)
                                    end
                                end
                            end

                            wait(5)

                            for player, data in pairs(frozenPlayers) do
                                if data.root and data.humanoid then
                                    data.root.Anchored = false
                                    data.humanoid.PlatformStand = false
                                    data.humanoid.WalkSpeed =
                                        data.originalWalkSpeed
                                    data.humanoid.JumpPower =
                                        data.originalJumpPower
                                end
                            end
                        end

                        freezePlayersInOneSpot()
                    end,
                },
                {
                    Name = 'Cancel',
                },
            },
        })
    end,
})

sections.AASection:Slider({
    Name = 'Spin Speed',
    Default = 0,
    Minimum = 0,
    Maximum = 100,
    DisplayMethod = 'Percent',
    Precision = 0,
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        local character = player.Character
        if not character then
            return
        end

        local humanoidRootPart = character:FindFirstChild('HumanoidRootPart')
        if not humanoidRootPart then
            return
        end

        -- Удаляем старый Spin
        for i, v in pairs(humanoidRootPart:GetChildren()) do
            if v.Name == 'Spinning' then
                v:Destroy()
            end
        end

        if Value > 0 then
            -- Создаем новый Spin с текущим Value
            local Spin = Instance.new('BodyAngularVelocity')
            Spin.Name = 'Spinning'
            Spin.Parent = humanoidRootPart
            Spin.MaxTorque = Vector3.new(0, math.huge, 0)
            Spin.AngularVelocity = Vector3.new(0, Value, 0)
        end
    end,
}, 'Slider')

Window.onUnloaded(function() end)

tabs.Main:Select()
MacLib:LoadAutoLoadConfig()
