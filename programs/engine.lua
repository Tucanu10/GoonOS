-- Engine starting / stopping script
-- Written by Tucanu

if not fs.exists("/GoonOS/logs") then
    fs.makeDir("/GoonOS/logs")
end

function log(time, status)
    file = assert(io.open("/GoonOS/logs", "a"))
    file:write(time .. "- Engine turned was on :" .. not status)
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
    log(textutils.formatTime(os.time(ingame)), not rs.getOutput("back"))

    print("Returning to menu")
    sleep(5)
    os.run({}, "/GoonOS/menu")
end
    
