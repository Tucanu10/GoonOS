-- Computer Menu
-- Written by Tucanu

term.clear()
term.setCursorPos(1, 1)
term.setTextColor( colors.yellow )

print("Please run the update script on first installation of GoonOS")
print("")
print("Welcome to GoonOS, here is a quick list of commands:")
print("")

term.setTextColor( colors.green )

print("engine - maintains a redstone signal on prefered side of the computer")
print("")
print("goodbye - shuts down the computer")
print("")
print("update - updates GoonOS")
print("")
print("uninstall - uninstalls GoonOS")
print("")
print("press enter - use the computer as intended")
print("")

term.setTextColor( colors.yellow )
write("> ")

term.setTextColor( colors.white )
input = read()

if input == "engine" then
    os.run({}, "/GoonOS/engine")
elseif input == "goodbye" then
    os.shutdown()
elseif input == "update" then
    os.run({}, "/GoonOS/update")
elseif input == "uninstall" then
    os.run({}, "/GoonOS/uninstall")
else
    term.clear()
    term.setCursorPos(1, 1)
end
