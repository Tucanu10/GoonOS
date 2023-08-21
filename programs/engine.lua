-- Engine starting / stopping script
-- Written by Tucanu

function log(time, status)
    file = assert(io.open("/GoonOS/logs.txt", "a+"))
    if status == true then
        engineStatus = "true"
    else
        engineStatus = "false"
    end
    file:write(time .. " - Engine was turned on: " .. engineStatus .. "\n")
    file:close()
end



status = rs.getOutput("back") --Change to appropiate side of computer

term.clear()
term.setCursorPos(1, 1)
term.setTextColor( colors.white )

print("Engine commands :")
print("")
term.setTextColor( colors.lime )
print("press enter - start / stop the engine")
print("log - see the engine's activity")
print("dellog - deletes the engine logs")
print("")

term.setTextColor( colors.yellow )
write("> ")

term.setTextColor( colors.white )
input = read()

if input == "" then
    if status == false then
        print("Stopping the engine")
    else
        print("Firing up the engine")
    end

    log(textutils.formatTime(os.time(utc)), not status)
    sleep(5)

    rs.setOutput("back", not status)    --Change to appropiate side of computer

    term.write(textutils.formatTime(os.time(utc), true))
    term.write(" : ")

    if status == false then
        term.setTextColor( colors.red )
        print("The engine has stopped")
    else
        term.setTextColor( colors.green )
        print("The engine has started!")
    end

elseif input == "log" then
    term.clear()
    term.setCursorPos(1, 1)
    term.setTextColor( colors.white )

    file = assert(io.open("/GoonOS/logs.txt", "r"))
    data = file:read()
    print(data)

else
    print("Logs have been deleted")
    shell.run("delete /GoonOS/logs.txt")
end

term.setTextColor( colors.yellow )
print("")
print("To return to the menu press 'enter' or continue inputting by pressing any other key")
while true do
    event, key = os.pullEvent("key_up")
    name = keys.getName(key) or "unknown key"
    if name == "enter" then
        term.setTextColor( colors.yellow )
        print("Returning to menu")
        sleep(5)
        os.run({}, "/GoonOS/menu")
    else
        os.run({}, "/GoonOS/engine")
        break
    end
end