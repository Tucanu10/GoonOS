-- GoonOS Updater
-- Written by Tucanu

-- Constants
local INSTALLER_URL = "https://raw.githubusercontent.com/Tucanu10/GoonOS/main/system/installer.lua"
local STARTUP_PATH = "startup"
local MENU_PATH = "/GoonOS/menu"

-- Function to download file from URL
local function downloadFile(path, url)
    local data = http.get(url).readAll()
    if data then
        local file = assert(io.open(path, "w"))
        file:write(data)
        file:close()
    end
end

-- Main program
local function updateGoonOS()
    os.pullEvent = os.pullEventRaw -- Disable termination of program
    
    term.clear()
    term.setCursorPos(1, 1)
    
    print("Do you wish to proceed with updating GoonOS? y/n")
    
    local input = read()
    
    if input:lower() == "y" then
        if fs.exists(STARTUP_PATH) then
            fs.delete(STARTUP_PATH)
        end
        
        downloadFile(STARTUP_PATH, INSTALLER_URL)
        
        os.run({}, STARTUP_PATH)
    else
        os.run({}, MENU_PATH)
    end
end

updateGoonOS() -- Run the updater program
