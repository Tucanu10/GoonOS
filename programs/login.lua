-- Login System & Monitor mirroring
-- Written by Tucanu

-- Mirroring code

local monitor = peripheral.find("monitor")
local side = peripheral.getName(monitor)

if monitor then
    local monitorTerm = peripheral.wrap(side)
    print("Mirroring screen to the monitor on side: " .. side.. "\n\n")
    sleep(2)
    
    term.redirect(monitorTerm)
    monitorTerm.clear()
    monitorTerm.setCursorPos(1, 1)
    monitorTerm.setTextScale(0.5)
else
    print("No monitors found, using terminal only.\n\n")
end

-- Login System

username = {"", "", ""}
password = {"", "", ""}
-- Set up your own users

os.pullEvent = os.pullEventRaw
term.clear()
term.setCursorPos(1, 1)
term.setTextColor(colors.white)
write("Username: ")
term.setTextColor(colors.green)
user = read()
term.setTextColor(colors.white)
write("Password: ")
term.setTextColor(colors.green)
pass = read('*')
term.setTextColor(colors.white)
for i = 1, #username do
    if user == username[i] and pass == password[i] then
        access = true
    end
end
write("\n")
if access == true then
    write("Logging in ...")
    sleep(1)
    write("\n")
    write("Welcome, ")
    term.setTextColor(colors.lime)
    write(user)
    sleep(2)
else
    term.setTextColor(colors.red)
    write("Incorrect username and password combination \n")
    sleep(2)
    os.reboot()
end

os.run({}, "/GoonOS/menu")
