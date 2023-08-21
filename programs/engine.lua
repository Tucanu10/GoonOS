-- Engine starting / stopping script
-- Written by Tucanu

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

input = read()

term.setTextColor( colors.white)

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

    print("Returning to menu")
    sleep(5)
    os.run({}, "/GoonOS/menu")

else
    log(textutils.formatTime(os.time(ingame)), rs.getOutput("back"))
end
    
