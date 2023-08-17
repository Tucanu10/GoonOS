-- Computer Menu
-- Written by Tucanu

local status = rs.getOutput("back") --Change to appropiate side of computer

term.clear()

term.print("If you wish to start / stop type 'amogus' ")

local input = os.read()

if input == "amogus" then
    os.run("/TucanuOS/engine")
end
