-- Computer Menu
-- Written by Tucanu

term.clear()
term.setCursorPos(1, 1)
term.setTextColor( colors.white )

print("Welcome to GoonOS, here is a quick list of commands:")

term.setTextColor( colors.green )

print("engine - maintains a redstone signal on prefered side of the computer")
print("")
print("goodbye - shuts down the computer")
print("")
print("update - updates GoonOS")
print("")
print("uninstall - gets rid of GoonOS")
print("")
print("anything else - allows you to use the computer normally")


term.setCursorPos(term.getCursorPos() + 2, 1)
term.setTextColor( colors.gold )
input = read()

if input == "engine" then
    os.run({}, "/GoonOS/engine")
elseif input == "goodbye" then
    os.shutdown()
elseif input == "update" then
    os.run({}, "/GoonOS/update")
elseif input == "uninstall" then
    os.run({}, "/GoonOS/uninstall")
end