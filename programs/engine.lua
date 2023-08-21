-- Engine starting / stopping script
-- Written by Tucanu

function log(time, status)
    file = assert(io.open("/GoonOS/logs.txt", "a+"))
    if status == true then
        engineStatus = "true"
    else
        engineStatus = "false"
    end
    file:write(time .. " - Engine turned was on: " .. engineStatus)
    file:seek("cur", 1)
    file:close()
end



status = rs.getOutput("back") --Change to appropiate side of computer

term.clear()
term.setCursorPos(1, 1)
term.setTextColor( colors.white )

print("Engine commands :")
print("")
term.setTextColor( colors.lime )
print("log - see the engine's activity")
print("press enter - start / stop the engine")
print("")

term.setTextColor( colors.white )

input = read()

if input ~= "log" then
    if status == false then
        print("Stopping the engine")
    else
        print("Firing up the engine")
    end

    log(textutils.formatTime(os.time(ingame)), not status)
    sleep(5)

    rs.setOutput("back", not status)    --Change to appropiate side of computer

    term.write(textutils.formatTime(os.time(ingame), true))
    term.write(" : ")

    if status == false then
        term.setTextColor( colors.red )
        print("The engine has stopped")
    else
        term.setTextColor( colors.green) 
        print("The engine has started!")
    end

    term.setTextColor( colors.yellow )

else
    term.clear()
    term.setCursorPos(1, 1)
    term.setTextColor( colors.white )

    file = assert(io.open("/GoonOS/logs.txt", "r"))
    data = file:read()
    textutils.slowPrint(data)
end

print("")
print("To return to the menu press 'm' or continue inputting by pressing enter")
while true do
    event, key = os.pullEvent("key_up")
    name = keys.getName(key) or "unknown key"
    if name == "m" then
        term.setTextColor( colors.yellow )
        print("Returning to menu")
        sleep(5)
        os.run({}, "/GoonOS/menu")
        break

    elseif name == "enter" then
        os.run({}, "/GoonOS/engine")
        break
    end
end