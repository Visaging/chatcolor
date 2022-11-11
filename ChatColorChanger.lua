script_name("Chat Color Changer")
script_author("Visage#6468 A.K.A. Ishaan Dunne")

local script_version = 1.82
local script_version_text = '1.82'

require "moonloader"
require "sampfuncs"
local inicfg = require "inicfg"
local imgui, ffi = require 'mimgui', require 'ffi'
local new, str, sizeof = imgui.new, ffi.string, ffi.sizeof
local se = require "lib.samp.events"
local https = require 'ssl.https'
local dlstatus = require('moonloader').download_status
local script_path = thisScript().path
local script_url = "https://raw.githubusercontent.com/Visaging/chatcolor/main/ChatColorChanger.lua"
local update_url = "https://raw.githubusercontent.com/Visaging/chatcolor/main/ChatColorChanger.txt"
local updatelogs_url = "https://raw.githubusercontent.com/Visaging/chatcolor/main/Update_logs.txt"
local encoding = require "encoding"
encoding.default = 'CP1251'
u8 = encoding.UTF8

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
    local mainIni = inicfg.load(inicfg.load({
                main = {
                    autoupdate = true,
                    autosave = true,
                    sfh = "nil",
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
                    dcommons = true,
                    togccnews = false,
                    togccdc = false,
                    freqhider = false,
                    --[[CHAT TOGGLES]]
                    togdpd = false,
                    togdfbi = false,
                    togdares = false,
                    togdfmd = false,
                    togdall = true,
                    togddialog = false,
                    togfacrad = false,
                },
                --[[COLORS]]
                    global = {r = 0.55, g = 0.21, b = 1, a = 1},
                    newbie = {r = 0.55, g = 0.21, b = 1, a = 1},
                    com = {r = 0.55, g = 0.21, b = 1, a = 1},
                    hc = {r = 0.55, g = 0.21, b = 1, a = 1},
                    family = {r = 0.55, g = 0.21, b = 1, a = 1},
                    pradio = {r = 0.55, g = 0.21, b = 1, a = 1},
                    dradio = {r = 0.55, g = 0.21, b = 1, a = 1},
                    facradio = {r = 0.55, g = 0.21, b = 1, a = 1},
                    dlspd = {r = 0.55, g = 0.21, b = 1, a = 1},
                    dares = {r = 0.55, g = 0.21, b = 1, a = 1},
                    dfmd = {r = 0.55, g = 0.21, b = 1, a = 1},
                    dfbi = {r = 0.55, g = 0.21, b = 1, a = 1},
                    dcommon = {r = 0.55, g = 0.21, b = 1, a = 1},
                    news = {r = 0.55, g = 0.21, b = 1, a = 1},
                    dc = {r = 0.55, g = 0.21, b = 1, a = 1},
            },directIni))
    inicfg.save(mainIni, directIni)
end

local directIni = config
local mainIni = inicfg.load(nil, directIni)
inicfg.save(mainIni, directIni)

local presettings = {
    global = imgui.new.float[4](mainIni.global.r, mainIni.global.g, mainIni.global.b, mainIni.global.a),
    newbie = imgui.new.float[4](mainIni.newbie.r, mainIni.newbie.g, mainIni.newbie.b, mainIni.newbie.a),
    com = imgui.new.float[4](mainIni.com.r, mainIni.com.g, mainIni.com.b, mainIni.com.a),
    hc = imgui.new.float[4](mainIni.hc.r, mainIni.hc.g, mainIni.hc.b, mainIni.hc.a),
    family = imgui.new.float[4](mainIni.family.r, mainIni.family.g, mainIni.family.b, mainIni.family.a),
    pradio = imgui.new.float[4](mainIni.pradio.r, mainIni.pradio.g, mainIni.pradio.b, mainIni.pradio.a),
    dradio = imgui.new.float[4](mainIni.dradio.r, mainIni.dradio.g, mainIni.dradio.b, mainIni.dradio.a),
    facradio = imgui.new.float[4](mainIni.facradio.r, mainIni.facradio.g, mainIni.facradio.b, mainIni.facradio.a),
    dlspd = imgui.new.float[4](mainIni.dlspd.r, mainIni.dlspd.g, mainIni.dlspd.b, mainIni.dlspd.a),
    dares = imgui.new.float[4](mainIni.dares.r, mainIni.dares.g, mainIni.dares.b, mainIni.dares.a),
    dfmd = imgui.new.float[4](mainIni.dfmd.r, mainIni.dfmd.g, mainIni.dfmd.b, mainIni.dfmd.a),
    dfbi = imgui.new.float[4](mainIni.dfbi.r, mainIni.dfbi.g, mainIni.dfbi.b, mainIni.dfbi.a),
    dcommon = imgui.new.float[4](mainIni.dcommon.r, mainIni.dcommon.g, mainIni.dcommon.b, mainIni.dcommon.a),
    news = imgui.new.float[4](mainIni.news.r, mainIni.news.g, mainIni.news.b, mainIni.news.a),
    dc = imgui.new.float[4](mainIni.dc.r, mainIni.dc.g, mainIni.dc.b, mainIni.dc.a),
}

function SaveIni()
    mainIni.global.r, mainIni.global.g, mainIni.global.b, mainIni.global.a = presettings.global[0], presettings.global[1], presettings.global[2], presettings.global[3]
    mainIni.newbie.r, mainIni.newbie.g, mainIni.newbie.b, mainIni.newbie.a = presettings.newbie[0], presettings.newbie[1], presettings.newbie[2], presettings.newbie[3]
    mainIni.com.r, mainIni.com.g, mainIni.com.b, mainIni.com.a = presettings.com[0], presettings.com[1], presettings.com[2], presettings.com[3]
    mainIni.hc.r, mainIni.hc.g, mainIni.hc.b, mainIni.hc.a = presettings.hc[0], presettings.hc[1], presettings.hc[2], presettings.hc[3]
    mainIni.family.r, mainIni.family.g, mainIni.family.b, mainIni.family.a = presettings.family[0], presettings.family[1], presettings.family[2], presettings.family[3]
    mainIni.pradio.r, mainIni.pradio.g, mainIni.pradio.b, mainIni.pradio.a = presettings.pradio[0], presettings.pradio[1], presettings.pradio[2], presettings.pradio[3]
    mainIni.dradio.r, mainIni.dradio.g, mainIni.dradio.b, mainIni.dradio.a = presettings.dradio[0], presettings.dradio[1], presettings.dradio[2], presettings.dradio[3]
    mainIni.facradio.r, mainIni.facradio.g, mainIni.facradio.b, mainIni.facradio.a = presettings.facradio[0], presettings.facradio[1], presettings.facradio[2], presettings.facradio[3]
    mainIni.dlspd.r, mainIni.dlspd.g, mainIni.dlspd.b, mainIni.dlspd.a = presettings.dlspd[0], presettings.dlspd[1], presettings.dlspd[2], presettings.dlspd[3]
    mainIni.dares.r, mainIni.dares.g, mainIni.dares.b, mainIni.dares.a = presettings.dares[0], presettings.dares[1], presettings.dares[2], presettings.dares[3]
    mainIni.dfmd.r, mainIni.dfmd.g, mainIni.dfmd.b, mainIni.dfmd.a = presettings.dfmd[0], presettings.dfmd[1], presettings.dfmd[2], presettings.dfmd[3]
    mainIni.dfbi.r, mainIni.dfbi.g, mainIni.dfbi.b, mainIni.dfbi.a = presettings.dfbi[0], presettings.dfbi[1], presettings.dfbi[2], presettings.dfbi[3]
    mainIni.dcommon.r, mainIni.dcommon.g, mainIni.dcommon.b, mainIni.dcommon.a = presettings.dcommon[0], presettings.dcommon[1], presettings.dcommon[2], presettings.dcommon[3]
    mainIni.news.r, mainIni.news.g, mainIni.news.b, mainIni.news.a = presettings.news[0], presettings.news[1], presettings.news[2], presettings.news[3]
    mainIni.dc.r, mainIni.dc.g, mainIni.dc.b, mainIni.dc.a = presettings.dc[0], presettings.dc[1], presettings.dc[2], presettings.dc[3]
    inicfg.save(mainIni, directIni)
end

imgui.OnInitialize(function()
	imgui.GetIO().IniFilename = nil
    style()
end)

local updatelogs = nil
local windno = 0
local menu = false
imgui.OnFrame(function() return menu and not isGamePaused() end,
function()
    width, height = getScreenResolution()
    imgui.SetNextWindowPos(imgui.ImVec2(width / 2, height / 2), imgui.Cond.Always, imgui.ImVec2(0.5, 0.5))
    imgui.SetNextWindowSize(imgui.ImVec2(500, 400), imgui.Cond.FirstUseEver)
    imgui.BeginCustomTitle(u8"Chat Color Changer", 30, main_win, imgui.WindowFlags.NoResize + imgui.WindowFlags.NoMove + imgui.WindowFlags.NoScrollbar)

        imgui.BeginChild("##1", imgui.ImVec2(130, 30), true)
            if imgui.Button(mainIni.main.toggle and u8'Enabled' or not mainIni.main.toggle and u8'Disabled', imgui.ImVec2(120, 20)) then
                mainIni.main.toggle = not mainIni.main.toggle
            end
        imgui.EndChild()
        if mainIni.main.toggle then
            imgui.SetCursorPos(imgui.ImVec2(5, 70))

            imgui.BeginChild("##2", imgui.ImVec2(130, 175), true)
                imgui.SetCursorPos(imgui.ImVec2(48, 5))
                imgui.Text("Chats")
                imgui.Separator()
                if imgui.Button(u8'General Chats') then windno = 1 end
                if imgui.Button(u8'Faction Chats') then windno = 2 end
                if imgui.Button(u8'Family/Gang Chats') then windno = 3 end
                if imgui.Button(u8'Staff Chats') then windno = 4 end
                imgui.Separator()
                imgui.SetCursorPos(imgui.ImVec2(48, 125))
                imgui.Text("Extras")
                imgui.Separator()
                if imgui.Button(u8'Chat Toggler') then windno = 5 end
            imgui.EndChild()

            imgui.SetCursorPos(imgui.ImVec2(5, 250))

            imgui.BeginChild("##3", imgui.ImVec2(130, 145), true)
                if imgui.Button(u8'Update Logs') then windno = 6 end
                if imgui.Button(u8'Update Script') then update_script(true) end
                if imgui.Button(u8'Save Config') then SaveIni() end
                if imgui.Button(u8'Reload Script') then SaveIni() thisScript():reload() end
                if imgui.Checkbox("Auto Update", new.bool(mainIni.main.autoupdate)) then mainIni.main.autoupdate = not mainIni.main.autoupdate end
                if imgui.Checkbox("Auto Save", new.bool(mainIni.main.autosave)) then mainIni.main.autosave = not mainIni.main.autosave end
            imgui.EndChild()

            imgui.SetCursorPos(imgui.ImVec2(140, 35))

            imgui.BeginChild("##4", imgui.ImVec2(355, 360), true)
                if windno == 1 then
                    if imgui.Checkbox("Global Chat", new.bool(mainIni.main.togccg)) then mainIni.main.togccg = not mainIni.main.togccg end
                    if mainIni.main.togccg then imgui.SameLine() imgui.ColorEdit4('##presettings.global', presettings.global, imgui.ColorEditFlags.NoInputs + imgui.ColorEditFlags.AlphaBar) end

                    if imgui.Checkbox("Donator Chat", new.bool(mainIni.main.togccdc)) then mainIni.main.togccdc = not mainIni.main.togccdc end
                    if mainIni.main.togccdc then imgui.SameLine() imgui.ColorEdit4('##presettings.dc', presettings.dc, imgui.ColorEditFlags.NoInputs + imgui.ColorEditFlags.AlphaBar) end

                    if imgui.Checkbox("Portable Radio Chat", new.bool(mainIni.main.togccpr)) then mainIni.main.togccpr = not mainIni.main.togccpr end
                    if mainIni.main.togccpr then imgui.SameLine() imgui.ColorEdit4('##presettings.pradio', presettings.pradio, imgui.ColorEditFlags.NoInputs + imgui.ColorEditFlags.AlphaBar) end

                    if imgui.Checkbox("Portable Radio Frequency Hider", new.bool(mainIni.main.freqhider)) then mainIni.main.freqhider = not mainIni.main.freqhider end
                    local fhn = new.char[256](mainIni.main.sfh)
                    if mainIni.main.freqhider then imgui.Text("Replacing text: ") imgui.SameLine() if imgui.InputText('##sfh', fhn, sizeof(fhn), imgui.InputTextFlags.EnterReturnsTrue) then mainIni.main.sfh = u8:decode(str(fhn)) end imgui.Text("* Enter 'nil' for making it empty.") end
                elseif windno == 2 then
                    if imgui.Checkbox("Faction Radio", new.bool(mainIni.main.togccr)) then mainIni.main.togccr = not mainIni.main.togccr end
                    if mainIni.main.togccr then imgui.SameLine() imgui.ColorEdit4('##presettings.facradio', presettings.facradio, imgui.ColorEditFlags.NoInputs + imgui.ColorEditFlags.AlphaBar) end

                    if imgui.Checkbox("Department Radio", new.bool(mainIni.main.togccd)) then mainIni.main.togccd = not mainIni.main.togccd end
                    if mainIni.main.togccd then if imgui.Checkbox("Comman color for all departments:", new.bool(mainIni.main.dcommons)) then mainIni.main.dcommons = not mainIni.main.dcommons end end
                    if mainIni.main.dcommons and mainIni.main.togccd then imgui.SameLine() imgui.ColorEdit4('##presettings.dcommon', presettings.dcommon, imgui.ColorEditFlags.NoInputs + imgui.ColorEditFlags.AlphaBar) end
                    if not mainIni.main.dcommons and mainIni.main.togccd then 
                        imgui.Text(u8"LSPD:") imgui.SameLine() imgui.ColorEdit4('##presettings.dlspd', presettings.dlspd, imgui.ColorEditFlags.NoInputs + imgui.ColorEditFlags.AlphaBar) imgui.SameLine()
                        imgui.Text(u8"ARES:") imgui.SameLine() imgui.ColorEdit4('##presettings.dares', presettings.dares, imgui.ColorEditFlags.NoInputs + imgui.ColorEditFlags.AlphaBar) imgui.SameLine()
                        imgui.Text(u8"FBI:") imgui.SameLine() imgui.ColorEdit4('##presettings.dfbi', presettings.dfbi, imgui.ColorEditFlags.NoInputs + imgui.ColorEditFlags.AlphaBar) imgui.SameLine()
                        imgui.Text(u8"LSFMD:") imgui.SameLine() imgui.ColorEdit4('##presettings.dfmd', presettings.dfmd, imgui.ColorEditFlags.NoInputs + imgui.ColorEditFlags.AlphaBar)
                    end

                    if imgui.Checkbox("News Chat", new.bool(mainIni.main.togccnews)) then mainIni.main.togccnews = not mainIni.main.togccnews end
                    if mainIni.main.togccnews then imgui.SameLine() imgui.ColorEdit4('##presettings.news', presettings.news, imgui.ColorEditFlags.NoInputs + imgui.ColorEditFlags.AlphaBar) end
                elseif windno == 3 then
                    if imgui.Checkbox("Family Chat", new.bool(mainIni.main.togccf)) then mainIni.main.togccf = not mainIni.main.togccf end
                    if mainIni.main.togccf then imgui.SameLine() imgui.ColorEdit4('##presettings.family', presettings.family, imgui.ColorEditFlags.NoInputs + imgui.ColorEditFlags.AlphaBar) end
                elseif windno == 4 then
                    if imgui.Checkbox("Community Chat", new.bool(mainIni.main.togcccom)) then mainIni.main.togcccom = not mainIni.main.togcccom end
                    if mainIni.main.togcccom then imgui.SameLine() imgui.ColorEdit4('##presettings.com', presettings.com, imgui.ColorEditFlags.NoInputs + imgui.ColorEditFlags.AlphaBar) end

                    if imgui.Checkbox("Helper Chat", new.bool(mainIni.main.togcchc)) then mainIni.main.togcchc = not mainIni.main.togcchc end
                    if mainIni.main.togcchc then imgui.SameLine() imgui.ColorEdit4('##presettings.hc', presettings.hc, imgui.ColorEditFlags.NoInputs + imgui.ColorEditFlags.AlphaBar) end

                    if imgui.Checkbox("Newbie Chat", new.bool(mainIni.main.togccn)) then mainIni.main.togccn = not mainIni.main.togccn end
                    if mainIni.main.togccn then imgui.SameLine() imgui.ColorEdit4('##presettings.newbie', presettings.newbie, imgui.ColorEditFlags.NoInputs + imgui.ColorEditFlags.AlphaBar) end
                elseif windno == 5 then
                    if imgui.Checkbox("Toggle Faction Radio", new.bool(mainIni.main.togfacrad)) then mainIni.main.togfacrad = not mainIni.main.togfacrad end
                    if imgui.Checkbox("Toggle Department Radio", new.bool(mainIni.main.togddialog)) then mainIni.main.togddialog = not mainIni.main.togddialog end
                    if mainIni.main.togddialog then if imgui.Checkbox("Toggle all departments", new.bool(mainIni.main.togdall)) then mainIni.main.togdall = not mainIni.main.togdall end end
                    if not mainIni.main.togdall and mainIni.main.togddialog then
                        if imgui.Checkbox("Toggle LSPD", new.bool(mainIni.main.togdpd)) then mainIni.main.togdpd = not mainIni.main.togdpd end
                        if imgui.Checkbox("Toggle ARES", new.bool(mainIni.main.togdares)) then mainIni.main.togdares = not mainIni.main.togdares end
                        if imgui.Checkbox("Toggle FBI", new.bool(mainIni.main.togdfbi)) then mainIni.main.togdfbi = not mainIni.main.togdfbi end
                        if imgui.Checkbox("Toggle LSFMD", new.bool(mainIni.main.togdfmd)) then mainIni.main.togdfmd = not mainIni.main.togdfmd end
                    end
                elseif windno == 6 then
                    imgui.SetCursorPos(imgui.ImVec2(75, 5))
                    imgui.Text("Update Logs - Current Version: "..script_version_text)
                    imgui.NewLine()
                    updatelogs_text = updatelogs:match(".+")
                    if updatelogs_text ~= nil then
                        imgui.Text(updatelogs_text)
                    end
                end
            end
        imgui.EndChild()
    imgui.End()
end)

function main()
    while not isSampAvailable() do wait(1000) end
    sampAddChatMessage("{DFBD68}Chat Color Changer {FFFFFF}has loaded. {00FF00}[/chatcolor].", -1)
    if mainIni.main.autoupdate then update_script(false) end
    sampRegisterChatCommand("chatcolor", function() menu = not menu windno = 0 end)
    updatelogs = https.request(updatelogs_url)
end

function se.onServerMessage(clr, msg)
    if mainIni.main.sfh == "nil" then fhs = "" else fhs = mainIni.main.sfh end
    if not mainIni.main.toggle or not mainIni.main.togccpr then
        if (mainIni.main.freqhider and clr == 1845194239) then
            if msg:match("**.Radio %(.+% kHz%).%**.+[a-zA-Z_]+%:") then
                msg = msg:gsub("**.Radio %(.+% kHz%).", fhs.." ", 1)
                sampAddChatMessage(msg, 7207789)
                return false
            end
        end
    end
    if mainIni.main.toggle then
        if (clr == -2686902) then
            if mainIni.main.togddialog then
                if msg:match("** LSPD") and mainIni.main.togdpd then
                    return false
                elseif msg:match("** ARES") and mainIni.main.togdares then
                    return false
                elseif msg:match("** FBI") and mainIni.main.togdfbi then
                    return false
                elseif msg:match("** LSFMD") and mainIni.main.togdfmd then
                    return false
                elseif msg:match("** .**") and mainIni.main.togdall then
                    return false
                end
            end
        end
        if (clr == -1920073729 and mainIni.main.togfacrad) then
            if msg:match("** .**") then
                return false
            end
        end
        if (clr == -5963606 and mainIni.main.togccg) then
            if msg:match("%(%( .*") then
                return {string.format("0x%sFF", string.sub(bit.tohex(join_argb(presettings.global[3] * 255, presettings.global[0] * 255, presettings.global[1] * 255, presettings.global[2] * 255)), 3, 8)), msg}
            end
        end
        if (clr == 2108620799 and mainIni.main.togccn) then
            if msg:match("** .*") then
                return {string.format("0x%sFF", string.sub(bit.tohex(join_argb(presettings.newbie[3] * 255, presettings.newbie[0] * 255, presettings.newbie[1] * 255, presettings.newbie[2] * 255)), 3, 8)), msg}
            end
        end
        if (clr == 1845194239 and mainIni.main.togccpr) then
            if msg:match("**.Radio %(.+% kHz%).%**.+[a-zA-Z_]+%:") then
                if not (mainIni.main.freqhider) then
                    return {string.format("0x%sFF", string.sub(bit.tohex(join_argb(presettings.pradio[3] * 255, presettings.pradio[0] * 255, presettings.pradio[1] * 255, presettings.pradio[2] * 255)), 3, 8)), msg}
                else
                    msg = msg:gsub("**.Radio %(.+% kHz%).", fhs.." "..'{'..string.sub(bit.tohex(join_argb(presettings.pradio[3] * 255, presettings.pradio[0] * 255, presettings.pradio[1] * 255, presettings.pradio[2] * 255)), 3, 8)..'}', 1)
                    return {string.format("0x%sFF", string.sub(bit.tohex(join_argb(presettings.pradio[3] * 255, presettings.pradio[0] * 255, presettings.pradio[1] * 255, presettings.pradio[2] * 255)), 3, 8)), msg}
                end
            end
        end
        if (clr == -1920073729 and mainIni.main.togccr) then
            if msg:match("** .**") then
                return {string.format("0x%sFF", string.sub(bit.tohex(join_argb(presettings.facradio[3] * 255, presettings.facradio[0] * 255, presettings.facradio[1] * 255, presettings.facradio[2] * 255)), 3, 8)), msg}
            end
        end
        if (clr == -2686902 and mainIni.main.togccd) and not mainIni.main.dcommons then
            if msg:match("** LSPD") then
                return {string.format("0x%sFF", string.sub(bit.tohex(join_argb(presettings.dlspd[3] * 255, presettings.dlspd[0] * 255, presettings.dlspd[1] * 255, presettings.dlspd[2] * 255)), 3, 8)), msg}
            elseif msg:match("** ARES") then
                return {string.format("0x%sFF", string.sub(bit.tohex(join_argb(presettings.dares[3] * 255, presettings.dares[0] * 255, presettings.dares[1] * 255, presettings.dares[2] * 255)), 3, 8)), msg}
            elseif msg:match("** FBI") then
                return {string.format("0x%sFF", string.sub(bit.tohex(join_argb(presettings.dfbi[3] * 255, presettings.dfbi[0] * 255, presettings.dfbi[1] * 255, presettings.dfbi[2] * 255)), 3, 8)), msg}
            elseif msg:match("** LSFMD") then
                return {string.format("0x%sFF", string.sub(bit.tohex(join_argb(presettings.dfmd[3] * 255, presettings.dfmd[0] * 255, presettings.dfmd[1] * 255, presettings.dfmd[2] * 255)), 3, 8)), msg}
            end
        end
        if (clr == -2686902 and mainIni.main.dcommons and mainIni.main.togccd) then
            if msg:match("** .**") then
                return {string.format("0x%sFF", string.sub(bit.tohex(join_argb(presettings.dcommon[3] * 255, presettings.dcommon[0] * 255, presettings.dcommon[1] * 255, presettings.dcommon[2] * 255)), 3, 8)), msg}
            end
        end
        if (clr == 869072810 and mainIni.main.togcccom) then
            if msg:match("** .+Admin") or msg:match("*** .+Helper") or msg:match("*** Former Admin") or msg:match("** Helper Manager") or msg:match("** Management") or msg:match("** Asst. Management") or msg:match("** Assistant Management") then
                return {string.format("0x%sFF", string.sub(bit.tohex(join_argb(presettings.com[3] * 255, presettings.com[0] * 255, presettings.com[1] * 255, presettings.com[2] * 255)), 3, 8)), msg}
            end
        end
        if (clr == 33357768 and mainIni.main.togccf) then
            if msg:match("** .**") then
                return {string.format("0x%sFF", string.sub(bit.tohex(join_argb(presettings.family[3] * 255, presettings.family[0] * 255, presettings.family[1] * 255, presettings.family[2] * 255)), 3, 8)), msg}
            end
        end
        if (clr == -1511456854 and mainIni.main.togcchc) then
            if msg:match("*** .*") then
                return {string.format("0x%sFF", string.sub(bit.tohex(join_argb(presettings.hc[3] * 255, presettings.hc[0] * 255, presettings.hc[1] * 255, presettings.hc[2] * 255)), 3, 8)), msg}
            end
        end
        if (clr == -1697828182 and mainIni.main.togccnews) then
            if msg:match("NR .+*") or msg:match("Live News Reporter .+*") or msg:match("Live Interview Guest .+*") then
                return {string.format("0x%sFF", string.sub(bit.tohex(join_argb(presettings.news[3] * 255, presettings.news[0] * 255, presettings.news[1] * 255, presettings.news[2] * 255)), 3, 8)), msg}
            end
        end
        if (clr == -1210979584 and mainIni.main.togccdc) then
            if msg:match("%(%( .*") then
                return {string.format("0x%sFF", string.sub(bit.tohex(join_argb(presettings.dc[3] * 255, presettings.dc[0] * 255, presettings.dc[1] * 255, presettings.dc[2] * 255)), 3, 8)), msg}
            end
        end
    end
end

function cmd_toggle()
	if mainIni.main.toggle then
		mainIni.main.toggle = false
		if inicfg.save(mainIni, directIni) then
			sampAddChatMessage("{7700FF}Chat Color Changer{ffffff}: {ff0000}Disabled", -1)
		end
	else
		mainIni.main.toggle = true
		if inicfg.save(mainIni, directIni) then
			sampAddChatMessage("{7700FF}Chat Color Changer{ffffff}: {00ff00}Enabled", -1)
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

function style()
    imgui.SwitchContext()
    --==[ STYLE ]==--
    imgui.GetStyle().WindowPadding = imgui.ImVec2(5, 5)
    imgui.GetStyle().FramePadding = imgui.ImVec2(5, 2)
    imgui.GetStyle().ItemSpacing = imgui.ImVec2(5, 5)
    imgui.GetStyle().ItemInnerSpacing = imgui.ImVec2(4, 4)
    imgui.GetStyle().TouchExtraPadding = imgui.ImVec2(5, 5)
    imgui.GetStyle().IndentSpacing = 5
    imgui.GetStyle().ScrollbarSize = 10
    imgui.GetStyle().GrabMinSize = 10

    --==[ BORDER ]==--
    imgui.GetStyle().WindowBorderSize = 0
    imgui.GetStyle().ChildBorderSize = 1
    imgui.GetStyle().PopupBorderSize = 0
    imgui.GetStyle().FrameBorderSize = 0
    imgui.GetStyle().TabBorderSize = 0

    --==[ ROUNDING ]==--
    imgui.GetStyle().WindowRounding = 5
    imgui.GetStyle().ChildRounding = 5
    imgui.GetStyle().FrameRounding = 5
    imgui.GetStyle().PopupRounding = 5
    imgui.GetStyle().ScrollbarRounding = 5
    imgui.GetStyle().GrabRounding = 5
    imgui.GetStyle().TabRounding = 5

    --==[ ALIGN ]==--
    imgui.GetStyle().WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
    imgui.GetStyle().ButtonTextAlign = imgui.ImVec2(0.5, 0.5)
    imgui.GetStyle().SelectableTextAlign = imgui.ImVec2(0.5, 0.5)
    
    --==[ COLORS ]==--
    imgui.GetStyle().Colors[imgui.Col.Text]                   = imgui.ImVec4(1.00, 1.00, 1.00, 1.00)
    imgui.GetStyle().Colors[imgui.Col.TextDisabled]           = imgui.ImVec4(0.50, 0.50, 0.50, 1.00)
    imgui.GetStyle().Colors[imgui.Col.WindowBg]               = imgui.ImVec4(0.07, 0.07, 0.07, 1.00)
    imgui.GetStyle().Colors[imgui.Col.ChildBg]                = imgui.ImVec4(0.07, 0.07, 0.07, 1.00)
    imgui.GetStyle().Colors[imgui.Col.PopupBg]                = imgui.ImVec4(0.07, 0.07, 0.07, 1.00)
    imgui.GetStyle().Colors[imgui.Col.Border]                 = imgui.ImVec4(0.25, 0.25, 0.26, 0.54)
    imgui.GetStyle().Colors[imgui.Col.BorderShadow]           = imgui.ImVec4(0.00, 0.00, 0.00, 0.00)
    imgui.GetStyle().Colors[imgui.Col.FrameBg]                = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
    imgui.GetStyle().Colors[imgui.Col.FrameBgHovered]         = imgui.ImVec4(0.25, 0.25, 0.26, 1.00)
    imgui.GetStyle().Colors[imgui.Col.FrameBgActive]          = imgui.ImVec4(0.25, 0.25, 0.26, 1.00)
    imgui.GetStyle().Colors[imgui.Col.TitleBg]                = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
    imgui.GetStyle().Colors[imgui.Col.TitleBgActive]          = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
    imgui.GetStyle().Colors[imgui.Col.TitleBgCollapsed]       = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
    imgui.GetStyle().Colors[imgui.Col.MenuBarBg]              = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
    imgui.GetStyle().Colors[imgui.Col.ScrollbarBg]            = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
    imgui.GetStyle().Colors[imgui.Col.ScrollbarGrab]          = imgui.ImVec4(0.00, 0.00, 0.00, 1.00)
    imgui.GetStyle().Colors[imgui.Col.ScrollbarGrabHovered]   = imgui.ImVec4(0.41, 0.41, 0.41, 1.00)
    imgui.GetStyle().Colors[imgui.Col.ScrollbarGrabActive]    = imgui.ImVec4(0.51, 0.51, 0.51, 1.00)
    imgui.GetStyle().Colors[imgui.Col.CheckMark]              = imgui.ImVec4(1.00, 1.00, 1.00, 1.00)
    imgui.GetStyle().Colors[imgui.Col.SliderGrab]             = imgui.ImVec4(0.21, 0.20, 0.20, 1.00)
    imgui.GetStyle().Colors[imgui.Col.SliderGrabActive]       = imgui.ImVec4(0.21, 0.20, 0.20, 1.00)
    imgui.GetStyle().Colors[imgui.Col.Button]                 = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
    imgui.GetStyle().Colors[imgui.Col.ButtonHovered]          = imgui.ImVec4(0.21, 0.20, 0.20, 1.00)
    imgui.GetStyle().Colors[imgui.Col.ButtonActive]           = imgui.ImVec4(0.41, 0.41, 0.41, 1.00)
    imgui.GetStyle().Colors[imgui.Col.Header]                 = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
    imgui.GetStyle().Colors[imgui.Col.HeaderHovered]          = imgui.ImVec4(0.20, 0.20, 0.20, 1.00)
    imgui.GetStyle().Colors[imgui.Col.HeaderActive]           = imgui.ImVec4(0.47, 0.47, 0.47, 1.00)
    imgui.GetStyle().Colors[imgui.Col.Separator]              = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
    imgui.GetStyle().Colors[imgui.Col.SeparatorHovered]       = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
    imgui.GetStyle().Colors[imgui.Col.SeparatorActive]        = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
    imgui.GetStyle().Colors[imgui.Col.ResizeGrip]             = imgui.ImVec4(1.00, 1.00, 1.00, 0.25)
    imgui.GetStyle().Colors[imgui.Col.ResizeGripHovered]      = imgui.ImVec4(1.00, 1.00, 1.00, 0.67)
    imgui.GetStyle().Colors[imgui.Col.ResizeGripActive]       = imgui.ImVec4(1.00, 1.00, 1.00, 0.95)
    imgui.GetStyle().Colors[imgui.Col.Tab]                    = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
    imgui.GetStyle().Colors[imgui.Col.TabHovered]             = imgui.ImVec4(0.28, 0.28, 0.28, 1.00)
    imgui.GetStyle().Colors[imgui.Col.TabActive]              = imgui.ImVec4(0.30, 0.30, 0.30, 1.00)
    imgui.GetStyle().Colors[imgui.Col.TabUnfocused]           = imgui.ImVec4(0.07, 0.10, 0.15, 0.97)
    imgui.GetStyle().Colors[imgui.Col.TabUnfocusedActive]     = imgui.ImVec4(0.14, 0.26, 0.42, 1.00)
    imgui.GetStyle().Colors[imgui.Col.PlotLines]              = imgui.ImVec4(0.61, 0.61, 0.61, 1.00)
    imgui.GetStyle().Colors[imgui.Col.PlotLinesHovered]       = imgui.ImVec4(1.00, 0.43, 0.35, 1.00)
    imgui.GetStyle().Colors[imgui.Col.PlotHistogram]          = imgui.ImVec4(0.90, 0.70, 0.00, 1.00)
    imgui.GetStyle().Colors[imgui.Col.PlotHistogramHovered]   = imgui.ImVec4(1.00, 0.60, 0.00, 1.00)
    imgui.GetStyle().Colors[imgui.Col.TextSelectedBg]         = imgui.ImVec4(1.00, 0.00, 0.00, 0.35)
    imgui.GetStyle().Colors[imgui.Col.DragDropTarget]         = imgui.ImVec4(1.00, 1.00, 0.00, 0.90)
    imgui.GetStyle().Colors[imgui.Col.NavHighlight]           = imgui.ImVec4(0.26, 0.59, 0.98, 1.00)
    imgui.GetStyle().Colors[imgui.Col.NavWindowingHighlight]  = imgui.ImVec4(1.00, 1.00, 1.00, 0.70)
    imgui.GetStyle().Colors[imgui.Col.NavWindowingDimBg]      = imgui.ImVec4(0.80, 0.80, 0.80, 0.20)
    imgui.GetStyle().Colors[imgui.Col.ModalWindowDimBg]       = imgui.ImVec4(0.00, 0.00, 0.00, 0.70)
end

function join_argb(a, r, g, b)
    local argb = b  -- b
    argb = bit.bor(argb, bit.lshift(g, 8))  -- g
    argb = bit.bor(argb, bit.lshift(r, 16)) -- r
    argb = bit.bor(argb, bit.lshift(a, 24)) -- a
    return argb
end

function onScriptTerminate(s, q)
    if s == thisScript() then
        if mainIni.main.autosave then
            SaveIni()
        end
    end
end

function imgui.BeginCustomTitle(title, titleSizeY, var, flags)
    imgui.PushStyleVarVec2(imgui.StyleVar.WindowPadding, imgui.ImVec2(0, 0))
    imgui.PushStyleVarFloat(imgui.StyleVar.WindowBorderSize, 0)
    imgui.Begin(title, var, imgui.WindowFlags.NoTitleBar + (flags or 0))
    imgui.SetCursorPos(imgui.ImVec2(0, 0))
    local p = imgui.GetCursorScreenPos()
    imgui.GetWindowDrawList():AddRectFilled(p, imgui.ImVec2(p.x + imgui.GetWindowSize().x, p.y + titleSizeY), imgui.GetColorU32Vec4(imgui.GetStyle().Colors[imgui.Col.TitleBgActive]), imgui.GetStyle().WindowRounding, 1 + 2)
    imgui.SetCursorPos(imgui.ImVec2(imgui.GetWindowSize().x / 2 - imgui.CalcTextSize(title).x / 2, titleSizeY / 2 - imgui.CalcTextSize(title).y / 2))
    imgui.Text(title)
    imgui.SetCursorPos(imgui.ImVec2(imgui.GetWindowSize().x - (titleSizeY - 10) - 5, 5))
    imgui.PushStyleVarFloat(imgui.StyleVar.FrameRounding, imgui.GetStyle().WindowRounding)
    if imgui.Button('X##CLOSEBUTTON.WINDOW.'..title, imgui.ImVec2(titleSizeY - 10, titleSizeY - 10)) then menu = false end
    imgui.SetCursorPos(imgui.ImVec2(5, titleSizeY + 5))
    imgui.PopStyleVar(3)
    imgui.PushStyleVarVec2(imgui.StyleVar.WindowPadding, imgui.ImVec2(5, 5))
end
