-- Login System & Monitor mirroring
-- Written by Tucanu

-- Constants
local TEXT_SCALE = 0.5
local WELCOME_MESSAGE = "Welcome, "
local LOGIN_FAIL_MESSAGE = "Incorrect username and password combination \n"
local REBOOT_DELAY = 2

-- User credentials
local credentials = {
    ["admin"] = "",
    [""] = "",
    [""] = ""
}

-- Function to mirror to monitor
local function mirrorToMonitor()
    local monitor = peripheral.find("monitor")
    if monitor then
        local monitorTerm = peripheral.wrap(peripheral.getName(monitor))
        print("Mirroring screen to the monitor on side: " .. peripheral.getName(monitor) .. "\n\n")
        sleep(REBOOT_DELAY)
        
        term.redirect(monitorTerm)
        monitorTerm.clear()
        monitorTerm.setCursorPos(1, 1)
        monitorTerm.setTextScale(TEXT_SCALE)
    else
        print("No monitors found, using terminal only.\n\n")
    end
end

-- Function to check login credentials
local function checkLogin(user, pass)
    if credentials[user] and credentials[user] == pass then
        return true
    else
        return false
    end
end

-- Main program
local function main()
    mirrorToMonitor()
    
    os.pullEvent = os.pullEventRaw -- Disable termination of program
    
    term.clear()
    term.setCursorPos(1, 1)
    
    -- Get username and password from user
    term.setTextColor(colors.white)
    write("Username: ")
    term.setTextColor(colors.green)
    local user = read()
    
    term.setTextColor(colors.white)
    write("Password: ")
    term.setTextColor(colors.green)
    local pass = read('*')
    
    -- Check login credentials
    if checkLogin(user, pass) then
        term.setTextColor(colors.white)
        write("\n" .. WELCOME_MESSAGE)
        term.setTextColor(colors.lime)
        write(user .. "\n")
        sleep(REBOOT_DELAY)
        
        os.run({}, "/GoonOS/menu")
    else
        term.setTextColor(colors.red)
        write(LOGIN_FAIL_MESSAGE)
        sleep(REBOOT_DELAY)
        
        os.reboot()
    end
end

main() -- Run the main program
