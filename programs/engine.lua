-- Engine starting / stopping script
-- Written by Tucanu

os.pullEvent = os.pullEventRaw

function log(time, status)
    file = assert(io.open("/GoonOS/logs.txt", "a"))
    if status == true then
        engineStatus = "On"
    else
        engineStatus = "Off"
    end
    file:write(time .. " : " .. engineStatus .. "\n")
    file:close()
end


status = rs.getOutput("back") --Change to appropiate side of computer

term.clear()
term.setCursorPos(1, 1)
term.setTextColor( colors.white )

write("Engine commands :")
write("\n")
term.setTextColor( colors.lime )
write("press enter - start / stop \n")
write("log - see engine's activity \n")
write("dellog - deletes the logs \n")
write("menu - return to menu \n")
write("\n")

term.setTextColor( colors.yellow )
write("> ")

term.setTextColor( colors.white )
input = read()

if input == "" then
    if status == false then
        write("Stopping the engine \n")
    else
        write("Firing up the engine \n")
    end

    log(os.date() , status)
    sleep(5)

    rs.setOutput("back", not status)    --Change to appropiate side of computer

    term.write(textutils.formatTime(os.time("local"), true))
    term.write(" : ")

    if status == false then
        term.setTextColor( colors.red )
        write("The engine has stopped! \n")
    else
        term.setTextColor( colors.green )
        write("The engine has started! \n")
    end

elseif input == "log" then
    term.clear()
    term.setCursorPos(1, 1)
    term.setTextColor( colors.white )

    if fs.exists("/GoonOS/logs.txt") then
        for line in io.lines("/GoonOS/logs.txt") do
            write(line)
        end
    else
        write("There are no logs to show")
        write("\n")
    end
elseif input == "dellog" then
    write("Logs have been deleted \n")
    fs.delete("/GoonOS/logs.txt")
end

if input ~= "menu" then
    term.setTextColor( colors.yellow )
    write("")
    write("Press ENTER to continue or return to the menu \n")
    while true do
        event, key = os.pullEvent("key")
        name = keys.getName(key) or "unknown key"
        if name ~= "enter" then
            term.setTextColor( colors.yellow )
            sleep(1)
            write("Returning to menu \n")
            sleep(4)
            os.run({}, "/GoonOS/menu")
            break
        else
            os.run({}, "/GoonOS/engine")
            break
        end
    end
else
    term.setTextColor( colors.yellow )
    write("Returning to menu \n")
    sleep(5)
    os.run({}, "/GoonOS/menu")
end