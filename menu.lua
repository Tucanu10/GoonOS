-- Computer Menu
-- Written by Tucanu

status = rs.getOutput("back") --Change to appropiate side of computer

term.clear()
term.setCursorPos(1, 1)

print("If you wish to start / stop the engine type 'Ready'.")

input = read()

term.setTextColor( colors.green )

if input == "Ready" then
    os.run({}, "/GoonOS/engine")
end
