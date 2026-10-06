--[[
    DUCK DUCK TAGS // BY: TXBAT
    V6.2 - Matcha executor (Roblox)
    AutoWin AUTO: detects TAG / GOLDEN / ZOMBIE by live behavior
    Farm: collect-all -> lobby when map cleared -> auto resume
]]

if _G.DuckSuite and _G.DuckSuite.Cleanup then pcall(_G.DuckSuite.Cleanup) end

local Running = true
local Drawings = {}
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Camera = game.Workspace.CurrentCamera

local LOBBY_POINT = Vector3.new(-1544.0, 76.3, -497.8)
local MAP_Y_THRESHOLD = 70
local THREAT_RADIUS = 80
local HANDOFF_TP_INTERVAL = 0.25
local FARM_SUPPRESS_AFTER_PASS = 5

local function notify(title, text, duration)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = title or "Duck Duck Tags", Text = text or "", Duration = duration or 3 })
    end)
end

local State = {
    Minimized = false,
    EspGoose = true, EspDuck = true,
    EspBoxes = true, EspTracers = true, EspDist = true,
    InfJump = false,
    NoClip = false, Fly = false, FlySpeed = 60,
    AutoFarm = false,
    AutoWin = false,
    WinMode = "AUTO",
    StatusText = "",
}
local TAB_MAIN, TAB_ESP, TAB_MOVE = 1, 2, 3
State.ActiveTab = TAB_MAIN

local GEN = (tonumber(_G.DuckSuiteGen) or 0) + 1
_G.DuckSuiteGen = GEN
_G.DuckSuite = {
    Cleanup = function()
        Running = false
        State.Fly = false; State.NoClip = false; State.AutoWin = false
        for _, d in ipairs(Drawings) do pcall(function() d:Remove() end) end
        Drawings = {}
    end,
    State = State,
    Set = function(k, v) State[k] = v end,
    Get = function(k) return State[k] end,
}

local UI = {
    Bg = Color3.fromRGB(13, 14, 21), HeaderBg = Color3.fromRGB(18, 20, 30),
    Border = Color3.fromRGB(42, 46, 62), BorderGlow = Color3.fromRGB(147, 51, 234),
    Box = Color3.fromRGB(22, 24, 34), BoxBorder = Color3.fromRGB(40, 44, 60),
    BoxHover = Color3.fromRGB(32, 35, 48), HoverBorder = Color3.fromRGB(60, 65, 85),
    ActiveBox = Color3.fromRGB(147, 51, 234), ActiveBdr = Color3.fromRGB(192, 132, 252),
    ActiveHov = Color3.fromRGB(168, 85, 247),
    TxtMain = Color3.fromRGB(240, 243, 255), TxtSec = Color3.fromRGB(185, 190, 205),
    TxtMuted = Color3.fromRGB(130, 135, 155), TxtActive = Color3.fromRGB(255, 255, 255),
    StatusOn = Color3.fromRGB(74, 222, 128),
    Goose = Color3.fromRGB(120, 220, 255),
    Duck = Color3.fromRGB(250, 204, 21),
    Zombie = Color3.fromRGB(120, 255, 120),
    TabActive = Color3.fromRGB(40, 44, 60),
}
local UI_FONT = 2

local function WrapDraw(dType, rx, ry, rw, rh, props)
    local d = Drawing.new(dType)
    table.insert(Drawings, d)
    local w = { draw = d, rx = rx or 0, ry = ry or 0, rw = rw or 0, rh = rh or 0,
        lastX = -9999, lastY = -9999, lastW = -9999, lastH = -9999,
        lastColor = nil, lastTrans = -1, lastVis = false, lastFont = -1,
        lastRadius = -1, lastText = nil, lastFrom = nil, lastTo = nil }
    if props then
        for k, v in pairs(props) do
            d[k] = v
            if k == "Color" then w.lastColor = v
            elseif k == "Transparency" then w.lastTrans = v
            elseif k == "Visible" then w.lastVis = v
            elseif k == "Size" and type(v) == "number" then w.lastFont = v
            elseif k == "Radius" then w.lastRadius = v
            elseif k == "Text" then w.lastText = v end
        end
    end
    return w
end
local function SetPos(e, x, y) if e.lastX ~= x or e.lastY ~= y then e.lastX, e.lastY = x, y; e.draw.Position = Vector2.new(x, y) end end
local function SetSize(e, w, h) if e.lastW ~= w or e.lastH ~= h then e.lastW, e.lastH = w, h; e.draw.Size = Vector2.new(w, h) end end
local function SetColor(e, c) if e.lastColor ~= c then e.lastColor = c; e.draw.Color = c end end
local function SetVisible(e, v) if e.lastVis ~= v then e.lastVis = v; e.draw.Visible = v end end
local function SetText(e, t) if e.lastText ~= t then e.lastText = t; e.draw.Text = t end end
local function SetRadius(e, r) if math.abs(e.lastRadius - r) > 0.05 then e.lastRadius = r; e.draw.Radius = r end end
local function SetFrom(e, v) if e.lastFrom ~= v then e.lastFrom = v; e.draw.From = v end end
local function SetTo(e, v) if e.lastTo ~= v then e.lastTo = v; e.draw.To = v end end

local GW, GH = 350, 330
local MINI_W, MINI_H = 300, 34
local GuiX, GuiY, TargetX, TargetY = 60, 80, 60, 80
local isDragging = false
local dragOffX, dragOffY = 0, 0

local mainGlow   = WrapDraw("Square", -3, -3, GW + 6, GH + 6, { Filled = false, Thickness = 1.5, Color = UI.BorderGlow, Transparency = 0.65, Visible = true })
local mainBorder = WrapDraw("Square", -1, -1, GW + 2, GH + 2, { Filled = false, Thickness = 1, Rounding = 8, Color = UI.Border, Transparency = 1, Visible = true })
local mainBg     = WrapDraw("Square", 0, 0, GW, GH, { Filled = true, Rounding = 8, Color = UI.Bg, Transparency = 1, Visible = true })
local headerBg   = WrapDraw("Square", 0, 0, GW, 42, { Filled = true, Rounding = 8, Color = UI.HeaderBg, Transparency = 1, Visible = true })
local headerLine = WrapDraw("Square", 0, 42, GW, 2, { Filled = true, Color = UI.ActiveBox, Transparency = 1, Visible = true })
local statusHalo = WrapDraw("Circle", 17, 21, 0, 0, { Radius = 7, Filled = false, Thickness = 1.5, Color = UI.ActiveBdr, Transparency = 0.8, Visible = true })
local statusCore = WrapDraw("Circle", 17, 21, 0, 0, { Radius = 4, Filled = true, Color = UI.ActiveBdr, Transparency = 1, Visible = true })
local titleText  = WrapDraw("Text", 31, 12, 0, 0, { Size = 14, Font = UI_FONT, Outline = true, Color = UI.TxtMain, Text = "DUCK DUCK TAGS // TXBAT", Visible = true })
local minBtn     = WrapDraw("Text", GW - 30, 13, 0, 0, { Size = 16, Font = UI_FONT, Outline = true, Color = UI.TxtMuted, Text = "[-]", Visible = true })
local statusHdr  = WrapDraw("Text", 0, 15, 0, 0, { Size = 11, Font = UI_FONT, Outline = true, Color = UI.StatusOn, Text = "", Visible = true })

local miniGlow  = WrapDraw("Square", -2, -2, MINI_W + 4, MINI_H + 4, { Filled = false, Thickness = 1.5, Color = UI.BorderGlow, Transparency = 0.6, Visible = false })
local miniBg    = WrapDraw("Square", 0, 0, MINI_W, MINI_H, { Filled = true, Rounding = 8, Color = UI.HeaderBg, Transparency = 1, Visible = false })
local miniBrd   = WrapDraw("Square", 0, 0, MINI_W, MINI_H, { Filled = false, Thickness = 1, Rounding = 8, Color = UI.ActiveBdr, Transparency = 0.9, Visible = false })
local miniHalo  = WrapDraw("Circle", 16, 17, 0, 0, { Radius = 5, Filled = true, Color = UI.ActiveBdr, Transparency = 1, Visible = false })
local miniTitle = WrapDraw("Text", 30, 9, 0, 0, { Size = 13, Font = UI_FONT, Outline = true, Color = UI.TxtMain, Text = "DUCK DUCK TAGS // BY: TXBAT", Visible = false })
local miniPlus  = WrapDraw("Text", MINI_W - 32, 8, 0, 0, { Size = 16, Font = UI_FONT, Outline = true, Color = UI.ActiveBdr, Text = "[+]", Visible = false })

local tabNames = { [TAB_MAIN] = "MAIN", [TAB_ESP] = "ESP", [TAB_MOVE] = "MOVEMENT" }
local tabButtons = {}
local tabW = (GW - 16) / 3
for i = 1, 3 do
    local bx = 8 + (i - 1) * tabW
    local box = WrapDraw("Square", bx, 50, tabW - 4, 26, { Filled = true, Rounding = 5, Color = UI.Box, Transparency = 1, Visible = true })
    local txt = WrapDraw("Text", bx + 8, 56, 0, 0, { Size = 12, Font = UI_FONT, Outline = true, Color = UI.TxtSec, Text = tabNames[i], Visible = true })
    tabButtons[i] = { box = box, txt = txt, rx = bx, ry = 50, rw = tabW - 4, rh = 26 }
end

local Buttons = {}
local function CreateBtn(tab, opt)
    local bw = opt.w or (GW - 20)
    local bh = opt.h or 32
    local btn = {
        tab = tab, rx = opt.x or 10, ry = opt.y, rw = bw, rh = bh,
        box = WrapDraw("Square", opt.x or 10, opt.y, bw, bh, { Filled = true, Rounding = 6, Color = UI.Box, Transparency = 1, Visible = true }),
        border = WrapDraw("Square", opt.x or 10, opt.y, bw, bh, { Filled = false, Thickness = 1, Rounding = 6, Color = UI.BoxBorder, Transparency = 0.85, Visible = true }),
        label = WrapDraw("Text", (opt.x or 10) + 12, opt.y + 7, 0, 0, { Size = 13, Font = UI_FONT, Outline = true, Color = UI.TxtMain, Text = opt.text or "", Visible = true }),
        onClick = opt.onClick,
    }
    table.insert(Buttons, btn)
    return btn
end

-- shared state
local farmCurrentBread = nil
local farmLastTP = 0
local farmSuppressUntil = 0
local winPhase = "idle"       -- idle | pass | hold | hunt
local winTarget = nil
local winPhaseStart = 0
local winLastActionTP = 0
local winLastLobbyTP = 0
local winHoldTicks = 0
local detectedMode = nil
local zombieEvidence = 0
local gooseProbe = nil
local activeMode = nil

local btnInfJump = CreateBtn(TAB_MAIN, { y = 88, text = "Infinite Jump", onClick = function() State.InfJump = not State.InfJump end })
local btnFarm    = CreateBtn(TAB_MAIN, { y = 126, text = "Auto Farm Bread", onClick = function()
    State.AutoFarm = not State.AutoFarm
    farmCurrentBread = nil
    if State.AutoFarm then notify("Auto Farm", "ON", 2) end
end })
local btnWin     = CreateBtn(TAB_MAIN, { y = 164, text = "Auto Win", onClick = function()
    State.AutoWin = not State.AutoWin
    winPhase = "idle"
    winLastLobbyTP = 0
    winHoldTicks = 0
    detectedMode = nil
    zombieEvidence = 0
    gooseProbe = nil
    if State.AutoWin then notify("Auto Win", "ON - AUTO mode", 3) end
end })
local btnWinMode = CreateBtn(TAB_MAIN, { y = 202, text = "AutoWin Mode: AUTO", onClick = function()
    local order = { "AUTO", "TAG", "GOLDEN", "ZOMBIE" }
    local nextIdx = 1
    for i, m in ipairs(order) do
        if m == State.WinMode then nextIdx = (i % #order) + 1 break end
    end
    State.WinMode = order[nextIdx]
    winPhase = "idle"
    detectedMode = (State.WinMode ~= "AUTO") and State.WinMode or nil
    zombieEvidence = 0
    gooseProbe = nil
    notify("AutoWin Mode", State.WinMode, 2)
end })

local btnEspGoose = CreateBtn(TAB_ESP, { y = 88,  text = "ESP Goose / Zombie", onClick = function() State.EspGoose = not State.EspGoose end })
local btnEspDuck  = CreateBtn(TAB_ESP, { y = 126, text = "ESP Duck", onClick = function() State.EspDuck = not State.EspDuck end })
local btnEspBox   = CreateBtn(TAB_ESP, { y = 164, text = "ESP Boxes", onClick = function() State.EspBoxes = not State.EspBoxes end })
local btnEspTrc   = CreateBtn(TAB_ESP, { y = 202, text = "ESP Tracers", onClick = function() State.EspTracers = not State.EspTracers end })
local btnEspDist  = CreateBtn(TAB_ESP, { y = 240, text = "ESP Distance", onClick = function() State.EspDist = not State.EspDist end })

local btnNoclip = CreateBtn(TAB_MOVE, { y = 88, text = "NoClip", onClick = function()
    State.NoClip = not State.NoClip
    if not State.NoClip then
        local ch = LocalPlayer.Character
        if ch then for _, p in ipairs(ch:GetChildren()) do
            if p.ClassName == "Part" or p.ClassName == "MeshPart" then pcall(function() p.CanCollide = true end) end
        end end
    end
end })
local btnFly    = CreateBtn(TAB_MOVE, { y = 126, text = "Fly (WASD + Space/C)", onClick = function() State.Fly = not State.Fly end })
local btnTpNear = CreateBtn(TAB_MOVE, { y = 164, text = "TP Nearest Duck", onClick = function()
    local hr = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if hr then
        local best, bd = nil, math.huge
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character then
                local h2 = p.Character:FindFirstChild("HumanoidRootPart")
                if h2 then
                    local d = (h2.Position - hr.Position).Magnitude
                    if d < bd and d > 5 then bd = d; best = h2 end
                end
            end
        end
        if best then
            hr.CFrame = CFrame.new(best.Position.X, best.Position.Y + 3.6, best.Position.Z)
            State.StatusText = "TP -> " .. tostring(best.Parent.Name)
        end
    end
end })

local ESP_MAX = 25
local espPool = {}
for i = 1, ESP_MAX do
    espPool[i] = {
        name = WrapDraw("Text", 0, 0, 0, 0, { Size = 12, Font = UI_FONT, Outline = true, Center = true, Color = UI.TxtMain, Text = "", Visible = false }),
        box = WrapDraw("Square", 0, 0, 0, 0, { Filled = false, Thickness = 1.5, Color = UI.TxtMain, Visible = false }),
        tracer = WrapDraw("Line", 0, 0, 0, 0, { Thickness = 1, Color = UI.TxtMain, Visible = false }),
    }
end

local function charIsGoose(char)
    local g = false
    pcall(function() g = (char:GetAttribute("IsGoose") == true) end)
    return g
end

local function threatNear(pos, radius)
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            local h2 = p.Character:FindFirstChild("HumanoidRootPart")
            if h2 and charIsGoose(p.Character) then
                if (h2.Position - pos).Magnitude < radius then
                    return true, p
                end
            end
        end
    end
    return false, nil
end

local function getSpeciesInfo(char, player)
    if charIsGoose(char) then
        local zomb = false
        pcall(function()
            zomb = (player:GetAttribute("IsZombie") == true) or (player:GetAttribute("Infected") == true)
                or (char:GetAttribute("IsZombie") == true) or (char:GetAttribute("Infected") == true)
        end)
        if zomb then return "zombie", "[ZOMBIE] ", UI.Zombie end
        return "goose", "[GOOSE] ", UI.Goose
    end
    return "duck", "[DUCK] ", UI.Duck
end

local function isInLobby(pos)
    if pos.Y < MAP_Y_THRESHOLD then return false end
    local dxz = math.sqrt((pos.X - LOBBY_POINT.X)^2 + (pos.Z - LOBBY_POINT.Z)^2)
    return dxz < 120
end

local function findMapDucks()
    local ducks = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            local h2 = p.Character:FindFirstChild("HumanoidRootPart")
            if h2 and h2.Position.Y < MAP_Y_THRESHOLD and not charIsGoose(p.Character) then
                table.insert(ducks, p)
            end
        end
    end
    return ducks
end

local function findGooseHolder()
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            local h2 = p.Character:FindFirstChild("HumanoidRootPart")
            if h2 and h2.Position.Y < MAP_Y_THRESHOLD and charIsGoose(p.Character) then
                return p, h2
            end
        end
    end
    return nil, nil
end

local function countGeese()
    local n = 0
    for _, p in ipairs(Players:GetPlayers()) do
        if p.Character and charIsGoose(p.Character) then n = n + 1 end
    end
    return n
end

local function countBreads()
    local pk = game.Workspace:FindFirstChild("CurrentMap")
    pk = pk and pk:FindFirstChild("MapPickups")
    if not pk then return 0 end
    local n = 0
    for _, grpName in ipairs({ "Low", "High", "Skill" }) do
        local g = pk:FindFirstChild(grpName)
        if g then
            for _, marker in ipairs(g:GetChildren()) do
                for _, sub in ipairs(marker:GetChildren()) do
                    if sub.Name:find("Bread") then n = n + 1 break end
                end
            end
        end
    end
    return n
end

local function inRect(px, py, x, y, w, h)
    return px >= x and px <= x + w and py >= y and py <= y + h
end
local function handleTabClick(mx, my)
    for i, tb in ipairs(tabButtons) do
        if inRect(mx, my, GuiX + tb.rx, GuiY + tb.ry, tb.rw, tb.rh) then
            State.ActiveTab = i
            return true
        end
    end
    return false
end
local function handleBtnClick(mx, my)
    for _, btn in ipairs(Buttons) do
        if btn.tab == State.ActiveTab then
            if inRect(mx, my, GuiX + btn.rx, GuiY + btn.ry, btn.rw, btn.rh) then
                pcall(btn.onClick)
                return true
            end
        end
    end
    return false
end

local wasPressed = false

RunService.Heartbeat:Connect(function()
    if _G.DuckSuiteGen ~= GEN then return end
    if State.NoClip then
        local char = LocalPlayer.Character
        if char then
            for _, p in ipairs(char:GetChildren()) do
                if p.ClassName == "Part" or p.ClassName == "MeshPart" then
                    if p.CanCollide then p.CanCollide = false end
                end
            end
        end
    end
end)

RunService.RenderStepped:Connect(function()
    if _G.DuckSuiteGen ~= GEN then return end
    if not State.Fly then return end
    local char = LocalPlayer.Character
    local hr = char and char:FindFirstChild("HumanoidRootPart")
    if not hr then return end
    local cf = Camera.CFrame
    local lv, rv = cf.LookVector, cf.RightVector
    local mx, my, mz = 0, 0, 0
    if iskeypressed(0x57) or iskeypressed(119) then mx = mx + lv.X; my = my + lv.Y; mz = mz + lv.Z end
    if iskeypressed(0x53) or iskeypressed(115) then mx = mx - lv.X; my = my - lv.Y; mz = mz - lv.Z end
    if iskeypressed(0x44) or iskeypressed(100) then mx = mx + rv.X; mz = mz + rv.Z end
    if iskeypressed(0x41) or iskeypressed(97)  then mx = mx - rv.X; mz = mz - rv.Z end
    if iskeypressed(0x20) or iskeypressed(32)  then my = my + 1 end
    if iskeypressed(0x43) or iskeypressed(99)  then my = my - 1 end
    local moveSq = mx * mx + my * my + mz * mz
    if moveSq > 0 then
        local inv = 1.0 / math.sqrt(moveSq)
        local spd = State.FlySpeed
        hr.AssemblyLinearVelocity = Vector3.new(mx * inv * spd, my * inv * spd, mz * inv * spd)
    else
        hr.AssemblyLinearVelocity = Vector3.zero
    end
end)

local function findNearestBreadRoots(hr)
    local pk = game.Workspace:FindFirstChild("CurrentMap")
    pk = pk and pk:FindFirstChild("MapPickups")
    if not pk then return nil, nil end
    local best, bd = nil, math.huge
    local bestSafe, bdSafe = nil, math.huge
    for _, grpName in ipairs({ "Low", "High", "Skill" }) do
        local g = pk:FindFirstChild(grpName)
        if g then
            for _, marker in ipairs(g:GetChildren()) do
                for _, sub in ipairs(marker:GetChildren()) do
                    if sub.Name:find("Bread") then
                        local root = sub:FindFirstChild("Root")
                        if root then
                            local d = (root.Position - hr.Position).Magnitude
                            if d < bd then bd = d; best = root end
                            if State.AutoWin then
                                local threatened = threatNear(root.Position, THREAT_RADIUS)
                                if not threatened and d < bdSafe then bdSafe = d; bestSafe = root end
                            end
                        end
                        break
                    end
                end
            end
        end
    end
    return best, bestSafe
end

task.spawn(function()
    while Running do
        if _G.DuckSuiteGen ~= GEN then break end
        if State.AutoFarm then
            local paused = (State.AutoWin and activeMode == "GOLDEN")
                or (State.AutoWin and winPhase ~= "idle")
                or os.clock() < farmSuppressUntil
            if not paused then
                local char = LocalPlayer.Character
                local hr = char and char:FindFirstChild("HumanoidRootPart")
                if hr then
                    local alive = false
                    if farmCurrentBread and farmCurrentBread.Parent and farmCurrentBread.Parent.Parent then
                        alive = true
                    end
                    local now = os.clock()
                    if alive and (now - farmLastTP) < 2.5 then
                        State.StatusText = "FARM: collecting"
                    else
                        local best, bestSafe = findNearestBreadRoots(hr)
                        local target = best
                        if State.AutoWin then target = bestSafe or best end
                        if target then
                            farmCurrentBread = target
                            farmLastTP = now
                            hr.CFrame = CFrame.new(target.Position.X, target.Position.Y + 2.5, target.Position.Z)
                            State.StatusText = "FARM: next bread"
                        else
                            farmCurrentBread = nil
                            local total = countBreads()
                            if total == 0 then
                                if State.AutoWin then
                                    if not isInLobby(hr.Position) then
                                        if now - winLastLobbyTP > 5 then
                                            winLastLobbyTP = now
                                            hr.CFrame = CFrame.new(LOBBY_POINT.X, LOBBY_POINT.Y + 3.0, LOBBY_POINT.Z)
                                            State.StatusText = "FARM: map cleared - lobby"
                                        else
                                            State.StatusText = "FARM: map cleared"
                                        end
                                    else
                                        State.StatusText = "FARM: lobby - waiting respawn"
                                    end
                                else
                                    State.StatusText = "FARM: waiting respawn"
                                end
                            else
                                State.StatusText = "FARM: threat near breads"
                            end
                        end
                    end
                end
            end
        end
        task.wait(0.15)
    end
end)

task.spawn(function()
    while Running do
        if _G.DuckSuiteGen ~= GEN then break end
        if State.AutoWin then
            local char = LocalPlayer.Character
            local hr = char and char:FindFirstChild("HumanoidRootPart")
            if hr then
                local now = os.clock()
                local myIsGoose = charIsGoose(char)

                local mode
                if State.WinMode ~= "AUTO" then
                    mode = State.WinMode
                elseif detectedMode then
                    mode = detectedMode
                else
                    local n = countGeese()
                    if n >= 2 then
                        zombieEvidence = zombieEvidence + 1
                        if zombieEvidence >= 6 then
                            detectedMode = "ZOMBIE"
                            notify("AutoWin", "Modo: ZOMBIE detectado", 3)
                            mode = detectedMode
                        end
                    else
                        zombieEvidence = 0
                    end
                    if not detectedMode then
                        if myIsGoose then
                            if not gooseProbe then gooseProbe = { start = now, minDist = math.huge } end
                            local nd = math.huge
                            for _, p in ipairs(findMapDucks()) do
                                local h2 = p.Character:FindFirstChild("HumanoidRootPart")
                                if h2 then
                                    local d = (h2.Position - hr.Position).Magnitude
                                    if d < nd then nd = d end
                                end
                            end
                            if nd < gooseProbe.minDist then gooseProbe.minDist = nd end
                            if gooseProbe.minDist < 14 then
                                detectedMode = "GOLDEN"
                                notify("AutoWin", "Modo: GOLDEN detectado", 3)
                            elseif now - gooseProbe.start > 5 then
                                detectedMode = "TAG"
                                notify("AutoWin", "Modo: TAG detectado", 3)
                            end
                        end
                    end
                    mode = detectedMode
                end
                activeMode = mode

                if not myIsGoose then
                    if winPhase == "pass" or winPhase == "hold" or winPhase == "hunt" then
                        winPhase = "idle"
                        gooseProbe = nil
                    end
                    if mode == "GOLDEN" then
                        local holderP, holderHR = findGooseHolder()
                        if holderP and holderHR then
                            winPhase = "hunt"
                            if now - winLastActionTP > HANDOFF_TP_INTERVAL then
                                winLastActionTP = now
                                hr.CFrame = CFrame.new(holderHR.Position.X, holderHR.Position.Y + 1.0, holderHR.Position.Z)
                            end
                            State.StatusText = "WIN: stealing -> " .. string.sub(tostring(holderP.Name), 1, 10)
                        else
                            winPhase = "idle"
                            State.StatusText = "WIN: no holder on map"
                        end
                    elseif not State.AutoFarm then
                        if not isInLobby(hr.Position) then
                            if now - winLastLobbyTP > 4 then
                                winLastLobbyTP = now
                                hr.CFrame = CFrame.new(LOBBY_POINT.X, LOBBY_POINT.Y + 3.0, LOBBY_POINT.Z)
                                State.StatusText = "WIN: back to lobby"
                            end
                        else
                            State.StatusText = "WIN: waiting in lobby"
                        end
                    end
                else
                    if mode == "GOLDEN" then
                        if winPhase ~= "hold" then
                            winPhase = "hold"
                            winHoldTicks = 0
                        end
                        winHoldTicks = winHoldTicks + 1
                        if winHoldTicks >= 5 then
                            if not isInLobby(hr.Position) then
                                if now - winLastLobbyTP > 3 then
                                    winLastLobbyTP = now
                                    hr.CFrame = CFrame.new(LOBBY_POINT.X, LOBBY_POINT.Y + 3.0, LOBBY_POINT.Z)
                                end
                            end
                            State.StatusText = "WIN: HOLDING (lobby)"
                        else
                            State.StatusText = "WIN: confirming goose..."
                        end
                    else
                        if winPhase ~= "pass" then
                            winPhase = "pass"
                            winPhaseStart = now
                            winTarget = nil
                        end
                        local targetHR = winTarget and winTarget.Character and winTarget.Character:FindFirstChild("HumanoidRootPart")
                        if not targetHR or targetHR.Position.Y >= MAP_Y_THRESHOLD or charIsGoose(winTarget.Character) then
                            local best, bd = nil, math.huge
                            for _, p in ipairs(findMapDucks()) do
                                local h2 = p.Character:FindFirstChild("HumanoidRootPart")
                                if h2 then
                                    local d = (h2.Position - hr.Position).Magnitude
                                    if d < bd then bd = d; best = p end
                                end
                            end
                            winTarget = best
                            targetHR = best and best.Character and best.Character:FindFirstChild("HumanoidRootPart")
                        end
                        if targetHR then
                            if now - winLastActionTP > HANDOFF_TP_INTERVAL then
                                winLastActionTP = now
                                hr.CFrame = CFrame.new(targetHR.Position.X, targetHR.Position.Y + 1.0, targetHR.Position.Z)
                            end
                            State.StatusText = "WIN: passing -> " .. string.sub(tostring(winTarget.Name), 1, 10)
                        else
                            State.StatusText = "WIN: goose, no ducks on map"
                        end
                        if not charIsGoose(LocalPlayer.Character) then
                            winPhase = "idle"
                            winLastLobbyTP = now
                            farmSuppressUntil = now + FARM_SUPPRESS_AFTER_PASS
                            hr.CFrame = CFrame.new(LOBBY_POINT.X, LOBBY_POINT.Y + 3.0, LOBBY_POINT.Z)
                            State.StatusText = "WIN: passed! lobby"
                            farmCurrentBread = nil
                        end
                    end
                end
            end
        else
            activeMode = nil
        end
        task.wait(0.3)
    end
end)

RunService.RenderStepped:Connect(function()
    if _G.DuckSuiteGen ~= GEN then return end
    local now = os.clock()

    local pressed = ismouse1pressed()
    local mx, my = Mouse.X, Mouse.Y

    if pressed and not wasPressed then
        if State.Minimized then
            if inRect(mx, my, GuiX + MINI_W - 36, GuiY + 2, 34, 30) then
                State.Minimized = false
            elseif inRect(mx, my, GuiX, GuiY, MINI_W, MINI_H) then
                isDragging = true
                dragOffX, dragOffY = mx - GuiX, my - GuiY
            end
        else
            if inRect(mx, my, GuiX, GuiY, GW, 42) then
                if inRect(mx, my, GuiX + GW - 34, GuiY + 4, 30, 30) then
                    State.Minimized = true
                else
                    isDragging = true
                    dragOffX, dragOffY = mx - GuiX, my - GuiY
                end
            elseif not handleTabClick(mx, my) and not handleBtnClick(mx, my) then
                if not inRect(mx, my, GuiX, GuiY, GW, GH) then
                    if State.InfJump then
                        local char = LocalPlayer.Character
                        local hr = char and char:FindFirstChild("HumanoidRootPart")
                        if hr then
                            local vel = hr.AssemblyLinearVelocity
                            if vel.Y < 4 then
                                hr.AssemblyLinearVelocity = Vector3.new(vel.X, 55, vel.Z)
                            end
                        end
                    end
                end
            end
        end
    elseif not pressed and wasPressed then
        isDragging = false
    end
    wasPressed = pressed

    if isDragging then
        local vp = Camera.ViewportSize
        local maxW = State.Minimized and MINI_W or GW
        local maxH = State.Minimized and MINI_H or GH
        TargetX = math.clamp(mx - dragOffX, 5, math.max(10, vp.X - maxW - 5))
        TargetY = math.clamp(my - dragOffY, 5, math.max(10, vp.Y - maxH - 5))
    end
    GuiX = GuiX + (TargetX - GuiX) * 0.35
    GuiY = GuiY + (TargetY - GuiY) * 0.35
    if math.abs(TargetX - GuiX) < 0.5 then GuiX = TargetX end
    if math.abs(TargetY - GuiY) < 0.5 then GuiY = TargetY end

    local pulse = (math.sin(now * 3.2) + 1) * 0.5

    if State.Minimized then
        SetVisible(miniGlow, true);  SetPos(miniGlow, GuiX - 2, GuiY - 2);  SetSize(miniGlow, MINI_W + 4, MINI_H + 4)
        SetVisible(miniBg, true);    SetPos(miniBg, GuiX, GuiY);            SetSize(miniBg, MINI_W, MINI_H)
        SetVisible(miniBrd, true);   SetPos(miniBrd, GuiX, GuiY);           SetSize(miniBrd, MINI_W, MINI_H)
        SetVisible(miniHalo, true);  SetPos(miniHalo, GuiX + 16, GuiY + 17); SetRadius(miniHalo, 5 + pulse * 1)
        SetVisible(miniTitle, true); SetPos(miniTitle, GuiX + 30, GuiY + 9)
        SetVisible(miniPlus, true);  SetPos(miniPlus, GuiX + MINI_W - 32, GuiY + 8)
        SetVisible(mainGlow, false); SetVisible(mainBorder, false); SetVisible(mainBg, false)
        SetVisible(headerBg, false); SetVisible(headerLine, false)
        SetVisible(statusHalo, false); SetVisible(statusCore, false)
        SetVisible(titleText, false); SetVisible(minBtn, false); SetVisible(statusHdr, false)
        for _, tb in ipairs(tabButtons) do SetVisible(tb.box, false); SetVisible(tb.txt, false) end
        for _, btn in ipairs(Buttons) do
            SetVisible(btn.box, false); SetVisible(btn.border, false); SetVisible(btn.label, false)
        end
        return
    end

    SetVisible(miniGlow, false); SetVisible(miniBg, false); SetVisible(miniBrd, false)
    SetVisible(miniTitle, false); SetVisible(miniHalo, false); SetVisible(miniPlus, false)

    SetVisible(mainGlow, true);   SetPos(mainGlow, GuiX - 3, GuiY - 3);   SetSize(mainGlow, GW + 6, GH + 6)
    SetVisible(mainBorder, true); SetPos(mainBorder, GuiX - 1, GuiY - 1); SetSize(mainBorder, GW + 2, GH + 2)
    SetVisible(mainBg, true);     SetPos(mainBg, GuiX, GuiY);             SetSize(mainBg, GW, GH)
    SetVisible(headerBg, true);   SetPos(headerBg, GuiX, GuiY);           SetSize(headerBg, GW, 42)
    SetVisible(headerLine, true); SetPos(headerLine, GuiX, GuiY + 42);    SetSize(headerLine, GW, 2)
    SetVisible(statusHalo, true); SetPos(statusHalo, GuiX + 17, GuiY + 21); SetRadius(statusHalo, 7 + pulse * 1.5)
    SetVisible(statusCore, true); SetPos(statusCore, GuiX + 17, GuiY + 21); SetRadius(statusCore, 4)
    SetVisible(titleText, true);  SetPos(titleText, GuiX + 31, GuiY + 12)
    SetVisible(minBtn, true);     SetPos(minBtn, GuiX + GW - 30, GuiY + 12)
    SetColor(minBtn, UI.TxtMuted)

    SetVisible(statusHdr, true)
    local modes = {}
    if State.AutoFarm then table.insert(modes, "FARM") end
    if State.AutoWin then
        local mlabel = (State.WinMode == "AUTO" and detectedMode) and detectedMode or string.sub(State.WinMode, 1, 4)
        table.insert(modes, "WIN:" .. mlabel)
    end
    if State.Fly then table.insert(modes, "FLY") end
    local hdrTxt = table.concat(modes, "+")
    if State.StatusText ~= "" then
        hdrTxt = State.StatusText
    end
    SetText(statusHdr, string.sub(hdrTxt, 1, 22))
    SetPos(statusHdr, GuiX + GW - 160, GuiY + 15)
    if hdrTxt ~= "" then
        SetColor(statusHdr, UI.StatusOn)
    end

    for i, tb in ipairs(tabButtons) do
        local active = (State.ActiveTab == i)
        local hovered = inRect(mx, my, GuiX + tb.rx, GuiY + tb.ry, tb.rw, tb.rh)
        SetVisible(tb.box, true)
        SetPos(tb.box, GuiX + tb.rx, GuiY + tb.ry)
        SetSize(tb.box, tb.rw, tb.rh)
        SetColor(tb.box, active and UI.TabActive or (hovered and UI.BoxHover or UI.Box))
        SetVisible(tb.txt, true)
        SetPos(tb.txt, GuiX + tb.rx + 8, GuiY + tb.ry + 6)
        SetColor(tb.txt, active and UI.TxtActive or UI.TxtSec)
    end

    for _, btn in ipairs(Buttons) do
        if btn.tab == State.ActiveTab then
            local bx, by = GuiX + btn.rx, GuiY + btn.ry
            local hovered = inRect(mx, my, bx, by, btn.rw, btn.rh)
            local active = false
            if btn == btnInfJump then active = State.InfJump end
            if btn == btnFarm then active = State.AutoFarm end
            if btn == btnWin then active = State.AutoWin end
            if btn == btnEspGoose then active = State.EspGoose end
            if btn == btnEspDuck then active = State.EspDuck end
            if btn == btnEspBox then active = State.EspBoxes end
            if btn == btnEspTrc then active = State.EspTracers end
            if btn == btnEspDist then active = State.EspDist end
            if btn == btnNoclip then active = State.NoClip end
            if btn == btnFly then active = State.Fly end
            local bgCol = active and (hovered and UI.ActiveHov or UI.ActiveBox) or (hovered and UI.BoxHover or UI.Box)
            local bdrCol = active and UI.ActiveBdr or (hovered and UI.HoverBorder or UI.BoxBorder)
            SetVisible(btn.box, true); SetPos(btn.box, bx, by); SetSize(btn.box, btn.rw, btn.rh); SetColor(btn.box, bgCol)
            SetVisible(btn.border, true); SetPos(btn.border, bx, by); SetSize(btn.border, btn.rw, btn.rh); SetColor(btn.border, bdrCol)
            SetVisible(btn.label, true); SetPos(btn.label, bx + 12, by + 7); SetColor(btn.label, active and UI.TxtActive or UI.TxtMain)
        else
            SetVisible(btn.box, false); SetVisible(btn.border, false); SetVisible(btn.label, false)
        end
    end

    local modeSuffix = ""
    if State.WinMode == "AUTO" and detectedMode then modeSuffix = " (" .. detectedMode .. ")" end
    SetText(btnWinMode.label, "AutoWin Mode: " .. State.WinMode .. modeSuffix)
end)

task.spawn(function()
    while Running do
        if _G.DuckSuiteGen ~= GEN then break end
        local anyEsp = State.EspGoose or State.EspDuck
        if anyEsp then
            local camCF = Camera.CFrame
            local camPos = camCF.Position
            local camLook = camCF.LookVector
            local camRight = camCF.RightVector
            local camUp = camCF.UpVector
            local vp = Camera.ViewportSize
            local fovY = 70
            pcall(function() fovY = Camera.FieldOfView end)
            local f = (vp.Y / 2) / math.tan(math.rad(fovY) / 2)
            local cx, cy = vp.X / 2, vp.Y / 2

            local visible = {}
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character then
                    local h2 = p.Character:FindFirstChild("HumanoidRootPart")
                    if h2 then
                        local species, tag, col = getSpeciesInfo(p.Character, p)
                        local show = (species ~= "duck" and State.EspGoose)
                            or (species == "duck" and State.EspDuck)
                        if show then
                            local offset = h2.Position - camPos
                            local dist = offset.Magnitude
                            local dir = offset.Unit
                            local dot = camLook:Dot(dir)
                            if dot > 0.05 and dist > 3 then
                                local function project(worldPos)
                                    local off = worldPos - camPos
                                    local depth = camLook:Dot(off)
                                    local xN = camRight:Dot(off) / depth
                                    local yN = camUp:Dot(off) / depth
                                    return cx + xN * f, cy - yN * f
                                end
                                local hx, hy = project(h2.Position + Vector3.new(0, 3.0, 0))
                                local fx, fy = project(h2.Position - Vector3.new(0, 3.0, 0))
                                local sxCenter, syCenter = project(h2.Position)

                                if (sxCenter > -100 and sxCenter < vp.X + 100) then
                                    local top = math.min(hy, fy)
                                    local bot = math.max(hy, fy)
                                    local boxH = bot - top
                                    if boxH < 14 then boxH = 36; top = syCenter - 18; bot = syCenter + 18 end
                                    local boxW = math.max(16, boxH * 0.9)
                                    local label = tag .. p.Name
                                    if State.EspDist then label = label .. string.format(" [%.0fm]", dist) end
                                    table.insert(visible, {
                                        name = label, color = col,
                                        nx = sxCenter, ny = top - 8,
                                        bx = sxCenter - boxW / 2, by = top, bw = boxW, bh = bot - top,
                                        tx = sxCenter, ty = bot,
                                    })
                                end
                            end
                        end
                    end
                end
            end

            for i = 1, ESP_MAX do
                local slot = espPool[i]
                local v = visible[i]
                if v then
                    SetText(slot.name, v.name)
                    SetColor(slot.name, v.color)
                    SetPos(slot.name, v.nx, v.ny)
                    SetVisible(slot.name, true)
                    if State.EspBoxes then
                        SetPos(slot.box, v.bx, v.by)
                        SetSize(slot.box, v.bw, v.bh)
                        SetColor(slot.box, v.color)
                        SetVisible(slot.box, true)
                    else
                        SetVisible(slot.box, false)
                    end
                    if State.EspTracers then
                        SetFrom(slot.tracer, Vector2.new(v.tx, v.ty))
                        SetTo(slot.tracer, Vector2.new(v.tx, vp.Y))
                        SetColor(slot.tracer, v.color)
                        SetVisible(slot.tracer, true)
                    else
                        SetVisible(slot.tracer, false)
                    end
                else
                    SetVisible(slot.name, false)
                    SetVisible(slot.box, false)
                    SetVisible(slot.tracer, false)
                end
            end
        else
            for i = 1, ESP_MAX do
                SetVisible(espPool[i].name, false)
                SetVisible(espPool[i].box, false)
                SetVisible(espPool[i].tracer, false)
            end
        end
        task.wait(0.066)
    end
end)

notify("Duck Duck Tags V6.2", "AUTO detect + fast handoff + farm cycle", 4)
print("DUCK DUCK TAGS V6.2 LOADED gen=" .. tostring(GEN))
