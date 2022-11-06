script_name("Chat Color Changer")
script_author("Arafat#0502, Visage#6468")

local script_version = 1.77
local script_version_text = '1.77'
local ttlcolors = 42

require "moonloader"
require "sampfuncs"
local inicfg = require "inicfg"
local se = require "lib.samp.events"
local https = require 'ssl.https'
local dlstatus = require('moonloader').download_status
local script_path = thisScript().path
local script_url = "https://raw.githubusercontent.com/Visaging/chatcolor/main/ChatColorChanger.lua"
local update_url = "https://raw.githubusercontent.com/Visaging/chatcolor/main/ChatColorChanger.txt"

dir = getWorkingDirectory() .. "\\config\\Visage's revamped Config\\"
dir2 = getWorkingDirectory() .. "\\config\\"
config = dir .. "ChatColor.ini"

if not doesDirectoryExist(dir2) then
    createDirectory(dir2)
end
if not doesDirectoryExist(dir) then
    createDirectory(dir)
end
if not doesFileExist(config) then
    file = io.open(config, "w")
    file:write(" ")
    file:close()
    local directIni = config
    local mainIni =
        inicfg.load(
        inicfg.load(
            {
                main = {
                    --[[ CHATS ]]
                    toggle = false,
                    togccg = false,
                    togccn = false,
                    togccpr = false,
                    togccd = false,
                    togccr = false,
                    togcccom = false,
                    togccf = false,
                    togcchc = false,
                    dcommons = false,
                    togccnews = false,
                    togccdc = false,
                    --[[ COLORS ]]
                    freqhider = 1,
                    global = 1,
                    newbie = 1,
                    com = 1,
                    hc = 1,
                    family = 1,
                    pradio = 1,
                    dradio = 1,
                    facradio = 1,
                    dlspd = 1,
                    dares = 1,
                    dfmd = 1,
                    dfbi = 1,
                    dcommon = 1,
                    news = 1,
                    dc = 1,
                    --[[ ADMIN CHAT (Removed)
                    togccadminc = true,
                    a7 = 42,
                    a6 = 42,
                    a5 = 42,
                    a4 = 42,
                    a3 = 42,
                    a2 = 42,
                    a1 = 42]]
                    --[[CHAT TOGGLES]]
                    togdpd = false,
                    togdfbi = false,
                    togdares = false,
                    togdfmd = false,
                    togdall = false,
                    togfacrad = false,

                }
            },
            directIni
        )
    )

    inicfg.save(mainIni, directIni)
end

local directIni = config
local mainIni = inicfg.load(nil, directIni)
inicfg.save(mainIni, directIni)

function main()
    while not isSampAvailable() do wait(1000) end
    sampAddChatMessage("{DFBD68}Chat Color Changer {FFFFFF}has loaded. {00FF00}/ccHelp", -1)
    update_script(false)
    sampRegisterChatCommand("cc", cmd_toggle)
    sampRegisterChatCommand("togcc", cmd_togchatcolor)
    sampRegisterChatCommand("freqhider", freqhider)
    sampRegisterChatCommand("ccupdate", update_script)
    sampRegisterChatCommand("ccversion", function()
		lua_thread.create(function()
            sampAddChatMessage(string.format("{DFBD68}[%s]{FFFFFF} Current version: {00b7ff}[%s]{FFFFFF}. Use {00b7ff}[/ccupdate]{FFFFFF} to check for updates.", script.this.name, script_version_text), -1)
		end)
	end)



function cmd_togchatcolor(args)
	args = string.lower(args)
	if #args == 0 then
		sampAddChatMessage("{FF0000}Invalid Usage: {FFFFFF}/togcc [Name]")
		sampAddChatMessage("{9E9E9E}Available names: Global, Newbie, Pr, FacD, FacR, C, F, Hc, News, Dc", -1)
	elseif (args == "global") then
		if mainIni.main.togccg then
			mainIni.main.togccg = false
			if inicfg.save(mainIni, directIni) then
				sampAddChatMessage("{7700FF}Chat Color{ffffff}: {FF0000}Disabled {FFFFFF}Global Chat Color.", -1)
			end
		else
			mainIni.main.togccg = true
			if inicfg.save(mainIni, directIni) then
				sampAddChatMessage("{7700FF}Chat Color{ffffff}: {00ff00}Enabled {FFFFFF}Global Chat Color.", -1)
			end
		end
	elseif (args == "newbie") then			
		if mainIni.main.togccn then
			mainIni.main.togccn = false
			if inicfg.save(mainIni, directIni) then
				sampAddChatMessage("{7700FF}Chat Color{ffffff}: {FF0000}Disabled {FFFFFF}Newbie Chat Color.", -1)
			end
		else
			mainIni.main.togccn = true
			if inicfg.save(mainIni, directIni) then
				sampAddChatMessage("{7700FF}Chat Color{ffffff}: {00ff00}Enabled {FFFFFF}Newbie Chat Color.", -1)
			end
		end
	elseif (args == "pr") then	
		if mainIni.main.togccpr then
			mainIni.main.togccpr = false
			if inicfg.save(mainIni, directIni) then
				sampAddChatMessage("{7700FF}Chat Color{ffffff}: {FF0000}Disabled {FFFFFF}Portable Radio Chat Color.", -1)
			end
		else
			mainIni.main.togccpr = true
			if inicfg.save(mainIni, directIni) then
				sampAddChatMessage("{7700FF}Chat Color{ffffff}: {00ff00}Enabled {FFFFFF}Portable Radio Chat Color.", -1)
			end
		end	
    elseif (args == "facd") then			
		if mainIni.main.togccd then
			mainIni.main.togccd = false
			if inicfg.save(mainIni, directIni) then
				sampAddChatMessage("{7700FF}Chat Color{ffffff}: {FF0000}Disabled {FFFFFF}Faction Deparment Chat Color.", -1)
			end
		else
			mainIni.main.togccd = true
			if inicfg.save(mainIni, directIni) then
				sampAddChatMessage("{7700FF}Chat Color{ffffff}: {00ff00}Enabled {FFFFFF}Faction Department Chat Color.", -1)
			end
		end
    elseif (args == "facr") then			
		if mainIni.main.togccr then
			mainIni.main.togccr = false
			if inicfg.save(mainIni, directIni) then
				sampAddChatMessage("{7700FF}Chat Color{ffffff}: {FF0000}Disabled {FFFFFF}Faction Radio Chat Color.", -1)
			end
		else
			mainIni.main.togccr = true
			if inicfg.save(mainIni, directIni) then
				sampAddChatMessage("{7700FF}Chat Color{ffffff}: {00ff00}Enabled {FFFFFF}Faction Radio Chat Color.", -1)
			end
		end
    elseif (args == "c") then			
		if mainIni.main.togcccom then
			mainIni.main.togcccom = false
			if inicfg.save(mainIni, directIni) then
				sampAddChatMessage("{7700FF}Chat Color{ffffff}: {FF0000}Disabled {FFFFFF}Community Chat Color.", -1)
			end
		else
			mainIni.main.togcccom = true
			if inicfg.save(mainIni, directIni) then
				sampAddChatMessage("{7700FF}Chat Color{ffffff}: {00ff00}Enabled {FFFFFF}Community Chat Color.", -1)
			end
		end
    elseif (args == "f") then			
		if mainIni.main.togccf then
			mainIni.main.togccf = false
			if inicfg.save(mainIni, directIni) then
				sampAddChatMessage("{7700FF}Chat Color{ffffff}: {FF0000}Disabled {FFFFFF}Family Chat Color.", -1)
			end
		else
			mainIni.main.togccf = true
			if inicfg.save(mainIni, directIni) then
				sampAddChatMessage("{7700FF}Chat Color{ffffff}: {00ff00}Enabled {FFFFFF}Family Chat Color.", -1)
			end
		end
    elseif (args == "hc") then			
		if mainIni.main.togcchc then
			mainIni.main.togcchc = false
			if inicfg.save(mainIni, directIni) then
				sampAddChatMessage("{7700FF}Chat Color{ffffff}: {FF0000}Disabled {FFFFFF}Helper Chat Color.", -1)
			end
		else
			mainIni.main.togcchc = true
			if inicfg.save(mainIni, directIni) then
				sampAddChatMessage("{7700FF}Chat Color{ffffff}: {00ff00}Enabled {FFFFFF}Helper Chat Color.", -1)
			end
		end
    --[[elseif (args == "adminc") then			
		if mainIni.main.togccadminc then
			mainIni.main.togccadminc = false
			if inicfg.save(mainIni, directIni) then
				sampAddChatMessage("{7700FF}Chat Color{ffffff}: {FF0000}Disabled {FFFFFF}Admin Chat Color.", -1)
			end
		else
			mainIni.main.togccadminc = true
			if inicfg.save(mainIni, directIni) then
				sampAddChatMessage("{7700FF}Chat Color{ffffff}: {00ff00}Enabled {FFFFFF}Admin Chat Color.", -1)
			end
		end]]
    elseif (args == "news") then			
		if mainIni.main.togccnews then
			mainIni.main.togccnews = false
			if inicfg.save(mainIni, directIni) then
				sampAddChatMessage("{7700FF}Chat Color{ffffff}: {FF0000}Disabled {FFFFFF}News Chat Color.", -1)
			end
		else
			mainIni.main.togccnews = true
			if inicfg.save(mainIni, directIni) then
				sampAddChatMessage("{7700FF}Chat Color{ffffff}: {00ff00}Enabled {FFFFFF}News Chat Color.", -1)
			end
		end
    elseif (args == "dc") then			
		if mainIni.main.togccdc then
			mainIni.main.togccdc = false
			if inicfg.save(mainIni, directIni) then
				sampAddChatMessage("{7700FF}Chat Color{ffffff}: {FF0000}Disabled {FFFFFF}Donator Chat Color.", -1)
			end
		else
			mainIni.main.togccdc = true
			if inicfg.save(mainIni, directIni) then
				sampAddChatMessage("{7700FF}Chat Color{ffffff}: {00ff00}Enabled {FFFFFF}Donator Chat Color.", -1)
			end
		end
	else
		sampAddChatMessage("{FF0000}Invalid Usage: {FFFFFF}/togcc [Name]")
		sampAddChatMessage("{9E9E9E}Available names: Global, Newbie, Pr, FacD, FacR, C, F, Hc, News, Dc", -1)
	end
end

function freqhider()
    if (mainIni.main.freqhider == 0) then
        mainIni.main.freqhider = 1
        if inicfg.save(mainIni, directIni) then
            sampAddChatMessage("{7700FF}FreqHider{ffffff}: {FF0000}Disabled", -1)
        end
    else
        mainIni.main.freqhider = 0
        if inicfg.save(mainIni, directIni) then
            sampAddChatMessage("{7700FF}FreqHider{ffffff}: {00ff00}Enabled", -1)
        end
    end
end

function cmd_toggle()
	if mainIni.main.toggle then
		mainIni.main.toggle = false
		if inicfg.save(mainIni, directIni) then
			sampAddChatMessage("{7700FF}Chat Color{ffffff}: {ff0000}Disabled", -1)
		end
	else
		mainIni.main.toggle = true
		if inicfg.save(mainIni, directIni) then
			sampAddChatMessage("{7700FF}Chat Color{ffffff}: {00ff00}Enabled", -1)
		end
	end
end

function update_script(noupdatecheck)
	local update_text = https.request(update_url)
	if update_text ~= nil then
		update_version = update_text:match("version: (.+)")
		if update_version ~= nil then
			if tonumber(update_version) > script_version then
				sampAddChatMessage(string.format("{DFBD68}[%s]{FFFFFF} New version found! The update is in progress.", script.this.name), -1)
				downloadUrlToFile(script_url, script_path, function(id, status)
					if status == dlstatus.STATUS_ENDDOWNLOADDATA then
						sampAddChatMessage(string.format("{DFBD68}[%s]{FFFFFF} The update was successful!", script.this.name), -1)
						lua_thread.create(function()
							wait(500) 
							thisScript():reload()
						end)
					end
				end)
			else
				if noupdatecheck then
					sampAddChatMessage(string.format("{DFBD68}[%s]{FFFFFF} No new version found.", script.this.name), -1)
				end
			end
		end
	end
end

tColors = {
    [0] = "{911600}",
    [1] = "{fc0303}",
    [2] = "{fc4503}",
    [3] = "{fc7703}",
    [4] = "{b06e04}",
    [5] = "{fc9d03}",
    [6] = "{fcbe03}",
    [7] = "{fceb03}",
    [8] = "{c2fc03}",
    [9] = "{84fc03}",
    [10] = "{258f04}",
    [11] = "{3dfc03}",
    [12] = "{03fc5e}",
    [13] = "{03fc90}",
    [14] = "{03fcc2}",
    [15] = "{049171}",
    [16] = "{03fce7}",
    [17] = "{03dffc}",
    [18] = "{03c2fc}",
    [19] = "{03a1fc}",
    [20] = "{0384fc}",
    [21] = "{035efc}",
    [22] = "{0328fc}",
    [23] = "{45039c}",
    [24] = "{6f03fc}",
    [25] = "{9003fc}",
    [26] = "{be03fc}",
    [27] = "{e303fc}",
    [28] = "{fc03e7}",
    [29] = "{fc03b1}",
    [30] = "{fc0390}",
    [31] = "{fc035a}",
    [32] = "{a1033a}",
    [33] = "{b53504}",
    [34] = "{802603}",
    [35] = "{351204}",
    [36] = "{f29999}",
    [37] = "{f77474}",
    [38] = "{ff5e5e}",
    [39] = "{5c4c45}",
    [40] = "{373534}",
    [41] = "{000000}",
    [42] = "{d8d8d8}"
}
