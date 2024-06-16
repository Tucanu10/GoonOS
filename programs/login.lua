-- Login System & Monitor mirroring
-- Written by Tucanu

-- Constants
local LOGININFO = "/login.txt"
local TEXT_SCALE = 0.5
local WELCOME_MESSAGE = "Welcome, "
local LOGIN_FAIL_MESSAGE = "Incorrect username and password combination \n"
local REBOOT_DELAY = 2

-- Function to load credentials from a file
local function loadCredentials()
    local creds = {}
    local file = io.open(LOGININFO, "r") -- Open the file for reading
    if file then
        for line in file:lines() do
            local user, pass = string.match(line, "(%w+):(%w+)")
            if user and pass then
                creds[user] = pass
            end
        end
        file:close()
    else
        print("Unable to open credentials file.")
    end
    return creds
end

-- User credentials loaded from a file
local credentials = loadCredentials()

-- Function to mirror to monitor
local function mirrorToMonitor()
    local monitor = peripheral.find("monitor")
    if monitor then
        local monitorTerm = peripheral.wrap(peripheral.getName(monitor))
        term.setTextColor( colors.red )
        print("Mirroring screen to the monitor on side: " .. peripheral.getName(monitor) .. "\n\n")
        sleep(REBOOT_DELAY)
        
        term.redirect(monitorTerm)
        monitorTerm.clear()
        monitorTerm.setCursorPos(1, 1)
        monitorTerm.setTextScale(TEXT_SCALE)
    else
        term.setTextColor( colors.red )
        print("No monitors found, using terminal only.\n\n")
        sleep(REBOOT_DELAY)
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
