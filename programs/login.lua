-- Login System & Monitor mirroring
-- Written by Tucanu

-- Mirroring code

local monitor = peripheral.find("monitor")
if monitor then
    local monitorTerm = peripheral.wrap(peripheral.getName(monitor))
    term.redirect(monitorTerm)
    monitorTerm.clear()
    monitorTerm.setCursorPos(1, 1)
    print("Mirroring screen to the monitor on side: " .. peripheral.getName(monitor).. "\n\n")
    term.restore()
else
    print("No monitors found.\n\n")
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
