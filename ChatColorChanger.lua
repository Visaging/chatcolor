script_name("Chat Color Changer")
script_author("Arafat#0502, Visage#6468")

local script_version = 1.73
local script_version_text = '1.73'

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
                    --[[ ADMIN CHAT (Removed)
                    togccadminc = true,
                    a7 = 42,
                    a6 = 42,
                    a5 = 42,
                    a4 = 42,
                    a3 = 42,
                    a2 = 42,
                    a1 = 42]]
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
    sampRegisterChatCommand("ccHelp", cmd_help)
    sampRegisterChatCommand("cc", cmd_toggle)
    sampRegisterChatCommand("togcc", cmd_togchatcolor)
    sampRegisterChatCommand("freqhider", freqhider)
    sampRegisterChatCommand("ccupdate", update_script)
    sampRegisterChatCommand(
        "SetGC",
        function(clr)
            if tonumber(clr) and tonumber(clr) >= 0 and tonumber(clr) <= 42 then
                mainIni.main.global = tonumber(clr)
                if inicfg.save(mainIni, directIni) then
                    sampAddChatMessage(
                        "Your global chat color has successfully been set to " .. tColors[mainIni.main.global] .. clr,
                        string.format("0x%s", tColors[mainIni.main.global]:gsub("[{}]", ""))
                    )
                end
            else
                DialogGlobal()
            end
        end
    )
    sampRegisterChatCommand(
        "Setnewbie",
        function(clr)
            if tonumber(clr) and tonumber(clr) >= 0 and tonumber(clr) <= 42 then
                mainIni.main.newbie = tonumber(clr)
                if inicfg.save(mainIni, directIni) then
                    sampAddChatMessage(
                        "Your newbie chat color has successfully been set to " .. tColors[mainIni.main.newbie] .. clr,
                        string.format("0x%s", tColors[mainIni.main.newbie]:gsub("[{}]", ""))
                    )
                end
            else
                DialogNewbie()
            end
        end
    )
    sampRegisterChatCommand(
        "Setpr",
        function(clr)
            if tonumber(clr) and tonumber(clr) >= 0 and tonumber(clr) <= 42 then
                mainIni.main.pradio = tonumber(clr)
                if inicfg.save(mainIni, directIni) then
                    sampAddChatMessage(
                        "Your portable radio chat color has successfully been set to " .. tColors[mainIni.main.pradio] .. clr,
                        string.format("0x%s", tColors[mainIni.main.pradio]:gsub("[{}]", ""))
                    )
                end
            else
                DialogPRadio()
            end
        end
    )
    sampRegisterChatCommand(
        "Setfacr",
        function(clr)
            if tonumber(clr) and tonumber(clr) >= 0 and tonumber(clr) <= 42 then
                mainIni.main.facradio = tonumber(clr)
                if inicfg.save(mainIni, directIni) then
                    sampAddChatMessage(
                        "Your faction radio chat color has successfully been set to " .. tColors[mainIni.main.facradio] .. clr,
                        string.format("0x%s", tColors[mainIni.main.facradio]:gsub("[{}]", ""))
                    )
                end
            else
                DialogFacRadio()
            end
        end
    )
    sampRegisterChatCommand(
        "Setf",
        function(clr)
            if tonumber(clr) and tonumber(clr) >= 0 and tonumber(clr) <= 42 then
                mainIni.main.family = tonumber(clr)
                if inicfg.save(mainIni, directIni) then
                    sampAddChatMessage(
                        "Your family chat color has successfully been set to " .. tColors[mainIni.main.family] .. clr,
                        string.format("0x%s", tColors[mainIni.main.family]:gsub("[{}]", ""))
                    )
                end
            else
                DialogFamily()
            end
        end
    )
    sampRegisterChatCommand(
        "Sethc",
        function(clr)
            if tonumber(clr) and tonumber(clr) >= 0 and tonumber(clr) <= 42 then
                mainIni.main.hc = tonumber(clr)
                if inicfg.save(mainIni, directIni) then
                    sampAddChatMessage(
                        "Your helper chat color has successfully been set to " .. tColors[mainIni.main.hc] .. clr,
                        string.format("0x%s", tColors[mainIni.main.hc]:gsub("[{}]", ""))
                    )
                end
            else
                DialogHelperC()
            end
        end
    )
    sampRegisterChatCommand(
        "Setc",
        function(clr)
            if tonumber(clr) and tonumber(clr) >= 0 and tonumber(clr) <= 42 then
                mainIni.main.com = tonumber(clr)
                if inicfg.save(mainIni, directIni) then
                    sampAddChatMessage(
                        "Your community chat color has successfully been set to " .. tColors[mainIni.main.com] .. clr,
                        string.format("0x%s", tColors[mainIni.main.com]:gsub("[{}]", ""))
                    )
                end
            else
                DialogCom()
            end
        end
    )
    --[[sampRegisterChatCommand(
        "Setadminc",
        function(clr)
            DialogAdminChat()
        end
    )]]
    sampRegisterChatCommand(
        "Setfacd",
        function(clr)
            DialogFacD()
        end
    )
    while true do
        wait(0)
        local resultglobal, button, list, input = sampHasDialogRespond(5481)
        if resultglobal then
            if button == 1 then
                if tonumber(input) and tonumber(input) >= 0 and tonumber(input) <= 42 then
                    mainIni.main.global = tonumber(input)
                    inicfg.save(mainIni, directIni)
                end
                DialogGlobal()
            end
        end
        local resultnewbie, button, list, input = sampHasDialogRespond(5482)
        if resultnewbie then
            if button == 1 then
                if tonumber(input) and tonumber(input) >= 0 and tonumber(input) <= 42 then
                    mainIni.main.newbie = tonumber(input)
                    inicfg.save(mainIni, directIni)
                end
                DialogNewbie()
            end
        end
        local resultpradio, button, list, input = sampHasDialogRespond(5483)
        if resultpradio then
            if button == 1 then
                if tonumber(input) and tonumber(input) >= 0 and tonumber(input) <= 42 then
                    mainIni.main.pradio = tonumber(input)
                    inicfg.save(mainIni, directIni)
                end
                DialogPRadio()
            end
        end
        local resultfacradio, button, list, input = sampHasDialogRespond(5485)
        if resultfacradio then
            if button == 1 then
                if tonumber(input) and tonumber(input) >= 0 and tonumber(input) <= 42 then
                    mainIni.main.facradio = tonumber(input)
                    inicfg.save(mainIni, directIni)
                end
                DialogFacRadio()
            end
        end
        local resultcom, button, list, input = sampHasDialogRespond(5486)
        if resultcom then
            if button == 1 then
                if tonumber(input) and tonumber(input) >= 0 and tonumber(input) <= 42 then
                    mainIni.main.com = tonumber(input)
                    inicfg.save(mainIni, directIni)
                end
                DialogCom()
            end
        end
        local resultfamily, button, list, input = sampHasDialogRespond(5487)
        if resultfamily then
            if button == 1 then
                if tonumber(input) and tonumber(input) >= 0 and tonumber(input) <= 42 then
                    mainIni.main.family = tonumber(input)
                    inicfg.save(mainIni, directIni)
                end
                DialogFamily()
            end
        end
        local resulthc, button, list, input = sampHasDialogRespond(5488)
        if resulthc then
            if button == 1 then
                if tonumber(input) and tonumber(input) >= 0 and tonumber(input) <= 42 then
                    mainIni.main.hc = tonumber(input)
                    inicfg.save(mainIni, directIni)
                end
                DialogHelperC()
            end
        end
        --[[local resultadminchat, button, list, input = sampHasDialogRespond(5489)
        if resultadminchat then
            if button == 1 then
                if list == 0 then
                    Dialoga7()
                elseif list == 1 then
                    Dialoga6()
                elseif list == 2 then
                    Dialoga5()
                elseif list == 3 then
                    Dialoga4()
                elseif list == 4 then
                    Dialoga3()
                elseif list == 5 then
                    Dialoga2()
                elseif list == 6 then
                    Dialoga1()
                end
            end
        end
        local resulta7, button, list, input = sampHasDialogRespond(5490)
        if resulta7 then
            if button == 1 then
                if tonumber(input) and tonumber(input) >= 0 and tonumber(input) <= 42 then
                    mainIni.main.a7 = tonumber(input)
                    inicfg.save(mainIni, directIni)
                end
                Dialoga7()
            elseif button == 0 then
                DialogAdminChat()
            end
        end
        local resulta6, button, list, input = sampHasDialogRespond(5491)
        if resulta6 then
            if button == 1 then
                if tonumber(input) and tonumber(input) >= 0 and tonumber(input) <= 42 then
                    mainIni.main.a6 = tonumber(input)
                    inicfg.save(mainIni, directIni)
                end
                Dialoga6()
            elseif button == 0 then
                DialogAdminChat()
            end
        end
        local resulta5, button, list, input = sampHasDialogRespond(5492)
        if resulta5 then
            if button == 1 then
                if tonumber(input) and tonumber(input) >= 0 and tonumber(input) <= 42 then
                    mainIni.main.a5 = tonumber(input)
                    inicfg.save(mainIni, directIni)
                end
                Dialoga5()
            elseif button == 0 then
                DialogAdminChat()
            end
        end
        local resulta4, button, list, input = sampHasDialogRespond(5493)
        if resulta4 then
            if button == 1 then
                if tonumber(input) and tonumber(input) >= 0 and tonumber(input) <= 42 then
                    mainIni.main.a4 = tonumber(input)
                    inicfg.save(mainIni, directIni)
                end
                Dialoga4()
            elseif button == 0 then
                DialogAdminChat()
            end
        end
        local resulta3, button, list, input = sampHasDialogRespond(5494)
        if resulta3 then
            if button == 1 then
                if tonumber(input) and tonumber(input) >= 0 and tonumber(input) <= 42 then
                    mainIni.main.a3 = tonumber(input)
                    inicfg.save(mainIni, directIni)
                end
                Dialoga3()
            elseif button == 0 then
                DialogAdminChat()
            end
        end
        local resulta2, button, list, input = sampHasDialogRespond(5495)
        if resulta2 then
            if button == 1 then
                if tonumber(input) and tonumber(input) >= 0 and tonumber(input) <= 42 then
                    mainIni.main.a2 = tonumber(input)
                    inicfg.save(mainIni, directIni)
                end
                Dialoga2()
            elseif button == 0 then
                DialogAdminChat()
            end
        end
        local resulta1, button, list, input = sampHasDialogRespond(5496)
        if resulta1 then
            if button == 1 then
                if tonumber(input) and tonumber(input) >= 0 and tonumber(input) <= 42 then
                    mainIni.main.a1 = tonumber(input)
                    inicfg.save(mainIni, directIni)
                end
                Dialoga1()
            elseif button == 0 then
                DialogAdminChat()
            end
        end]]
        local resultfacd, button, list, input = sampHasDialogRespond(5497)
        if resultfacd then
            if button == 1 then
                if list == 0 then
                    DialogDlspd()
                elseif list == 1 then
                    DialogDares()
                elseif list == 2 then
                    Dialogdfbi()
                elseif list == 3 then
                    Dialogdfmd()
                elseif list == 4 then
                    mainIni.main.dcommons = not mainIni.main.dcommons
                    DialogFacD()
                elseif list == 5 then
                    Dialogdcommon()
                end
            end
        end
        local resultdlspd, button, list, input = sampHasDialogRespond(5498)
        if resultdlspd then
            if button == 1 then
                if tonumber(input) and tonumber(input) >= 0 and tonumber(input) <= 42 then
                    mainIni.main.dlspd = tonumber(input)
                    inicfg.save(mainIni, directIni)
                end
                DialogDlspd()
            elseif button == 0 then
                DialogFacD()
            end
        end
        local resultdares, button, list, input = sampHasDialogRespond(5499)
        if resultdares then
            if button == 1 then
                if tonumber(input) and tonumber(input) >= 0 and tonumber(input) <= 42 then
                    mainIni.main.dares = tonumber(input)
                    inicfg.save(mainIni, directIni)
                end
                DialogDares()
            elseif button == 0 then
                DialogFacD()
            end
        end
        local resultdfbi, button, list, input = sampHasDialogRespond(5500)
        if resultdfbi then
            if button == 1 then
                if tonumber(input) and tonumber(input) >= 0 and tonumber(input) <= 42 then
                    mainIni.main.dfbi = tonumber(input)
                    inicfg.save(mainIni, directIni)
                end
                Dialogdfbi()
            elseif button == 0 then
                DialogFacD()
            end
        end
        local resultdfmd, button, list, input = sampHasDialogRespond(5501)
        if resultdfmd then
            if button == 1 then
                if tonumber(input) and tonumber(input) >= 0 and tonumber(input) <= 42 then
                    mainIni.main.dfmd = tonumber(input)
                    inicfg.save(mainIni, directIni)
                end
                Dialogdfmd()
            elseif button == 0 then
                DialogFacD()
            end
        end
        local resultdcommon, button, list, input = sampHasDialogRespond(5502)
        if resultdcommon then
            if button == 1 then
                if tonumber(input) and tonumber(input) >= 0 and tonumber(input) <= 42 then
                    mainIni.main.dcommon = tonumber(input)
                    inicfg.save(mainIni, directIni)
                end
                Dialogdcommon()
            elseif button == 0 then
                DialogFacD()
            end
        end
    end
end

function cmd_help()
    if (mainIni.main.toggle) then
        statuscc = "{00FF00}[Enabled] "
    else
        statuscc = "{FF0000}[Disabled] "
    end

    if (mainIni.main.togccg) then
        statusgca = "{00FF00}[Enabled] "
    else
        statusgc = "{FF0000}[Disabled] "
    end

    if (mainIni.main.togccpr) then
        statuspr = "{00FF00}[Enabled] "
    else
        statuspr = "{FF0000}[Disabled] "
    end

    if (mainIni.main.freqhider == 0) then
        statusfh = "{00FF00}[Enabled] "
    elseif mainIni.main.freqhider == 1 then
        statusfh = "{FF0000}[Disabled] "
    end

    if (mainIni.main.togccr) then
        statusr = "{00FF00}[Enabled] "
    else
        statusr = "{FF0000}[Disabled] "
    end

    if (mainIni.main.togccd) then
        statusd = "{00FF00}[Enabled] "
    else
        statusd = "{FF0000}[Disabled] "
    end

    if (mainIni.main.togccf) then
        statusf = "{00FF00}[Enabled] "
    else
        statusf = "{FF0000}[Disabled] "
    end

    if (mainIni.main.togcccom) then
        statuscom = "{00FF00}[Enabled] "
    else
        statuscom = "{FF0000}[Disabled] "
    end

    if (mainIni.main.togcchc) then
        statushc = "{00FF00}[Enabled] "
    else
        statushc = "{FF0000}[Disabled] "
    end

    if (mainIni.main.togccn) then
        statusn = "{00FF00}[Enabled] "
    else
        statusn = "{FF0000}[Disabled] "
    end

    --[[if (mainIni.main.togccadminc) then
        statusac = "{00FF00}[Enabled] "
    else
        statusac = "{FF0000}[Disabled] "
    end]]
	sampAddChatMessage("==============================", -1)
	sampAddChatMessage("{FFFFFF}              ---> {7700FF}Chat Color {FFFFFF}<---", -1)
	sampAddChatMessage(statuscc.."{FFFFFF}/cc{FFFF00} - {00FF00}Enables {FFFFFF}/ {FF0000}Disables{FFFF00} chat color.", -1)
	sampAddChatMessage("  {FFFF00}[INFO]    {FFFFFF}/togcc [Name]{FFFF00} - Toggle specific chat color.", -1)
    sampAddChatMessage("  {FFFF00}[INFO]    {FFFFFF}/ccupdate{FFFF00} - Updates the script to the latest version.", -1)
    sampAddChatMessage("======= {7700FF}General Chats {FFFFFF}=======", -1)
	sampAddChatMessage(statuscc.."{FFFFFF}/setgc{FFFF00} - Sets custom global chat color.", -1)
	sampAddChatMessage(statuspr.."{FFFFFF}/setpr{FFFF00} - Sets custom portable radio chat color.", -1)
    sampAddChatMessage(statusfh.."{FFFFFF}/freqhider{FFFF00} - hides portable radio frequency.", -1)
	sampAddChatMessage("======= {7700FF}Faction Chats {FFFFFF}=======", -1)
    sampAddChatMessage(statusr.."{FFFFFF}/setfacr{FFFF00} - Sets custom faction radio chat color.", -1)
    sampAddChatMessage(statusd.."{FFFFFF}/setfacd{FFFF00} - Sets custom faction department radio chat color or separate color for each department.", -1)
    sampAddChatMessage("======= {7700FF}Family/Gang Chats {FFFFFF}=======", -1)
    sampAddChatMessage(statusf.."{FFFFFF}/setf{FFFF00} - Sets custom family chat color.", -1)
    sampAddChatMessage("======= {7700FF}Staff Chats {FFFFFF}=======", -1)
    sampAddChatMessage(statuscom.."{FFFFFF}/setc{FFFF00} - Sets custom community chat color.", -1)
    sampAddChatMessage(statushc.."{FFFFFF}/sethc{FFFF00} - Sets custom helper chat color.", -1)
    sampAddChatMessage(statusn.."{FFFFFF}/setnewbie{FFFF00} - Sets custom newbie chat color.", -1)
    --sampAddChatMessage(statusac.."{FFFFFF}/SetAdminc{FFFF00} - Sets custom admin chat color for each rank separately.", -1)
    sampAddChatMessage("======= {7700FF}Credits {FFFFFF}=======", -1)
    sampAddChatMessage("{FF0000}Arafat N Uzumaki{FFFF00} For the original mod.", -1)
    sampAddChatMessage("{FF0000}Visage A.K.A. Ishaan Dunne{FFFF00} For revamping the mod.", -1)
	sampAddChatMessage("==============================", -1)
end

function se.onServerMessage(clr, msg)
    if not mainIni.main.toggle or not mainIni.main.togccpr then
        if (mainIni.main.freqhider == 0 and clr == 1845194239) then
            if msg:match("**.Radio %(.+% kHz%).%**.+[a-zA-Z_]+%:") then
                msg = msg:gsub("**.Radio %(.+% kHz%).", "", 1)
                sampAddChatMessage(msg, 7207789)
                return false
            end
        end
    end
    if mainIni.main.toggle then
        if (clr == -5963606 and mainIni.main.togccg) then
            if msg:match("%(%( .*") then
                return {string.format("0x%sFF", tColors[mainIni.main.global]:gsub("[{}]", "")), msg}
            end
        end
        if (clr == 2108620799 and mainIni.main.togccn) then
            if msg:match("** .*") then
                return {string.format("0x%sFF", tColors[mainIni.main.newbie]:gsub("[{}]", "")), msg}
            end
        end
        if (clr == 1845194239 and mainIni.main.togccpr) then
            if msg:match("**.Radio %(.+% kHz%).%**.+[a-zA-Z_]+%:") then
                if (mainIni.main.freqhider == 1) then
                    return {string.format("0x%sFF", tColors[mainIni.main.pradio]:gsub("[{}]", "")), msg}
                else
                    msg = msg:gsub("**.Radio %(.+% kHz%).", "", 1)
                    return {string.format("0x%sFF", tColors[mainIni.main.pradio]:gsub("[{}]", "")), msg}
                end
            end
        end
        if (clr == -1920073729 and mainIni.main.togccr) then
            if msg:match("** .**") then
                return {string.format("0x%sFF", tColors[mainIni.main.facradio]:gsub("[{}]", "")), msg}
            end
        end
        if (clr == -2686902 and mainIni.main.togccd) and not mainIni.main.dcommons then
            if msg:match("** LSPD") then
                return {string.format("0x%sFF", tColors[mainIni.main.dlspd]:gsub("[{}]", "")), msg}
            elseif msg:match("** ARES") then
                return {string.format("0x%sFF", tColors[mainIni.main.dares]:gsub("[{}]", "")), msg}
            elseif msg:match("** FBI") then
                return {string.format("0x%sFF", tColors[mainIni.main.dfbi]:gsub("[{}]", "")), msg}
            elseif msg:match("** LSFMD") then
                return {string.format("0x%sFF", tColors[mainIni.main.dfmd]:gsub("[{}]", "")), msg}
            end
        end
        if (clr == -2686902 and mainIni.main.dcommons and mainIni.main.togccd) then
            if msg:match("** .**") then
                return {string.format("0x%sFF", tColors[mainIni.main.dcommon]:gsub("[{}]", "")), msg}
            end
        end
        if (clr == 869072810 and mainIni.main.togcccom) then
            if msg:match("** .+Admin") or msg:match("*** .+Helper") or msg:match("*** Former Admin") or msg:match("** Helper Manager") or msg:match("** Management") or msg:match("** Asst. Management") or msg:match("** Assistant Management") then
                return {string.format("0x%sFF", tColors[mainIni.main.com]:gsub("[{}]", "")), msg}
            end
        end
        if (clr == 33357768 and mainIni.main.togccf) then
            if msg:match("** .**") then
                return {string.format("0x%sFF", tColors[mainIni.main.family]:gsub("[{}]", "")), msg}
            end
        end
        if (clr == -1511456854 and mainIni.main.togcchc) then
            if msg:match("*** .*") then
                return {string.format("0x%sFF", tColors[mainIni.main.hc]:gsub("[{}]", "")), msg}
            end
        end
    end
end

function DialogGlobal()
	local examples = ''
	for k, v in pairs(tColors) do
		examples = examples..v..k..' '
	end
	sampShowDialog(5481, "{ffffff}Global (g) Chat Color", '{1dbaf2}Select you color:\n'..examples..'\n\n{ffffff}Curent Color: '..tColors[mainIni.main.global]..mainIni.main.global..'\n\n'..tColors[mainIni.main.global].."(( Level 69 Player Ishaan Dunne: Being Gay Is Ok))", "Select", "Close", 1)
end

function DialogNewbie()
	local examples = ''
	for k, v in pairs(tColors) do
		examples = examples..v..k..' '
	end
	sampShowDialog(5482, "{ffffff}Newbie (newb) Chat Color", '{1dbaf2}Select you color:\n'..examples..'\n\n{ffffff}Curent Color: '..tColors[mainIni.main.newbie]..mainIni.main.newbie..'\n\n'..tColors[mainIni.main.newbie].."** Head Helper John Panda: OOC Issue.", "Select", "Close", 1)
end

function DialogPRadio()
	local examples = ''
	for k, v in pairs(tColors) do
		examples = examples..v..k..' '
	end
    if (mainIni.main.freqhider == 0) then
        sampShowDialog(5483, "{ffffff}Portable Radio (pr) Chat Color", '{1dbaf2}Select you color:\n'..examples..'\n\n{ffffff}Curent Color: '..tColors[mainIni.main.pradio]..mainIni.main.pradio..'\n\n {ffffff}Frequency Hider is currently enabled.\n\n'..tColors[mainIni.main.pradio].."** Ishaan Dunne: #Gay", "Select", "Close", 1)
    elseif (mainIni.main.freqhider == 1) then
	    sampShowDialog(5483, "{ffffff}Portable Radio (pr) Chat Color", '{1dbaf2}Select you color:\n'..examples..'\n\n{ffffff}Curent Color: '..tColors[mainIni.main.pradio]..mainIni.main.pradio..'\n\n {ffffff}Frequency Hider is currently disabled.\n\n'..tColors[mainIni.main.pradio].."** Radio (1234 kHz) ** Ishaan Dunne: #Gay", "Select", "Close", 1)
    end
end

function DialogFacRadio()
	local examples = ''
	for k, v in pairs(tColors) do
		examples = examples..v..k..' '
	end
	sampShowDialog(5485, "{ffffff}Faction Radio (r) Chat Color", '{1dbaf2}Select you color:\n'..examples..'\n\n{ffffff}Curent Color: '..tColors[mainIni.main.facradio]..mainIni.main.facradio..'\n\n'..tColors[mainIni.main.facradio].."** PTL Captain Kaden Hodges: I'm Ishaan's dad.", "Select", "Close", 1)
end

function DialogCom()
	local examples = ''
	for k, v in pairs(tColors) do
		examples = examples..v..k..' '
	end
	sampShowDialog(5486, "{ffffff}Community (c) Chat Color", '{1dbaf2}Select you color:\n'..examples..'\n\n{ffffff}Curent Color: '..tColors[mainIni.main.com]..mainIni.main.com..'\n\n'..tColors[mainIni.main.com].."*** Former Admin Rob Turt: Parking a BMX on roof is NOT PG.", "Select", "Close", 1)
end

function DialogFamily()
	local examples = ''
	for k, v in pairs(tColors) do
		examples = examples..v..k..' '
	end
	sampShowDialog(5487, "{ffffff}Family (f) Chat Color", '{1dbaf2}Select you color:\n'..examples..'\n\n{ffffff}Curent Color: '..tColors[mainIni.main.family]..mainIni.main.family..'\n\n'..tColors[mainIni.main.family].."** (6) Leader Ezio S Corleone: rush inside **", "Select", "Close", 1)
end

function DialogHelperC()
	local examples = ''
	for k, v in pairs(tColors) do
		examples = examples..v..k..' '
	end
	sampShowDialog(5488, "{ffffff}Helper (hc) Chat Color", '{1dbaf2}Select you color:\n'..examples..'\n\n{ffffff}Curent Color: '..tColors[mainIni.main.hc]..mainIni.main.hc..'\n\n'..tColors[mainIni.main.hc].."*** Head Helper John Panda: Relog B69 please.", "Select", "Close", 1)
end

--[[function DialogAdminChat()
	local examples = ''
	for k, v in pairs(tColors) do
		examples = examples..v..k..' '
	end
    sampShowDialog(5489, "Admin (a) Chat Colors", 'Rank\tCurrent Color\n\
{ae00a8}Management\t'..tColors[mainIni.main.a7]..mainIni.main.a7..'\n\
{910055}Assistant Management\t'..tColors[mainIni.main.a6]..mainIni.main.a6..'\n\
{d5010b}Head Admin\t'..tColors[mainIni.main.a5]..mainIni.main.a5..'\n\
{ffaa65}Senior Admin\t'..tColors[mainIni.main.a4]..mainIni.main.a4..'\n\
{fdee00}General Admin\t'..tColors[mainIni.main.a3]..mainIni.main.a3..'\n\
{44f037}Junior Admin\t'..tColors[mainIni.main.a2]..mainIni.main.a2..'\n\
Secret Admin\t'..tColors[mainIni.main.a1]..mainIni.main.a1, "Select", "Close", DIALOG_STYLE_TABLIST_HEADERS);
end

function Dialoga7()
	local examples = ''
	for k, v in pairs(tColors) do
		examples = examples..v..k..' '
	end
	sampShowDialog(5490, "{ffffff}Management Color", '{1dbaf2}Select you color:\n'..examples..'\n\n{ffffff}Curent Color: '..tColors[mainIni.main.a7]..mainIni.main.a7..'\n\n'..tColors[mainIni.main.a7].."*** Head Helper John Panda: Relog B69 please.", "Select", "Back", 1)
end

function Dialoga6()
	local examples = ''
	for k, v in pairs(tColors) do
		examples = examples..v..k..' '
	end
	sampShowDialog(5491, "{ffffff}Assistant Management Color", '{1dbaf2}Select you color:\n'..examples..'\n\n{ffffff}Curent Color: '..tColors[mainIni.main.a6]..mainIni.main.a6..'\n\n'..tColors[mainIni.main.a6].."*** Head Helper John Panda: Relog B69 please.", "Select", "Back", 1)
end

function Dialoga5()
	local examples = ''
	for k, v in pairs(tColors) do
		examples = examples..v..k..' '
	end
	sampShowDialog(5492, "{ffffff}Head Admin Color", '{1dbaf2}Select you color:\n'..examples..'\n\n{ffffff}Curent Color: '..tColors[mainIni.main.a5]..mainIni.main.a5..'\n\n'..tColors[mainIni.main.a5].."*** Head Helper John Panda: Relog B69 please.", "Select", "Back", 1)
end

function Dialoga4()
	local examples = ''
	for k, v in pairs(tColors) do
		examples = examples..v..k..' '
	end
	sampShowDialog(5493, "{ffffff}Senior Admin Color", '{1dbaf2}Select you color:\n'..examples..'\n\n{ffffff}Curent Color: '..tColors[mainIni.main.a4]..mainIni.main.a4..'\n\n'..tColors[mainIni.main.a4].."*** Head Helper John Panda: Relog B69 please.", "Select", "Back", 1)
end

function Dialoga3()
	local examples = ''
	for k, v in pairs(tColors) do
		examples = examples..v..k..' '
	end
	sampShowDialog(5494, "{ffffff}General Admin Color", '{1dbaf2}Select you color:\n'..examples..'\n\n{ffffff}Curent Color: '..tColors[mainIni.main.a3]..mainIni.main.a3..'\n\n'..tColors[mainIni.main.a3].."*** Head Helper John Panda: Relog B69 please.", "Select", "Back", 1)
end

function Dialoga2()
	local examples = ''
	for k, v in pairs(tColors) do
		examples = examples..v..k..' '
	end
	sampShowDialog(5495, "{ffffff}Junior Admin Color", '{1dbaf2}Select you color:\n'..examples..'\n\n{ffffff}Curent Color: '..tColors[mainIni.main.a2]..mainIni.main.a2..'\n\n'..tColors[mainIni.main.a2].."*** Head Helper John Panda: Relog B69 please.", "Select", "Back", 1)
end

function Dialoga1()
	local examples = ''
	for k, v in pairs(tColors) do
		examples = examples..v..k..' '
	end
	sampShowDialog(5496, "{ffffff}Secret Admin Color", '{1dbaf2}Select you color:\n'..examples..'\n\n{ffffff}Curent Color: '..tColors[mainIni.main.a1]..mainIni.main.a1..'\n\n'..tColors[mainIni.main.a1].."*** Head Helper John Panda: Relog B69 please.", "Select", "Back", 1)
end]]

function DialogFacD()
	local examples = ''
	for k, v in pairs(tColors) do
		examples = examples..v..k..' '
	end

    if mainIni.main.dcommons then
        commonst = "{00FF00}Enabled"
    else
        commonst = "{FF0000}Disabled"
    end

    sampShowDialog(5497, "Department (d) Chat Colors", 'Department\tCurrent Color\n\
{001aff}LSPD\t'..tColors[mainIni.main.dlspd]..mainIni.main.dlspd..'\n\
{1c6486}ARES\t'..tColors[mainIni.main.dares]..mainIni.main.dares..'\n\
{7789ff}FBI\t'..tColors[mainIni.main.dfbi]..mainIni.main.dfbi..'\n\
{ffb3fc}LSFMD\t'..tColors[mainIni.main.dfmd]..mainIni.main.dfmd..'\n\
{ffffff}Common Color for all departments\t'..commonst..'\n\
{ffffff}Common Color\t'..tColors[mainIni.main.dcommon]..mainIni.main.dcommon, "Select", "Close", DIALOG_STYLE_TABLIST_HEADERS);
end

function DialogDlspd()
	local examples = ''
	for k, v in pairs(tColors) do
		examples = examples..v..k..' '
	end
	sampShowDialog(5498, "{ffffff}LSPD Color", '{1dbaf2}Select you color:\n'..examples..'\n\n{ffffff}Curent Color: '..tColors[mainIni.main.dlspd]..mainIni.main.dlspd..'\n\n'..tColors[mainIni.main.dlspd].."** LSPD PTL Lieutenant Ishaan Dunne: Never gonna give you up", "Select", "Back", 1)
end

function DialogDares()
	local examples = ''
	for k, v in pairs(tColors) do
		examples = examples..v..k..' '
	end
	sampShowDialog(5499, "{ffffff}ARES Color", '{1dbaf2}Select you color:\n'..examples..'\n\n{ffffff}Curent Color: '..tColors[mainIni.main.dares]..mainIni.main.dares..'\n\n'..tColors[mainIni.main.dares].."** ARES Major Alex Lewis: No one asked", "Select", "Back", 1)
end

function Dialogdfbi()
	local examples = ''
	for k, v in pairs(tColors) do
		examples = examples..v..k..' '
	end
	sampShowDialog(5500, "{ffffff}FBI Color", '{1dbaf2}Select you color:\n'..examples..'\n\n{ffffff}Curent Color: '..tColors[mainIni.main.dfbi]..mainIni.main.dfbi..'\n\n'..tColors[mainIni.main.dfbi].."** FBI CID Special Agent Carl Wise: Regroup at P13 sur", "Select", "Back", 1)
end

function Dialogdfmd()
	local examples = ''
	for k, v in pairs(tColors) do
		examples = examples..v..k..' '
	end
	sampShowDialog(5501, "{ffffff}LSFMD Color", '{1dbaf2}Select you color:\n'..examples..'\n\n{ffffff}Curent Color: '..tColors[mainIni.main.dfmd]..mainIni.main.dfmd..'\n\n'..tColors[mainIni.main.dfmd].."** LSFMD Paramedic Larry Burnwood: Never gonna let you down", "Select", "Back", 1)
end

function Dialogdcommon()
	local examples = ''
	for k, v in pairs(tColors) do
		examples = examples..v..k..' '
	end
	sampShowDialog(5502, "{ffffff}Common Department Chat Color", '{1dbaf2}Select you color:\n'..examples..'\n\n{ffffff}Curent Color: '..tColors[mainIni.main.dcommon]..mainIni.main.dcommon..'\n\n'..tColors[mainIni.main.dcommon].."Use your brain please", "Select", "Back", 1)
end

function cmd_togchatcolor(args)
	args = string.lower(args)
	if #args == 0 then
		sampAddChatMessage("{FF0000}Invalid Usage: {FFFFFF}/togcc [Name]")
		sampAddChatMessage("{9E9E9E}Available names: Global, Newbie, Pr, FacD, FacR, C, F, Hc", -1)
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
	else
		sampAddChatMessage("{FF0000}Invalid Usage: {FFFFFF}/togcc [Name]")
		sampAddChatMessage("{9E9E9E}Available names: Global, Newbie, Pr, FacD, FacR, C, F, Hc", -1)
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
