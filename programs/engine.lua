-- Engine starting / stopping script
-- Written by Tucanu

-- Override the default os.pullEvent with os.pullEventRaw for safety
os.pullEvent = os.pullEventRaw

-- Constants
local LOG_FILE_PATH = "/logs.txt"
local ENGINE_SIDE = "back" -- Change to the appropriate side of the computer

-- Function to log engine status
local function logEngineStatus(status)
    local file = assert(io.open(LOG_FILE_PATH, "a"))
    local engineStatus = status and "On" or "Off"
    file:write("§e" .. os.date() .. "§f : " .. engineStatus .. "\n")
    file:close()
end

-- Function to toggle engine status
local function toggleEngine()
    local status = rs.getOutput(ENGINE_SIDE)
    rs.setOutput(ENGINE_SIDE, not status)
    logEngineStatus(not status) -- Log after toggling status
end

-- Function to display logs
local function displayLogs()
    if fs.exists(LOG_FILE_PATH) then
        term.clear()
        term.setCursorPos(1, 1)
        for line in io.lines(LOG_FILE_PATH) do
            print(line)
        end
    else
        print("There are no logs to show\n")
    end
end

-- Function to delete logs
local function deleteLogs()
    fs.delete(LOG_FILE_PATH)
    print("Logs have been deleted\n")
end

-- Function to print engine commands
local function printEngineCommands()
    term.clear()
    term.setCursorPos(1, 1)
    term.setTextColor(colors.yellow)
    print("Engine commands:")
    term.setTextColor(colors.green)

    local commands = {
        "press enter - start / stop",
        "log - see engine's activity",
        "dellog - deletes the logs",
        "menu - return to menu"
    }
    
    for _, command in ipairs(commands) do
        print(command)
    end
    
    term.setTextColor(colors.yellow)
    print("\n> ")
end

-- Main program loop
local function main()
    printEngineCommands()

    local input = read()

    if input == "" then
        toggleEngine()
        local newStatus = rs.getOutput(ENGINE_SIDE) and "started" or "stopped"
        print("The engine has " .. newStatus .. "!\n")
    elseif input == "log" then
        term.setTextColor(colors.white)
        displayLogs()
    elseif input == "dellog" then
        deleteLogs()
    elseif input == "menu" then
        os.run({}, "/GoonOS/menu")
        return -- Exit after running menu
    end

    -- Wait for user to press enter before continuing or returning to menu
    print("Press ENTER to continue or return to the menu")
    
    while true do
        local event, key = os.pullEvent("key")
        
        if keys.getName(key) == "enter" then
            main() -- Restart main loop if enter is pressed
        else
            os.run({}, "/GoonOS/menu") -- Return to menu otherwise
        end
    end
end

main() -- Start the program