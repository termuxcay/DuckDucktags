--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

if (_G.DuckSuite and _G.DuckSuite.Cleanup) then
	pcall(_G.DuckSuite.Cleanup);
end
local v0 = true;
local v1 = {};
local v2 = game:GetService("Players");
local v3 = game:GetService("RunService");
local v4 = v2.LocalPlayer;
local v5 = v4:GetMouse();
local v6 = game.Workspace.CurrentCamera;
local v7 = Vector3.new(-1544, 808.3 - (16 + 716), -(958.8 - 461));
local v8 = 167 - (11 + 86);
local v9 = 865 - (222 + 563);
local v10 = 0.25 - 0;
local v11 = 290 - (175 + 110);
local function v12(v102, v103, v104)
	pcall(function()
		game:GetService("StarterGui"):SetCore("SendNotification", {Title=(v102 or "Duck Duck Tags"),Text=(v103 or ""),Duration=(v104 or (6 - 3))});
	end);
end
local v13 = {Minimized=false,EspGoose=true,EspDuck=true,EspBoxes=true,EspTracers=true,EspDist=true,InfJump=false,NoClip=false,Fly=false,FlySpeed=(295 - 235),AutoFarm=false,AutoWin=false,WinMode="AUTO",StatusText=""};
local v14, v15, v16 = 1797 - (503 + 1293), 5 - 3, 2 + 1;
v13.ActiveTab = v14;
local v18 = (tonumber(_G.DuckSuiteGen) or 0) + 1 + 0;
_G.DuckSuiteGen = v18;
_G.DuckSuite = {Cleanup=function()
	local v105 = 1061 - (810 + 251);
	while true do
		if (v105 == (848 - (40 + 808))) then
			v0 = false;
			v13.Fly = false;
			v105 = 1;
		end
		if (v105 == 1) then
			v13.NoClip = false;
			v13.AutoWin = false;
			v105 = 2 + 0;
		end
		if (v105 == 2) then
			for v299, v300 in ipairs(v1) do
				pcall(function()
					v300:Remove();
				end);
			end
			v1 = {};
			break;
		end
	end
end,State=v13,Set=function(v106, v107)
	v13[v106] = v107;
end,Get=function(v109)
	return v13[v109];
end};
local v19 = {Bg=Color3.fromRGB(3 + 10, 14, 7 + 14),HeaderBg=Color3.fromRGB(17 + 1, 553 - (43 + 490), 17 + 13),Border=Color3.fromRGB(775 - (711 + 22), 177 - 131, 41 + 21),BorderGlow=Color3.fromRGB(401 - 254, 910 - (240 + 619), 57 + 177),Box=Color3.fromRGB(34 - 12, 2 + 22, 1778 - (1344 + 400)),BoxBorder=Color3.fromRGB(445 - (255 + 150), 44, 2 + 58),BoxHover=Color3.fromRGB(98 - 66, 14 + 21, 48),HoverBorder=Color3.fromRGB(48 + 12, 65, 46 + 39),ActiveBox=Color3.fromRGB(626 - (341 + 138), 14 + 37, 999 - 765),ActiveBdr=Color3.fromRGB(619 - 427, 1871 - (404 + 1335), 658 - (183 + 223)),ActiveHov=Color3.fromRGB(540 - 372, 178 - 93, 300 - 53),TxtMain=Color3.fromRGB(160 + 80, 88 + 155, 592 - (10 + 327)),TxtSec=Color3.fromRGB(185, 451 - 261, 67 + 138),TxtMuted=Color3.fromRGB(91 + 39, 473 - (118 + 220), 145 + 10),TxtActive=Color3.fromRGB(85 + 170, 704 - (108 + 341), 115 + 140),StatusOn=Color3.fromRGB(312 - 238, 1715 - (711 + 782), 245 - 117),Goose=Color3.fromRGB(589 - (270 + 199), 72 + 148, 2074 - (580 + 1239)),Duck=Color3.fromRGB(743 - 493, 196 + 8, 1 + 20),Zombie=Color3.fromRGB(120, 112 + 143, 96 + 24),TabActive=Color3.fromRGB(104 - 64, 28 + 16, 1275 - (369 + 846))};
local v20 = 1169 - (645 + 522);
local function v21(v110, v111, v112, v113, v114, v115)
	local v116 = 1790 - (1010 + 780);
	local v117;
	local v118;
	while true do
		if (v116 == 0) then
			local v266 = 0;
			while true do
				if (v266 == (1 + 0)) then
					v116 = 1 + 0;
					break;
				end
				if (0 == v266) then
					v117 = Drawing.new(v110);
					table.insert(v1, v117);
					v266 = 4 - 3;
				end
			end
		end
		if (v116 == (5 - 3)) then
			return v118;
		end
		if (v116 == (1837 - (1045 + 791))) then
			local v267 = 0 - 0;
			while true do
				if (v267 == (204 - (11 + 192))) then
					v116 = 2 - 0;
					break;
				end
				if (v267 == 0) then
					v118 = {draw=v117,rx=(v111 or (505 - (351 + 154))),ry=(v112 or (1574 - (1281 + 293))),rw=(v113 or (266 - (28 + 238))),rh=(v114 or (0 - 0)),lastX=-(22027 - 12028),lastY=-(11558 - (1381 + 178)),lastW=-9999,lastH=-(9379 + 620),lastColor=nil,lastTrans=-1,lastVis=false,lastFont=-(177 - (50 + 126)),lastRadius=-(1 + 0),lastText=nil,lastFrom=nil,lastTo=nil};
					if v115 then
						for v413, v414 in pairs(v115) do
							local v415 = 0 + 0;
							while true do
								if (v415 == (0 - 0)) then
									v117[v413] = v414;
									if (v413 == "Color") then
										v118.lastColor = v414;
									elseif (v413 == "Transparency") then
										v118.lastTrans = v414;
									elseif (v413 == "Visible") then
										v118.lastVis = v414;
									elseif ((v413 == "Size") and (type(v414) == "number")) then
										v118.lastFont = v414;
									elseif (v413 == "Radius") then
										v118.lastRadius = v414;
									elseif (v413 == "Text") then
										v118.lastText = v414;
									end
									break;
								end
							end
						end
					end
					v267 = 1 + 0;
				end
			end
		end
	end
end
local function v22(v119, v120, v121)
	if ((v119.lastX ~= v120) or (v119.lastY ~= v121)) then
		local v243 = 1413 - (1233 + 180);
		local v244;
		while true do
			if (v243 == (470 - (381 + 89))) then
				v244 = 1421 - (107 + 1314);
				while true do
					if (v244 == (0 + 0)) then
						v119.lastX, v119.lastY = v120, v121;
						v119.draw.Position = Vector2.new(v120, v121);
						break;
					end
				end
				break;
			end
		end
	end
end
local function v23(v122, v123, v124)
	if ((v122.lastW ~= v123) or (v122.lastH ~= v124)) then
		local v245 = 0;
		while true do
			if (v245 == (0 - 0)) then
				v122.lastW, v122.lastH = v123, v124;
				v122.draw.Size = Vector2.new(v123, v124);
				break;
			end
		end
	end
end
local function v24(v125, v126)
	if (v125.lastColor ~= v126) then
		local v246 = 0 + 0;
		local v247;
		while true do
			if (v246 == (0 - 0)) then
				v247 = 0 - 0;
				while true do
					if (v247 == 0) then
						v125.lastColor = v126;
						v125.draw.Color = v126;
						break;
					end
				end
				break;
			end
		end
	end
end
local function v25(v127, v128)
	if (v127.lastVis ~= v128) then
		local v248 = 1156 - (1074 + 82);
		while true do
			if (v248 == (1910 - (716 + 1194))) then
				v127.lastVis = v128;
				v127.draw.Visible = v128;
				break;
			end
		end
	end
end
local function v26(v129, v130)
	if (v129.lastText ~= v130) then
		v129.lastText = v130;
		v129.draw.Text = v130;
	end
end
local function v27(v131, v132)
	if (math.abs(v131.lastRadius - v132) > (0.05 + 0)) then
		local v251 = 0 - 0;
		while true do
			if (v251 == 0) then
				v131.lastRadius = v132;
				v131.draw.Radius = v132;
				break;
			end
		end
	end
end
local function v28(v133, v134)
	if (v133.lastFrom ~= v134) then
		local v252 = 1784 - (214 + 1570);
		local v253;
		while true do
			if (v252 == (1455 - (990 + 465))) then
				v253 = 0 + 0;
				while true do
					if (v253 == (0 - 0)) then
						v133.lastFrom = v134;
						v133.draw.From = v134;
						break;
					end
				end
				break;
			end
		end
	end
end
local function v29(v135, v136)
	if (v135.lastTo ~= v136) then
		local v254 = 0 + 0;
		while true do
			if (v254 == (0 + 0)) then
				v135.lastTo = v136;
				v135.draw.To = v136;
				break;
			end
		end
	end
end
local v30, v31 = 1377 - 1027, 2056 - (1668 + 58);
local v32, v33 = 926 - (512 + 114), 88 - 54;
local v34, v35, v36, v37 = 124 - 64, 278 - 198, 28 + 32, 15 + 65;
local v38 = false;
local v39, v40 = 433 - (279 + 154), 0;
local v41 = v21("Square", -(781 - (454 + 324)), -(3 + 0), v30 + 6, v31 + 6 + 0, {Filled=false,Thickness=(3.5 - 2),Color=v19.BorderGlow,Transparency=(1994.65 - (109 + 1885)),Visible=true});
local v42 = v21("Square", -(1470 - (1269 + 200)), -1, v30 + (3 - 1), v31 + (817 - (98 + 717)), {Filled=false,Thickness=(1 + 0),Rounding=(834 - (802 + 24)),Color=v19.Border,Transparency=(1 - 0),Visible=true});
local v43 = v21("Square", 0 - 0, 0 - 0, v30, v31, {Filled=true,Rounding=(2 + 6),Color=v19.Bg,Transparency=(1 + 0),Visible=true});
local v44 = v21("Square", 0 + 0, 0, v30, 7 + 35, {Filled=true,Rounding=(2 + 6),Color=v19.HeaderBg,Transparency=1,Visible=true});
local v45 = v21("Square", 0, 116 - 74, v30, 2, {Filled=true,Color=v19.ActiveBox,Transparency=(3 - 2),Visible=true});
local v46 = v21("Circle", 49 - 32, 8 + 13, 0 + 0, 0 + 0, {Radius=(6 + 1),Filled=false,Thickness=(2.5 - 1),Color=v19.ActiveBdr,Transparency=(0.8 + 0),Visible=true});
local v47 = v21("Circle", 17, 1454 - (797 + 636), 0, 0 - 0, {Radius=(1623 - (1427 + 192)),Filled=true,Color=v19.ActiveBdr,Transparency=(1 + 0),Visible=true});
local v48 = v21("Text", 1805 - (1111 + 663), 27 - 15, 1579 - (874 + 705), 0 + 0, {Size=(7 + 7),Font=v20,Outline=true,Color=v19.TxtMain,Text="DUCK DUCK TAGS // TXBAT",Visible=true});
local v49 = v21("Text", v30 - (356 - (192 + 134)), 1289 - (316 + 960), 0 - 0, 0 + 0, {Size=(9 + 7),Font=v20,Outline=true,Color=v19.TxtMuted,Text="[-]",Visible=true});
local v50 = v21("Text", 0, 4 + 11, 0 + 0, 0 + 0, {Size=(2 + 9),Font=v20,Outline=true,Color=v19.StatusOn,Text="",Visible=true});
local v51 = v21("Square", -(4 - 2), -(7 - 5), v32 + (555 - (83 + 468)), v33 + (1810 - (1202 + 604)), {Filled=false,Thickness=(4.5 - 3),Color=v19.BorderGlow,Transparency=(0.6 - 0),Visible=false});
local v52 = v21("Square", 0 - 0, 1541 - (718 + 823), v32, v33, {Filled=true,Rounding=(6 + 2),Color=v19.HeaderBg,Transparency=1,Visible=false});
local v53 = v21("Square", 0, 0, v32, v33, {Filled=false,Thickness=1,Rounding=(333 - (45 + 280)),Color=v19.ActiveBdr,Transparency=0.9,Visible=false});
local v54 = v21("Circle", 16 + 0, 17, 0 + 0, 0 + 0, {Radius=(10 - 5),Filled=true,Color=v19.ActiveBdr,Transparency=1,Visible=false});
local v55 = v21("Text", 17 + 13, 2 + 7, 0 - 0, 1911 - (340 + 1571), {Size=(6 + 7),Font=v20,Outline=true,Color=v19.TxtMain,Text="DUCK DUCK TAGS // BY: TXBAT",Visible=false});
local v56 = v21("Text", v32 - (1804 - (1733 + 39)), 21 - 13, 1034 - (125 + 909), 0 + 0, {Size=(1964 - (1096 + 852)),Font=v20,Outline=true,Color=v19.ActiveBdr,Text="[+]",Visible=false});
local v57 = {[v14]="MAIN",[v15]="ESP",[v16]="MOVEMENT"};
local v58 = {};
local v59 = (v30 - (47 - 31)) / (2 + 1);
for v137 = 1 - 0, 3 + 0 do
	local v138 = 512 - (409 + 103);
	local v139;
	local v140;
	local v141;
	while true do
		if (v138 == (236 - (46 + 190))) then
			v139 = (18 - 10) + ((v137 - (1 + 0)) * v59);
			v140 = v21("Square", v139, 145 - (51 + 44), v59 - 4, 8 + 18, {Filled=true,Rounding=(1322 - (1114 + 203)),Color=v19.Box,Transparency=(4 - 3),Visible=true});
			v138 = 727 - (228 + 498);
		end
		if (v138 == (1 + 0)) then
			v141 = v21("Text", v139 + (10 - 2), 31 + 25, 663 - (174 + 489), 0 - 0, {Size=(1943 - (1813 + 118)),Font=v20,Outline=true,Color=v19.TxtSec,Text=v57[v137],Visible=true});
			v58[v137] = {box=v140,txt=v141,rx=v139,ry=(37 + 13),rw=(v59 - (1909 - (830 + 1075))),rh=(550 - (303 + 221))};
			break;
		end
	end
end
local v60 = {};
local function v61(v142, v143)
	local v144 = 1269 - (231 + 1038);
	local v145;
	local v146;
	local v147;
	while true do
		if (v144 == (1 + 0)) then
			v147 = {tab=v142,rx=(v143.x or (1172 - (171 + 991))),ry=v143.y,rw=v145,rh=v146,box=v21("Square", v143.x or (869 - (464 + 395)), v143.y, v145, v146, {Filled=true,Rounding=(24 - 18),Color=v19.Box,Transparency=1,Visible=true}),border=v21("Square", v143.x or (26 - 16), v143.y, v145, v146, {Filled=false,Thickness=(2 - 1),Rounding=(5 + 1),Color=v19.BoxBorder,Transparency=(837.85 - (467 + 370)),Visible=true}),label=v21("Text", (v143.x or (35 - 25)) + 9 + 3, v143.y + (19 - 12), 0 + 0, 0 - 0, {Size=(29 - 16),Font=v20,Outline=true,Color=v19.TxtMain,Text=(v143.text or ""),Visible=true}),onClick=v143.onClick};
			table.insert(v60, v147);
			v144 = 6 - 4;
		end
		if (v144 == (1248 - (111 + 1137))) then
			v145 = v143.w or (v30 - (178 - (91 + 67)));
			v146 = v143.h or (95 - 63);
			v144 = 1 + 0;
		end
		if (v144 == (525 - (423 + 100))) then
			return v147;
		end
	end
end
local v62 = nil;
local v63 = 0 + 0;
local v64 = 0 - 0;
local v65 = "idle";
local v66 = nil;
local v67 = 0 + 0;
local v68 = 0 - 0;
local v69 = 0 + 0;
local v70 = 0 + 0;
local v71 = nil;
local v72 = 0;
local v73 = nil;
local v74 = nil;
local v75 = v61(v14, {y=(859 - (326 + 445)),text="Infinite Jump",onClick=function()
	v13.InfJump = not v13.InfJump;
end});
local v76 = v61(v14, {y=(549 - 423),text="Auto Farm Bread",onClick=function()
	v13.AutoFarm = not v13.AutoFarm;
	v62 = nil;
	if v13.AutoFarm then
		v12("Auto Farm", "ON", 4 - 2);
	end
end});
local v77 = v61(v14, {y=(365 - 201),text="Auto Win",onClick=function()
	v13.AutoWin = not v13.AutoWin;
	v65 = "idle";
	v69 = 0;
	v70 = 0 + 0;
	v71 = nil;
	v72 = 0 - 0;
	v73 = nil;
	if v13.AutoWin then
		v12("Auto Win", "ON - AUTO mode", 714 - (530 + 181));
	end
end});
local v78 = v61(v14, {y=(312 - 110),text="AutoWin Mode: AUTO",onClick=function()
	local v151 = {"AUTO","TAG","GOLDEN","ZOMBIE"};
	local v152 = 1 - 0;
	for v223, v224 in ipairs(v151) do
		if (v224 == v13.WinMode) then
			v152 = (v223 % #v151) + (2 - 1);
			break;
		end
	end
	v13.WinMode = v151[v152];
	v65 = "idle";
	v71 = ((v13.WinMode ~= "AUTO") and v13.WinMode) or nil;
	v72 = 0 - 0;
	v73 = nil;
	v12("AutoWin Mode", v13.WinMode, 5 - 3);
end});
local v79 = v61(v15, {y=(23 + 65),text="ESP Goose / Zombie",onClick=function()
	v13.EspGoose = not v13.EspGoose;
end});
local v80 = v61(v15, {y=126,text="ESP Duck",onClick=function()
	v13.EspDuck = not v13.EspDuck;
end});
local v81 = v61(v15, {y=(37 + 127),text="ESP Boxes",onClick=function()
	v13.EspBoxes = not v13.EspBoxes;
end});
local v82 = v61(v15, {y=(354 - 152),text="ESP Tracers",onClick=function()
	v13.EspTracers = not v13.EspTracers;
end});
local v83 = v61(v15, {y=240,text="ESP Distance",onClick=function()
	v13.EspDist = not v13.EspDist;
end});
local v84 = v61(v16, {y=(182 - 94),text="NoClip",onClick=function()
	local v160 = 0;
	while true do
		if ((1812 - (1293 + 519)) == v160) then
			v13.NoClip = not v13.NoClip;
			if not v13.NoClip then
				local v327 = 0 - 0;
				local v328;
				while true do
					if (v327 == (0 - 0)) then
						v328 = v4.Character;
						if v328 then
							for v433, v434 in ipairs(v328:GetChildren()) do
								if ((v434.ClassName == "Part") or (v434.ClassName == "MeshPart")) then
									pcall(function()
										v434.CanCollide = true;
									end);
								end
							end
						end
						break;
					end
				end
			end
			break;
		end
	end
end});
local v85 = v61(v16, {y=(47 + 79),text="Fly (WASD + Space/C)",onClick=function()
	v13.Fly = not v13.Fly;
end});
local v86 = v61(v16, {y=(140 + 24),text="TP Nearest Duck",onClick=function()
	local v162 = 940 - (850 + 90);
	local v163;
	while true do
		if (v162 == 0) then
			v163 = v4.Character and v4.Character:FindFirstChild("HumanoidRootPart");
			if v163 then
				local v329, v330 = nil, math.huge;
				for v355, v356 in ipairs(v2:GetPlayers()) do
					if ((v356 ~= v4) and v356.Character) then
						local v391 = 0 - 0;
						local v392;
						while true do
							if (v391 == (0 - 0)) then
								v392 = v356.Character:FindFirstChild("HumanoidRootPart");
								if v392 then
									local v456 = 0 + 0;
									local v457;
									while true do
										if ((0 - 0) == v456) then
											v457 = (v392.Position - v163.Position).Magnitude;
											if ((v457 < v330) and (v457 > (3 + 2))) then
												local v515 = 0 - 0;
												while true do
													if (v515 == (0 + 0)) then
														v330 = v457;
														v329 = v392;
														break;
													end
												end
											end
											break;
										end
									end
								end
								break;
							end
						end
					end
				end
				if v329 then
					local v372 = 0 - 0;
					while true do
						if (v372 == (0 + 0)) then
							v163.CFrame = CFrame.new(v329.Position.X, v329.Position.Y + 2.6 + 1, v329.Position.Z);
							v13.StatusText = "TP -> " .. tostring(v329.Parent.Name);
							break;
						end
					end
				end
			end
			break;
		end
	end
end});
local v87 = 267 - (6 + 236);
local v88 = {};
for v164 = 1 + 0, v87 do
	v88[v164] = {name=v21("Text", 0 + 0, 1096 - (709 + 387), 1858 - (673 + 1185), 0 - 0, {Size=(38 - 26),Font=v20,Outline=true,Center=true,Color=v19.TxtMain,Text="",Visible=false}),box=v21("Square", 0 - 0, 0 + 0, 0, 689 - (579 + 110), {Filled=false,Thickness=(1.5 + 0),Color=v19.TxtMain,Visible=false}),tracer=v21("Line", 0 - 0, 0 + 0, 0 + 0, 0 - 0, {Thickness=(1 - 0),Color=v19.TxtMain,Visible=false})};
end
local function v89(v166)
	local v167 = 1880 - (446 + 1434);
	local v168;
	while true do
		if (v167 == (1283 - (1040 + 243))) then
			v168 = false;
			pcall(function()
				v168 = v166:GetAttribute("IsGoose") == true;
			end);
			v167 = 2 - 1;
		end
		if (v167 == (1848 - (559 + 1288))) then
			return v168;
		end
	end
end
local function v90(v169, v170)
	for v225, v226 in ipairs(v2:GetPlayers()) do
		if ((v226 ~= v4) and v226.Character) then
			local v270 = 1931 - (609 + 1322);
			local v271;
			while true do
				if ((454 - (13 + 441)) == v270) then
					v271 = v226.Character:FindFirstChild("HumanoidRootPart");
					if (v271 and v89(v226.Character)) then
						if ((v271.Position - v169).Magnitude < v170) then
							return true, v226;
						end
					end
					break;
				end
			end
		end
	end
	return false, nil;
end
local function v91(v171, v172)
	local v173 = 0 - 0;
	local v174;
	while true do
		if (v173 == (0 - 0)) then
			v174 = 0 - 0;
			while true do
				if (v174 == (0 + 0)) then
					if v89(v171) then
						local v393 = 0 + 0;
						local v394;
						while true do
							if (v393 == (2 - 1)) then
								if v394 then
									return "zombie", "[ZOMBIE] ", v19.Zombie;
								end
								return "goose", "[GOOSE] ", v19.Goose;
							end
							if ((0 - 0) == v393) then
								local v435 = 0 - 0;
								while true do
									if (v435 == (1 + 0)) then
										v393 = 1 + 0;
										break;
									end
									if ((0 - 0) == v435) then
										v394 = false;
										pcall(function()
											v394 = (v172:GetAttribute("IsZombie") == true) or (v172:GetAttribute("Infected") == true) or (v171:GetAttribute("IsZombie") == true) or (v171:GetAttribute("Infected") == true);
										end);
										v435 = 1 + 0;
									end
								end
							end
						end
					end
					return "duck", "[DUCK] ", v19.Duck;
				end
			end
			break;
		end
	end
end
local function v92(v175)
	local v176 = 0 - 0;
	local v177;
	while true do
		local v227 = 0 + 0;
		while true do
			if (v227 == (0 + 0)) then
				if (v176 == (722 - (478 + 244))) then
					if (v175.Y < v8) then
						return false;
					end
					v177 = math.sqrt(((v175.X - v7.X) ^ (519 - (440 + 77))) + ((v175.Z - v7.Z) ^ (2 + 0)));
					v176 = 1 + 0;
				end
				if (v176 == (1 + 0)) then
					return v177 < 120;
				end
				break;
			end
		end
	end
end
local function v93()
	local v178 = 0 + 0;
	local v179;
	while true do
		local v228 = 0;
		while true do
			if (v228 == (0 + 0)) then
				if (v178 == (434 - (153 + 280))) then
					return v179;
				end
				if (v178 == (0 - 0)) then
					v179 = {};
					for v373, v374 in ipairs(v2:GetPlayers()) do
						if ((v374 ~= v4) and v374.Character) then
							local v416 = 0 + 0;
							local v417;
							while true do
								if (v416 == (0 - 0)) then
									v417 = v374.Character:FindFirstChild("HumanoidRootPart");
									if (v417 and (v417.Position.Y < v8) and not v89(v374.Character)) then
										table.insert(v179, v374);
									end
									break;
								end
							end
						end
					end
					v178 = 1 + 0;
				end
				break;
			end
		end
	end
end
local function v94()
	local v180 = 0;
	while true do
		if (v180 == (0 - 0)) then
			for v301, v302 in ipairs(v2:GetPlayers()) do
				if ((v302 ~= v4) and v302.Character) then
					local v357 = 0;
					local v358;
					while true do
						if (v357 == 0) then
							v358 = v302.Character:FindFirstChild("HumanoidRootPart");
							if (v358 and (v358.Position.Y < v8) and v89(v302.Character)) then
								return v302, v358;
							end
							break;
						end
					end
				end
			end
			return nil, nil;
		end
	end
end
local function v95()
	local v181 = 0 + 0;
	local v182;
	while true do
		if ((0 + 0) == v181) then
			v182 = 0 + 0;
			for v303, v304 in ipairs(v2:GetPlayers()) do
				if (v304.Character and v89(v304.Character)) then
					v182 = v182 + 1 + 0;
				end
			end
			v181 = 352 - (285 + 66);
		end
		if ((1 - 0) == v181) then
			return v182;
		end
	end
end
local function v96()
	local v183 = 0;
	local v184;
	local v185;
	while true do
		local v229 = 0 + 0;
		while true do
			if (v229 == (667 - (89 + 578))) then
				if (v183 == (2 + 0)) then
					for v375, v376 in ipairs({"Low","High","Skill"}) do
						local v377 = 269 - (239 + 30);
						local v378;
						while true do
							if (v377 == (0 + 0)) then
								v378 = v184:FindFirstChild(v376);
								if v378 then
									for v458, v459 in ipairs(v378:GetChildren()) do
										for v467, v468 in ipairs(v459:GetChildren()) do
											if v468.Name:find("Bread") then
												v185 = v185 + 1 + 0;
												break;
											end
										end
									end
								end
								break;
							end
						end
					end
					return v185;
				end
				if (v183 == (0 - 0)) then
					v184 = game.Workspace:FindFirstChild("CurrentMap");
					v184 = v184 and v184:FindFirstChild("MapPickups");
					v183 = 1;
				end
				v229 = 1;
			end
			if (v229 == (2 - 1)) then
				if (v183 == (316 - (306 + 9))) then
					if not v184 then
						return 0;
					end
					v185 = 0 + 0;
					v183 = 6 - 4;
				end
				break;
			end
		end
	end
end
local function v97(v186, v187, v188, v189, v190, v191)
	return (v186 >= v188) and (v186 <= (v188 + v190)) and (v187 >= v189) and (v187 <= (v189 + v191));
end
local function v98(v192, v193)
	local v194 = 0;
	while true do
		if (v194 == (0 + 0)) then
			for v305, v306 in ipairs(v58) do
				if v97(v192, v193, v34 + v306.rx, v35 + v306.ry, v306.rw, v306.rh) then
					local v359 = 0 + 0;
					local v360;
					while true do
						if (v359 == (86 - (84 + 2))) then
							v360 = 0 - 0;
							while true do
								if (v360 == (0 - 0)) then
									local v447 = 0 + 0;
									while true do
										if (v447 == (842 - (497 + 345))) then
											v13.ActiveTab = v305;
											return true;
										end
									end
								end
							end
							break;
						end
					end
				end
			end
			return false;
		end
	end
end
local function v99(v195, v196)
	local v197 = 0 + 0;
	while true do
		if (v197 == (0 + 0)) then
			for v307, v308 in ipairs(v60) do
				if (v308.tab == v13.ActiveTab) then
					if v97(v195, v196, v34 + v308.rx, v35 + v308.ry, v308.rw, v308.rh) then
						local v395 = 1333 - (605 + 728);
						local v396;
						while true do
							if (v395 == (0 + 0)) then
								v396 = 0 + 0;
								while true do
									if (v396 == (0 - 0)) then
										local v469 = 0 + 0;
										while true do
											if ((0 - 0) == v469) then
												pcall(v308.onClick);
												return true;
											end
										end
									end
								end
								break;
							end
						end
					end
				end
			end
			return false;
		end
	end
end
local v100 = false;
v3.Heartbeat:Connect(function()
	local v198 = 0 - 0;
	while true do
		if (v198 == (0 + 0)) then
			if (_G.DuckSuiteGen ~= v18) then
				return;
			end
			if v13.NoClip then
				local v331 = 689 - (586 + 103);
				local v332;
				while true do
					if ((0 - 0) == v331) then
						v332 = v4.Character;
						if v332 then
							for v436, v437 in ipairs(v332:GetChildren()) do
								if ((v437.ClassName == "Part") or (v437.ClassName == "MeshPart")) then
									if v437.CanCollide then
										v437.CanCollide = false;
									end
								end
							end
						end
						break;
					end
				end
			end
			break;
		end
	end
end);
v3.RenderStepped:Connect(function()
	local v199 = 0 + 0;
	local v200;
	local v201;
	local v202;
	local v203;
	local v204;
	local v205;
	local v206;
	local v207;
	local v208;
	while true do
		if ((1 + 1) == v199) then
			v203, v204 = v202.LookVector, v202.RightVector;
			v205, v206, v207 = 0 - 0, 489 - (457 + 32), 1488 - (1309 + 179);
			if (iskeypressed(37 + 50) or iskeypressed(1521 - (832 + 570))) then
				local v333 = 0 + 0;
				local v334;
				while true do
					if (v333 == 0) then
						v334 = 0 + 0;
						while true do
							if (v334 == (3 - 2)) then
								v207 = v207 + v203.Z;
								break;
							end
							if ((0 + 0) == v334) then
								v205 = v205 + v203.X;
								v206 = v206 + v203.Y;
								v334 = 797 - (588 + 208);
							end
						end
						break;
					end
				end
			end
			v199 = 3;
		end
		if (v199 == 1) then
			local v274 = 0 - 0;
			while true do
				if (v274 == (1800 - (884 + 916))) then
					v201 = v200 and v200:FindFirstChild("HumanoidRootPart");
					if not v201 then
						return;
					end
					v274 = 1 - 0;
				end
				if (v274 == (1 + 0)) then
					v202 = v6.CFrame;
					v199 = 2;
					break;
				end
			end
		end
		if (v199 == (656 - (232 + 421))) then
			if (iskeypressed(1972 - (1569 + 320)) or iskeypressed(360 - 245)) then
				v205 = v205 - v203.X;
				v206 = v206 - v203.Y;
				v207 = v207 - v203.Z;
			end
			if (iskeypressed(17 + 51) or iskeypressed(19 + 81)) then
				local v335 = 0 - 0;
				while true do
					if (v335 == (605 - (316 + 289))) then
						v205 = v205 + v204.X;
						v207 = v207 + v204.Z;
						break;
					end
				end
			end
			if (iskeypressed(58 + 7) or iskeypressed(253 - 156)) then
				local v336 = 0 + 0;
				while true do
					if (v336 == 0) then
						v205 = v205 - v204.X;
						v207 = v207 - v204.Z;
						break;
					end
				end
			end
			v199 = 1457 - (666 + 787);
		end
		if (v199 == (430 - (360 + 65))) then
			if (v208 > (0 + 0)) then
				local v337 = 0 + 0;
				local v338;
				local v339;
				local v340;
				while true do
					if (v337 == (254 - (79 + 175))) then
						v338 = 0 - 0;
						v339 = nil;
						v337 = 3 - 2;
					end
					if ((1 + 0) == v337) then
						v340 = nil;
						while true do
							if (v338 == (0 - 0)) then
								v339 = (1 - 0) / math.sqrt(v208);
								v340 = v13.FlySpeed;
								v338 = 1 + 0;
							end
							if (v338 == (1 + 0)) then
								v201.AssemblyLinearVelocity = Vector3.new(v205 * v339 * v340, v206 * v339 * v340, v207 * v339 * v340);
								break;
							end
						end
						break;
					end
				end
			else
				v201.AssemblyLinearVelocity = Vector3.zero;
			end
			break;
		end
		if (v199 == (0 - 0)) then
			if (_G.DuckSuiteGen ~= v18) then
				return;
			end
			if not v13.Fly then
				return;
			end
			v200 = v4.Character;
			v199 = 359 - (237 + 121);
		end
		if (v199 == (903 - (503 + 396))) then
			if (iskeypressed(929 - (525 + 372)) or iskeypressed(213 - (92 + 89))) then
				v206 = v206 + (1 - 0);
			end
			if (iskeypressed(219 - 152) or iskeypressed(51 + 48)) then
				v206 = v206 - (778 - (643 + 134));
			end
			v208 = (v205 * v205) + (v206 * v206) + (v207 * v207);
			v199 = 2 + 3;
		end
	end
end);
local function v101(v209)
	local v210 = game.Workspace:FindFirstChild("CurrentMap");
	v210 = v210 and v210:FindFirstChild("MapPickups");
	if not v210 then
		return nil, nil;
	end
	local v211, v212 = nil, math.huge;
	local v213, v214 = nil, math.huge;
	for v230, v231 in ipairs({"Low","High","Skill"}) do
		local v232 = 0 - 0;
		local v233;
		while true do
			if ((0 - 0) == v232) then
				v233 = v210:FindFirstChild(v231);
				if v233 then
					for v379, v380 in ipairs(v233:GetChildren()) do
						for v398, v399 in ipairs(v380:GetChildren()) do
							if v399.Name:find("Bread") then
								local v429 = v399:FindFirstChild("Root");
								if v429 then
									local v448 = 0 + 0;
									local v449;
									while true do
										if (v448 == (1 - 0)) then
											if v13.AutoWin then
												local v501 = 0;
												local v502;
												while true do
													if (v501 == (0 + 0)) then
														v502 = v90(v429.Position, v9);
														if (not v502 and (v449 < v214)) then
															local v542 = 0 - 0;
															while true do
																if (v542 == 0) then
																	v214 = v449;
																	v213 = v429;
																	break;
																end
															end
														end
														break;
													end
												end
											end
											break;
										end
										if (v448 == (0 - 0)) then
											v449 = (v429.Position - v209.Position).Magnitude;
											if (v449 < v212) then
												v212 = v449;
												v211 = v429;
											end
											v448 = 720 - (316 + 403);
										end
									end
								end
								break;
							end
						end
					end
				end
				break;
			end
		end
	end
	return v211, v213;
end
task.spawn(function()
	while v0 do
		if (_G.DuckSuiteGen ~= v18) then
			break;
		end
		if v13.AutoFarm then
			local v276 = (v13.AutoWin and (v74 == "GOLDEN")) or (v13.AutoWin and (v65 ~= "idle")) or (os.clock() < v64);
			if not v276 then
				local v343 = 0 + 0;
				local v344;
				local v345;
				while true do
					if (v343 == (0 - 0)) then
						v344 = v4.Character;
						v345 = v344 and v344:FindFirstChild("HumanoidRootPart");
						v343 = 1245 - (485 + 759);
					end
					if (v343 == 1) then
						if v345 then
							local v430 = 0 - 0;
							local v431;
							local v432;
							while true do
								if (v430 == 1) then
									v432 = os.clock();
									if (v431 and ((v432 - v63) < (1191.5 - (442 + 747)))) then
										v13.StatusText = "FARM: collecting";
									else
										local v486 = 0;
										local v487;
										local v488;
										local v489;
										while true do
											if ((0 - 0) == v486) then
												local v516 = 1135 - (832 + 303);
												while true do
													if (v516 == (0 + 0)) then
														v487, v488 = v101(v345);
														v489 = v487;
														v516 = 947 - (88 + 858);
													end
													if (v516 == (1 + 0)) then
														v486 = 1;
														break;
													end
												end
											end
											if (v486 == (1 + 0)) then
												if v13.AutoWin then
													v489 = v488 or v487;
												end
												if v489 then
													local v533 = 0 - 0;
													while true do
														if (v533 == (1 - 0)) then
															v345.CFrame = CFrame.new(v489.Position.X, v489.Position.Y + 1.5 + 1, v489.Position.Z);
															v13.StatusText = "FARM: next bread";
															break;
														end
														if (v533 == (0 - 0)) then
															v62 = v489;
															v63 = v432;
															v533 = 790 - (766 + 23);
														end
													end
												else
													local v534 = 0 - 0;
													local v535;
													while true do
														if (v534 == (2 - 1)) then
															if (v535 == (0 - 0)) then
																if v13.AutoWin then
																	if not v92(v345.Position) then
																		if ((v432 - v69) > (13 - 8)) then
																			local v574 = 0 - 0;
																			while true do
																				if (v574 == (1073 - (1036 + 37))) then
																					v69 = v432;
																					v345.CFrame = CFrame.new(v7.X, v7.Y + 3 + 0, v7.Z);
																					v574 = 2 - 1;
																				end
																				if (v574 == (1 - 0)) then
																					v13.StatusText = "FARM: map cleared - lobby";
																					break;
																				end
																			end
																		else
																			v13.StatusText = "FARM: map cleared";
																		end
																	else
																		v13.StatusText = "FARM: lobby - waiting respawn";
																	end
																else
																	v13.StatusText = "FARM: waiting respawn";
																end
															else
																v13.StatusText = "FARM: threat near breads";
															end
															break;
														end
														if (v534 == (0 + 0)) then
															v62 = nil;
															v535 = v96();
															v534 = 1 + 0;
														end
													end
												end
												break;
											end
										end
									end
									break;
								end
								if (v430 == (1480 - (641 + 839))) then
									v431 = false;
									if (v62 and v62.Parent and v62.Parent.Parent) then
										v431 = true;
									end
									v430 = 914 - (910 + 3);
								end
							end
						end
						break;
					end
				end
			end
		end
		task.wait(0.15 - 0);
	end
end);
task.spawn(function()
	while v0 do
		if (_G.DuckSuiteGen ~= v18) then
			break;
		end
		if v13.AutoWin then
			local v277 = v4.Character;
			local v278 = v277 and v277:FindFirstChild("HumanoidRootPart");
			if v278 then
				local v346 = os.clock();
				local v347 = v89(v277);
				local v348;
				if (v13.WinMode ~= "AUTO") then
					v348 = v13.WinMode;
				elseif v71 then
					v348 = v71;
				else
					local v418 = 1684 - (1466 + 218);
					local v419;
					while true do
						if (v418 == (0 + 0)) then
							v419 = v95();
							if (v419 >= 2) then
								local v470 = 1148 - (556 + 592);
								local v471;
								while true do
									if (v470 == (0 + 0)) then
										v471 = 808 - (329 + 479);
										while true do
											if (v471 == (0 + 0)) then
												v72 = v72 + (855 - (174 + 680));
												if (v72 >= (20 - 14)) then
													local v543 = 0 - 0;
													while true do
														if (v543 == (1 + 0)) then
															v348 = v71;
															break;
														end
														if (v543 == (1696 - (561 + 1135))) then
															v71 = "ZOMBIE";
															v12("AutoWin", "Modo: ZOMBIE detectado", 742 - (396 + 343));
															v543 = 3 - 2;
														end
													end
												end
												break;
											end
										end
										break;
									end
								end
							else
								v72 = 0 + 0;
							end
							v418 = 1;
						end
						if (v418 == (2 - 1)) then
							if not v71 then
								if v347 then
									if not v73 then
										v73 = {start=v346,minDist=math.huge};
									end
									local v497 = math.huge;
									for v503, v504 in ipairs(v93()) do
										local v505 = 1477 - (29 + 1448);
										local v506;
										while true do
											if (v505 == (0 - 0)) then
												v506 = v504.Character:FindFirstChild("HumanoidRootPart");
												if v506 then
													local v544 = 0;
													local v545;
													while true do
														if (v544 == (1389 - (135 + 1254))) then
															v545 = (v506.Position - v278.Position).Magnitude;
															if (v545 < v497) then
																v497 = v545;
															end
															break;
														end
													end
												end
												break;
											end
										end
									end
									if (v497 < v73.minDist) then
										v73.minDist = v497;
									end
									if (v73.minDist < (52 - 38)) then
										local v518 = 0 - 0;
										while true do
											if (v518 == 0) then
												v71 = "GOLDEN";
												v12("AutoWin", "Modo: GOLDEN detectado", 2 + 1);
												break;
											end
										end
									elseif ((v346 - v73.start) > (13 - 8)) then
										v71 = "TAG";
										v12("AutoWin", "Modo: TAG detectado", 5 - 2);
									end
								end
							end
							v348 = v71;
							break;
						end
					end
				end
				v74 = v348;
				if not v347 then
					local v382 = 1527 - (389 + 1138);
					while true do
						if (v382 == (574 - (102 + 472))) then
							if ((v65 == "pass") or (v65 == "hold") or (v65 == "hunt")) then
								local v450 = 0 - 0;
								while true do
									if (v450 == (0 + 0)) then
										v65 = "idle";
										v73 = nil;
										break;
									end
								end
							end
							if (v348 == "GOLDEN") then
								local v451, v452 = v94();
								if (v451 and v452) then
									local v472 = 0 + 0;
									while true do
										if (v472 == 1) then
											v13.StatusText = "WIN: stealing -> " .. string.sub(tostring(v451.Name), 1 + 0, 10);
											break;
										end
										if (v472 == (0 - 0)) then
											v65 = "hunt";
											if ((v346 - v68) > v10) then
												local v530 = 1545 - (320 + 1225);
												while true do
													if (v530 == (0 - 0)) then
														v68 = v346;
														v278.CFrame = CFrame.new(v452.Position.X, v452.Position.Y + 1, v452.Position.Z);
														break;
													end
												end
											end
											v472 = 2 - 1;
										end
									end
								else
									v65 = "idle";
									v13.StatusText = "WIN: no holder on map";
								end
							elseif not v13.AutoFarm then
								if not v92(v278.Position) then
									if ((v346 - v69) > (6 - 2)) then
										v69 = v346;
										v278.CFrame = CFrame.new(v7.X, v7.Y + 2 + 1, v7.Z);
										v13.StatusText = "WIN: back to lobby";
									end
								else
									v13.StatusText = "WIN: waiting in lobby";
								end
							end
							break;
						end
					end
				elseif (v348 == "GOLDEN") then
					local v420 = 0;
					while true do
						if ((1464 - (157 + 1307)) == v420) then
							if (v65 ~= "hold") then
								local v474 = 1859 - (821 + 1038);
								while true do
									if (v474 == (0 - 0)) then
										v65 = "hold";
										v70 = 1311 - (430 + 881);
										break;
									end
								end
							end
							v70 = v70 + 1 + 0;
							v420 = 1 + 0;
						end
						if (v420 == (1 - 0)) then
							if (v70 >= (2 + 3)) then
								local v475 = 0 - 0;
								while true do
									if (v475 == (0 - 0)) then
										if not v92(v278.Position) then
											if ((v346 - v69) > 3) then
												local v539 = 1026 - (834 + 192);
												local v540;
												while true do
													if (v539 == (0 - 0)) then
														v540 = 0 + 0;
														while true do
															if (v540 == (0 + 0)) then
																v69 = v346;
																v278.CFrame = CFrame.new(v7.X, v7.Y + 1 + 2, v7.Z);
																break;
															end
														end
														break;
													end
												end
											end
										end
										v13.StatusText = "WIN: HOLDING (lobby)";
										break;
									end
								end
							else
								v13.StatusText = "WIN: confirming goose...";
							end
							break;
						end
					end
				else
					local v421 = 0 - 0;
					local v422;
					while true do
						if (v421 == (304 - (300 + 4))) then
							if (v65 ~= "pass") then
								v65 = "pass";
								v67 = v346;
								v66 = nil;
							end
							v422 = v66 and v66.Character and v66.Character:FindFirstChild("HumanoidRootPart");
							v421 = 1 + 0;
						end
						if (v421 == (5 - 3)) then
							if not v89(v4.Character) then
								local v477 = 362 - (112 + 250);
								while true do
									if ((0 + 0) == v477) then
										v65 = "idle";
										v69 = v346;
										v477 = 2 - 1;
									end
									if (v477 == (1 + 0)) then
										v64 = v346 + v11;
										v278.CFrame = CFrame.new(v7.X, v7.Y + 2 + 1, v7.Z);
										v477 = 2 + 0;
									end
									if (v477 == 2) then
										v13.StatusText = "WIN: passed! lobby";
										v62 = nil;
										break;
									end
								end
							end
							break;
						end
						if (v421 == (1 + 0)) then
							if (not v422 or (v422.Position.Y >= v8) or v89(v66.Character)) then
								local v478, v479 = nil, math.huge;
								for v490, v491 in ipairs(v93()) do
									local v492 = 0 + 0;
									local v493;
									while true do
										if (v492 == (1414 - (1001 + 413))) then
											v493 = v491.Character:FindFirstChild("HumanoidRootPart");
											if v493 then
												local v536 = 0 - 0;
												local v537;
												while true do
													if (v536 == (882 - (244 + 638))) then
														v537 = (v493.Position - v278.Position).Magnitude;
														if (v537 < v479) then
															local v568 = 693 - (627 + 66);
															while true do
																if (v568 == (0 - 0)) then
																	v479 = v537;
																	v478 = v491;
																	break;
																end
															end
														end
														break;
													end
												end
											end
											break;
										end
									end
								end
								v66 = v478;
								v422 = v478 and v478.Character and v478.Character:FindFirstChild("HumanoidRootPart");
							end
							if v422 then
								local v480 = 602 - (512 + 90);
								while true do
									if (v480 == (1906 - (1665 + 241))) then
										if ((v346 - v68) > v10) then
											local v531 = 717 - (373 + 344);
											while true do
												if (v531 == (0 + 0)) then
													v68 = v346;
													v278.CFrame = CFrame.new(v422.Position.X, v422.Position.Y + 1 + 0, v422.Position.Z);
													break;
												end
											end
										end
										v13.StatusText = "WIN: passing -> " .. string.sub(tostring(v66.Name), 1504 - (1395 + 108), 26 - 16);
										break;
									end
								end
							else
								v13.StatusText = "WIN: goose, no ducks on map";
							end
							v421 = 2 - 0;
						end
					end
				end
			end
		else
			v74 = nil;
		end
		task.wait(1204.3 - (7 + 1197));
	end
end);
v3.RenderStepped:Connect(function()
	if (_G.DuckSuiteGen ~= v18) then
		return;
	end
	local v215 = os.clock();
	local v216 = ismouse1pressed();
	local v217, v218 = v5.X, v5.Y;
	if (v216 and not v100) then
		if v13.Minimized then
			if v97(v217, v218, (v34 + v32) - (1135 - (35 + 1064)), v35 + 1 + 1, 25 + 9, 64 - 34) then
				v13.Minimized = false;
			elseif v97(v217, v218, v34, v35, v32, v33) then
				local v401 = 0 + 0;
				while true do
					if (v401 == (1236 - (298 + 938))) then
						v38 = true;
						v39, v40 = v217 - v34, v218 - v35;
						break;
					end
				end
			end
		elseif v97(v217, v218, v34, v35, v30, 1301 - (233 + 1026)) then
			if v97(v217, v218, (v34 + v30) - (1700 - (636 + 1030)), v35 + 3 + 1, 30 + 0, 169 - (43 + 96)) then
				v13.Minimized = true;
			else
				v38 = true;
				v39, v40 = v217 - v34, v218 - v35;
			end
		elseif (not v98(v217, v218) and not v99(v217, v218)) then
			if not v97(v217, v218, v34, v35, v30, v31) then
				if v13.InfJump then
					local v453 = 0;
					local v454;
					local v455;
					while true do
						if (0 == v453) then
							local v494 = 0 + 0;
							while true do
								if (v494 == (1 + 0)) then
									v453 = 1;
									break;
								end
								if (v494 == (221 - (55 + 166))) then
									v454 = v4.Character;
									v455 = v454 and v454:FindFirstChild("HumanoidRootPart");
									v494 = 1 + 0;
								end
							end
						end
						if (v453 == (1 + 0)) then
							if v455 then
								local v512 = 0 + 0;
								local v513;
								while true do
									if (v512 == 0) then
										v513 = v455.AssemblyLinearVelocity;
										if (v513.Y < (15 - 11)) then
											v455.AssemblyLinearVelocity = Vector3.new(v513.X, 352 - (36 + 261), v513.Z);
										end
										break;
									end
								end
							end
							break;
						end
					end
				end
			end
		end
	elseif (not v216 and v100) then
		v38 = false;
	end
	v100 = v216;
	if v38 then
		local v255 = 0 - 0;
		local v256;
		local v257;
		local v258;
		while true do
			if (v255 == (1369 - (34 + 1334))) then
				local v349 = 0 + 0;
				while true do
					if (v349 == (1 + 0)) then
						v255 = 1285 - (1035 + 248);
						break;
					end
					if (v349 == (21 - (20 + 1))) then
						v258 = (v13.Minimized and v33) or v31;
						v36 = math.clamp(v217 - v39, 3 + 2, math.max(329 - (134 + 185), (v256.X - v257) - (1138 - (549 + 584))));
						v349 = 973 - (357 + 615);
					end
				end
			end
			if (v255 == (685 - (314 + 371))) then
				v256 = v6.ViewportSize;
				v257 = (v13.Minimized and v32) or v30;
				v255 = 2 - 1;
			end
			if (v255 == (6 - 4)) then
				v37 = math.clamp(v218 - v40, 973 - (478 + 490), math.max(6 + 4, (v256.Y - v258) - 5));
				break;
			end
		end
	end
	v34 = v34 + ((v36 - v34) * 0.35);
	v35 = v35 + ((v37 - v35) * (1172.35 - (786 + 386)));
	if (math.abs(v36 - v34) < (0.5 - 0)) then
		v34 = v36;
	end
	if (math.abs(v37 - v35) < (1379.5 - (1055 + 324))) then
		v35 = v37;
	end
	local v219 = (math.sin(v215 * (1343.2 - (1093 + 247))) + 1 + 0) * (0.5 + 0);
	if v13.Minimized then
		local v259 = 0 - 0;
		while true do
			if (9 == v259) then
				local v351 = 0 - 0;
				while true do
					if (v351 == (0 - 0)) then
						for v423, v424 in ipairs(v60) do
							local v425 = 0 - 0;
							local v426;
							while true do
								if (v425 == (0 + 0)) then
									v426 = 0 - 0;
									while true do
										if (v426 == 0) then
											v25(v424.box, false);
											v25(v424.border, false);
											v426 = 3 - 2;
										end
										if (v426 == (96 - (9 + 86))) then
											v25(v424.label, false);
											break;
										end
									end
									break;
								end
							end
						end
						return;
					end
				end
			end
			if (v259 == 6) then
				v25(v43, false);
				v25(v44, false);
				v25(v45, false);
				v259 = 428 - (275 + 146);
			end
			if (v259 == (2 + 0)) then
				v25(v53, true);
				v22(v53, v34, v35);
				v23(v53, v32, v33);
				v259 = 7 - 4;
			end
			if (v259 == (696 - (364 + 324))) then
				v25(v49, false);
				v25(v50, false);
				for v363, v364 in ipairs(v58) do
					local v365 = 0 - 0;
					while true do
						if ((64 - (29 + 35)) == v365) then
							v25(v364.box, false);
							v25(v364.txt, false);
							break;
						end
					end
				end
				v259 = 21 - 12;
			end
			if (v259 == (2 + 3)) then
				v22(v56, (v34 + v32) - (141 - 109), v35 + 6 + 2);
				v25(v41, false);
				v25(v42, false);
				v259 = 1018 - (53 + 959);
			end
			if (v259 == (4 - 3)) then
				v25(v52, true);
				v22(v52, v34, v35);
				v23(v52, v32, v33);
				v259 = 2 - 0;
			end
			if ((288 - (147 + 138)) == v259) then
				local v352 = 899 - (813 + 86);
				while true do
					if (v352 == 0) then
						v25(v54, true);
						v22(v54, v34 + 16, v35 + 16 + 1);
						v352 = 1;
					end
					if ((1 - 0) == v352) then
						v27(v54, (497 - (18 + 474)) + (v219 * (1 + 0)));
						v259 = 12 - 8;
						break;
					end
				end
			end
			if ((21 - 14) == v259) then
				local v353 = 303 - (121 + 182);
				while true do
					if (v353 == (1268 - (1249 + 19))) then
						v25(v46, false);
						v25(v47, false);
						v353 = 1 + 0;
					end
					if (v353 == (3 - 2)) then
						v25(v48, false);
						v259 = 1094 - (686 + 400);
						break;
					end
				end
			end
			if (v259 == (0 + 0)) then
				v25(v51, true);
				v22(v51, v34 - (231 - (73 + 156)), v35 - 2);
				v23(v51, v32 + (1974 - (49 + 1921)), v33 + 1 + 3);
				v259 = 1;
			end
			if (v259 == (815 - (721 + 90))) then
				local v354 = 0 + 0;
				while true do
					if (v354 == (0 - 0)) then
						v25(v55, true);
						v22(v55, v34 + (97 - 67), v35 + (479 - (224 + 246)));
						v354 = 1;
					end
					if ((1 + 0) == v354) then
						v25(v56, true);
						v259 = 8 - 3;
						break;
					end
				end
			end
		end
	end
	v25(v51, false);
	v25(v52, false);
	v25(v53, false);
	v25(v55, false);
	v25(v54, false);
	v25(v56, false);
	v25(v41, true);
	v22(v41, v34 - (8 - 5), v35 - (5 - 2));
	v23(v41, v30 + 6, v31 + 2 + 4);
	v25(v42, true);
	v22(v42, v34 - (1444 - (496 + 947)), v35 - (1 + 0));
	v23(v42, v30 + 2 + 0, v31 + (3 - 1));
	v25(v43, true);
	v22(v43, v34, v35);
	v23(v43, v30, v31);
	v25(v44, true);
	v22(v44, v34, v35);
	v23(v44, v30, 42);
	v25(v45, true);
	v22(v45, v34, v35 + (1400 - (1233 + 125)));
	v23(v45, v30, 2);
	v25(v46, true);
	v22(v46, v34 + (56 - 39), v35 + (534 - (203 + 310)));
	v27(v46, 7 + (v219 * (1994.5 - (1238 + 755))));
	v25(v47, true);
	v22(v47, v34 + 2 + 15, v35 + (1666 - (963 + 682)));
	v27(v47, 4);
	v25(v48, true);
	v22(v48, v34 + (1565 - (709 + 825)), v35 + (21 - 9));
	v25(v49, true);
	v22(v49, (v34 + v30) - (43 - 13), v35 + (876 - (196 + 668)));
	v24(v49, v19.TxtMuted);
	v25(v50, true);
	local v220 = {};
	if v13.AutoFarm then
		table.insert(v220, "FARM");
	end
	if v13.AutoWin then
		local v260 = 0 - 0;
		local v261;
		while true do
			if (v260 == (0 - 0)) then
				v261 = ((v13.WinMode == "AUTO") and v71 and v71) or string.sub(v13.WinMode, 834 - (171 + 662), 97 - (4 + 89));
				table.insert(v220, "WIN:" .. v261);
				break;
			end
		end
	end
	if v13.Fly then
		table.insert(v220, "FLY");
	end
	local v221 = table.concat(v220, "+");
	if (v13.StatusText ~= "") then
		v221 = v13.StatusText;
	end
	v26(v50, string.sub(v221, 1 + 0, 76 - 54));
	v22(v50, (v34 + v30) - (59 + 101), v35 + 15);
	if (v221 ~= "") then
		v24(v50, v19.StatusOn);
	end
	for v234, v235 in ipairs(v58) do
		local v236 = 0 - 0;
		local v237;
		local v238;
		local v239;
		while true do
			if (v236 == (1 + 0)) then
				v239 = nil;
				while true do
					if (v237 == (1486 - (35 + 1451))) then
						v238 = v13.ActiveTab == v234;
						v239 = v97(v217, v218, v34 + v235.rx, v35 + v235.ry, v235.rw, v235.rh);
						v237 = 1454 - (28 + 1425);
					end
					if (v237 == 1) then
						v25(v235.box, true);
						v22(v235.box, v34 + v235.rx, v35 + v235.ry);
						v237 = 1995 - (941 + 1052);
					end
					if (v237 == (4 + 0)) then
						v24(v235.txt, (v238 and v19.TxtActive) or v19.TxtSec);
						break;
					end
					if (v237 == 2) then
						v23(v235.box, v235.rw, v235.rh);
						v24(v235.box, (v238 and v19.TabActive) or (v239 and v19.BoxHover) or v19.Box);
						v237 = 1517 - (822 + 692);
					end
					if (v237 == (3 - 0)) then
						v25(v235.txt, true);
						v22(v235.txt, v34 + v235.rx + (12 - 4), v35 + v235.ry + (170 - (149 + 15)));
						v237 = 2 + 2;
					end
				end
				break;
			end
			if (v236 == (117 - (39 + 78))) then
				v237 = 297 - (45 + 252);
				v238 = nil;
				v236 = 1 + 0;
			end
		end
	end
	for v240, v241 in ipairs(v60) do
		if (v241.tab == v13.ActiveTab) then
			local v279 = 0 - 0;
			local v280;
			local v281;
			local v282;
			local v283;
			local v284;
			local v285;
			while true do
				if (v279 == (4 + 3)) then
					v23(v241.border, v241.rw, v241.rh);
					v24(v241.border, v285);
					v25(v241.label, true);
					v279 = 8;
				end
				if (v279 == (2 + 2)) then
					if (v241 == v85) then
						v283 = v13.Fly;
					end
					v284 = (v283 and ((v282 and v19.ActiveHov) or v19.ActiveBox)) or (v282 and v19.BoxHover) or v19.Box;
					v285 = (v283 and v19.ActiveBdr) or (v282 and v19.HoverBorder) or v19.BoxBorder;
					v279 = 12 - 7;
				end
				if (v279 == (433 - (114 + 319))) then
					v280, v281 = v34 + v241.rx, v35 + v241.ry;
					v282 = v97(v217, v218, v280, v281, v241.rw, v241.rh);
					v283 = false;
					v279 = 1 - 0;
				end
				if (v279 == (2 - 0)) then
					local v366 = 0 + 0;
					while true do
						if (v366 == (1 - 0)) then
							if (v241 == v81) then
								v283 = v13.EspBoxes;
							end
							v279 = 5 - 2;
							break;
						end
						if ((0 + 0) == v366) then
							if (v241 == v79) then
								v283 = v13.EspGoose;
							end
							if (v241 == v80) then
								v283 = v13.EspDuck;
							end
							v366 = 3 - 2;
						end
					end
				end
				if (v279 == (1966 - (556 + 1407))) then
					if (v241 == v82) then
						v283 = v13.EspTracers;
					end
					if (v241 == v83) then
						v283 = v13.EspDist;
					end
					if (v241 == v84) then
						v283 = v13.NoClip;
					end
					v279 = 55 - (12 + 39);
				end
				if (v279 == (1214 - (741 + 465))) then
					v22(v241.label, v280 + (477 - (170 + 295)), v281 + 4 + 3);
					v24(v241.label, (v283 and v19.TxtActive) or v19.TxtMain);
					break;
				end
				if ((6 + 0) == v279) then
					local v367 = 0 - 0;
					while true do
						if (v367 == (0 + 0)) then
							v24(v241.box, v284);
							v25(v241.border, true);
							v367 = 1 + 0;
						end
						if ((1 + 0) == v367) then
							v22(v241.border, v280, v281);
							v279 = 5 + 2;
							break;
						end
					end
				end
				if ((1235 - (957 + 273)) == v279) then
					v25(v241.box, true);
					v22(v241.box, v280, v281);
					v23(v241.box, v241.rw, v241.rh);
					v279 = 1716 - (1596 + 114);
				end
				if (v279 == (1 + 0)) then
					local v368 = 713 - (164 + 549);
					while true do
						if (v368 == (1438 - (1059 + 379))) then
							if (v241 == v75) then
								v283 = v13.InfJump;
							end
							if (v241 == v76) then
								v283 = v13.AutoFarm;
							end
							v368 = 1 + 0;
						end
						if (v368 == 1) then
							if (v241 == v77) then
								v283 = v13.AutoWin;
							end
							v279 = 7 - 5;
							break;
						end
					end
				end
			end
		else
			local v286 = 0 - 0;
			local v287;
			while true do
				if (v286 == (0 - 0)) then
					v287 = 0 - 0;
					while true do
						if (v287 == (0 + 0)) then
							v25(v241.box, false);
							v25(v241.border, false);
							v287 = 2 - 1;
						end
						if (v287 == (1781 - (389 + 1391))) then
							v25(v241.label, false);
							break;
						end
					end
					break;
				end
			end
		end
	end
	local v222 = "";
	if ((v13.WinMode == "AUTO") and v71) then
		v222 = " (" .. v71 .. ")";
	end
	v26(v78.label, "AutoWin Mode: " .. v13.WinMode .. v222);
end);
task.spawn(function()
	while v0 do
		if (_G.DuckSuiteGen ~= v18) then
			break;
		end
		local v242 = v13.EspGoose or v13.EspDuck;
		if v242 then
			local v288 = v6.CFrame;
			local v289 = v288.Position;
			local v290 = v288.LookVector;
			local v291 = v288.RightVector;
			local v292 = v288.UpVector;
			local v293 = v6.ViewportSize;
			local v294 = 44 + 26;
			pcall(function()
				v294 = v6.FieldOfView;
			end);
			local v295 = (v293.Y / (1 + 1)) / math.tan(math.rad(v294) / (2 - 0));
			local v296, v297 = v293.X / (4 - 2), v293.Y / 2;
			local v298 = {};
			for v310, v311 in ipairs(v2:GetPlayers()) do
				if ((v311 ~= v4) and v311.Character) then
					local v369 = v311.Character:FindFirstChild("HumanoidRootPart");
					if v369 then
						local v407 = 951 - (783 + 168);
						local v408;
						local v409;
						local v410;
						local v411;
						while true do
							if (0 == v407) then
								v408, v409, v410 = v91(v311.Character, v311);
								v411 = ((v408 ~= "duck") and v13.EspGoose) or ((v408 == "duck") and v13.EspDuck);
								v407 = 3 - 2;
							end
							if ((1 + 0) == v407) then
								if v411 then
									local v460 = 253 - (236 + 17);
									local v461;
									local v462;
									local v463;
									local v464;
									while true do
										if ((311 - (309 + 2)) == v460) then
											v461 = v369.Position - v289;
											v462 = v461.Magnitude;
											v460 = 1;
										end
										if (v460 == (1 + 1)) then
											if ((v464 > (0.05 - 0)) and (v462 > (1215 - (1090 + 122)))) then
												local v522 = 0 + 0;
												local v523;
												local v524;
												local v525;
												local v526;
												local v527;
												local v528;
												local v529;
												while true do
													if (v522 == (3 - 2)) then
														v524, v525 = v523(v369.Position + Vector3.new(0 + 0, 1121 - (628 + 490), 0 + 0));
														v526, v527 = v523(v369.Position - Vector3.new(0 + 0, 7 - 4, 0));
														v522 = 2;
													end
													if ((9 - 7) == v522) then
														v528, v529 = v523(v369.Position);
														if ((v528 > -(83 + 17)) and (v528 < (v293.X + (874 - (431 + 343))))) then
															local v559 = 0 - 0;
															local v560;
															local v561;
															local v562;
															local v563;
															local v564;
															while true do
																if (v559 == (8 - 5)) then
																	if v13.EspDist then
																		v564 = v564 .. string.format(" [%.0fm]", v462);
																	end
																	table.insert(v298, {name=v564,color=v410,nx=v528,ny=(v560 - 8),bx=(v528 - (v563 / (2 + 0))),by=v560,bw=v563,bh=(v561 - v560),tx=v528,ty=v561});
																	break;
																end
																if (v559 == (1 - 0)) then
																	v562 = v561 - v560;
																	if (v562 < (2 + 12)) then
																		local v571 = 1970 - (582 + 1388);
																		while true do
																			if (v571 == (1695 - (556 + 1139))) then
																				v562 = 60 - 24;
																				v560 = v529 - (33 - (6 + 9));
																				v571 = 365 - (326 + 38);
																			end
																			if (v571 == (2 - 1)) then
																				v561 = v529 + 4 + 14;
																				break;
																			end
																		end
																	end
																	v559 = 2 - 0;
																end
																if (v559 == (0 + 0)) then
																	v560 = math.min(v525, v527);
																	v561 = math.max(v525, v527);
																	v559 = 1 + 0;
																end
																if (v559 == (171 - (28 + 141))) then
																	v563 = math.max(7 + 9, v562 * (0.9 - 0));
																	v564 = v409 .. v311.Name;
																	v559 = 3;
																end
															end
														end
														break;
													end
													if (v522 == (0 + 0)) then
														v523 = nil;
														function v523(v549)
															local v550 = 443 - (319 + 124);
															local v551;
															local v552;
															local v553;
															local v554;
															local v555;
															while true do
																if (v550 == (1317 - (486 + 831))) then
																	v551 = 0;
																	v552 = nil;
																	v550 = 2 - 1;
																end
																if (v550 == 1) then
																	v553 = nil;
																	v554 = nil;
																	v550 = 1009 - (564 + 443);
																end
																if (v550 == 2) then
																	v555 = nil;
																	while true do
																		if (v551 == (5 - 3)) then
																			return v296 + (v554 * v295), v297 - (v555 * v295);
																		end
																		if (v551 == (0 - 0)) then
																			local v572 = 0 + 0;
																			while true do
																				if (v572 == (3 - 2)) then
																					v551 = 1264 - (668 + 595);
																					break;
																				end
																				if ((1911 - (1261 + 650)) == v572) then
																					v552 = v549 - v289;
																					v553 = v290:Dot(v552);
																					v572 = 1 + 0;
																				end
																			end
																		end
																		if (v551 == (1 + 0)) then
																			v554 = v291:Dot(v552) / v553;
																			v555 = v292:Dot(v552) / v553;
																			v551 = 5 - 3;
																		end
																	end
																	break;
																end
															end
														end
														v522 = 291 - (23 + 267);
													end
												end
											end
											break;
										end
										if (v460 == (1945 - (1129 + 815))) then
											v463 = v461.Unit;
											v464 = v290:Dot(v463);
											v460 = 389 - (371 + 16);
										end
									end
								end
								break;
							end
						end
					end
				end
			end
			for v312 = 1845 - (1524 + 320), v87 do
				local v313 = v88[v312];
				local v314 = v298[v312];
				if v314 then
					v26(v313.name, v314.name);
					v24(v313.name, v314.color);
					v22(v313.name, v314.nx, v314.ny);
					v25(v313.name, true);
					if v13.EspBoxes then
						local v412 = 1270 - (1049 + 221);
						while true do
							if (v412 == (1751 - (1326 + 424))) then
								v24(v313.box, v314.color);
								v25(v313.box, true);
								break;
							end
							if ((0 - 0) == v412) then
								v22(v313.box, v314.bx, v314.by);
								v23(v313.box, v314.bw, v314.bh);
								v412 = 1;
							end
						end
					else
						v25(v313.box, false);
					end
					if v13.EspTracers then
						v28(v313.tracer, Vector2.new(v314.tx, v314.ty));
						v29(v313.tracer, Vector2.new(v314.tx, v293.Y));
						v24(v313.tracer, v314.color);
						v25(v313.tracer, true);
					else
						v25(v313.tracer, false);
					end
				else
					local v370 = 0 - 0;
					local v371;
					while true do
						if (v370 == (0 - 0)) then
							v371 = 0;
							while true do
								if (v371 == (119 - (88 + 30))) then
									v25(v313.tracer, false);
									break;
								end
								if (v371 == (771 - (720 + 51))) then
									v25(v313.name, false);
									v25(v313.box, false);
									v371 = 4 - 3;
								end
							end
							break;
						end
					end
				end
			end
		else
			for v315 = 2 - 1, v87 do
				local v316 = 1776 - (421 + 1355);
				local v317;
				while true do
					if (v316 == (0 - 0)) then
						v317 = 0 + 0;
						while true do
							if ((1084 - (286 + 797)) == v317) then
								v25(v88[v315].tracer, false);
								break;
							end
							if (v317 == (0 - 0)) then
								v25(v88[v315].name, false);
								v25(v88[v315].box, false);
								v317 = 1 - 0;
							end
						end
						break;
					end
				end
			end
		end
		task.wait(439.066 - (397 + 42));
	end
end);
v12("Duck Duck Tags V6.2", "AUTO detect + fast handoff + farm cycle", 1086 - (1050 + 32));
print("DUCK DUCK TAGS V6.2 LOADED gen=" .. tostring(v18));
