-- Computer Menu
-- Written by Tucanu

local status = rs.getOutput("back") --Change to appropiate side of computer

term.clear()

term.print("If you wish to start / stop type 'ready' ")

local input = os.read()

if input == "ready" then
    os.run("{}, /GoonOS/engine")
end
