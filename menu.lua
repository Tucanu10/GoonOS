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
print("anything else - allows you to use the computer for other things")

term.setCursorPos(getCursorPos + 2, 1)
term.setTextColor( colors.gold )
input = read()

if input == "engine" then
    os.run({}, "/GoonOS/engine")
end

if input == "goodbye" then
    os.shutdown()
end

if input ~= "engine" or input ~= "goodbye" then
    term.clear()
    term.setCursorPos(1, 1)
    term.setTextColor( colors.white )
end