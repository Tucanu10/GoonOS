-- Computer Menu
-- Written by Tucanu

os.pullEvent = os.pullEventRaw

term.clear()
term.setCursorPos(1, 1)
term.setTextColor( colors.yellow )

write("Welcome to GoonOS, here is a quick list of commands:")
write("")

term.setTextColor( colors.green )

write("engine - maintains a redstone signal on prefered side of the computer")
write("\n")
write("shutdown")
write("\n")
write("update")
write("\n")
write("uninstall")
write("\n")
write("press enter - use the computer normally")
write("\n")

term.setTextColor( colors.yellow )
write("> ")

term.setTextColor( colors.white )
input = read()

if input == "engine" then
    os.run({}, "/GoonOS/engine")
elseif input == "shutdown" then
    os.shutdown()
elseif input == "update" then
    os.run({}, "/GoonOS/update")
elseif input == "uninstall" then
    os.run({}, "/GoonOS/uninstall")
else
    term.clear()
    term.setCursorPos(1, 1)
end
