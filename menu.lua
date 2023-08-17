-- Computer Menu
-- Written by Tucanu

term.clear()
term.setCursorPos(1, 1)
term.setTextColor( colors.white )

print("Welcome to GoonOS, here is a quick list of commands:")

term.setTextColor( colors.green )

print("engine - maintains a redstone signal on prefered side of the computer")
print("goodbye - shuts down the computer")

input = read()

term.setTextColor( colors.white )

if input == "engine" then
    os.run({}, "/GoonOS/engine")
end

if input == "goodbye" then
    os.shutdown()
end