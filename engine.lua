-- Engine starting / stopping script
-- Written by Tucanu

status = rs.getOutput("back") --Change to appropiate side of computer

term.clear()
term.setCursorPos(1, 1)

if status == true then
    print("Stopping the engine")
else
    print("Firing up the engine")
end

sleep(5)

rs.setOutput("back", not status)    --Change to appropiate side of computer

term.write(textutils.formatTime(os.time(ingame), true))
term.write(" : ")

if status == false then
    term.setTextColor( colors.green)
    print("The engine has started!")
else
    term.setTextColor( colors.red )
    print("The engine has stopped")
end
