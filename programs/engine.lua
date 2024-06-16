-- Engine starting / stopping script
-- Written by Tucanu


-- Constants
local LOG_FILE_PATH = "/GoonOS/logs.txt"
local ENGINE_SIDE = "back" -- Change to the appropriate side of the computer

-- Function to log engine status
local function logEngineStatus(time, status)
    local file = assert(io.open(LOG_FILE_PATH, "a"))
    local engineStatus = status and "On" or "Off"
    file:write(time .. " : " .. engineStatus .. "\n")
    file:close()
end

-- Function to toggle engine status
local function toggleEngine()
    local status = rs.getOutput(ENGINE_SIDE)
    logEngineStatus(os.date(), status)
    rs.setOutput(ENGINE_SIDE, not status)
end

-- Function to display logs
local function displayLogs()
    if fs.exists(LOG_FILE_PATH) then
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
    write("Engine commands:\n")
    term.setTextColor(colors.green)

    local commands = {
        "press enter - start / stop",
        "log - see engine's activity",
        "dellog - deletes the logs",
        "menu - return to menu"
    }
    for _, command in ipairs(commands) do
        write(command .. "\n")
    end
end

-- Main program
local function main()
    os.pullEvent = os.pullEventRaw -- Disable termination of program
    
    term.clear()
    term.setCursorPos(1, 1)
    
    printEngineCommands()
    
    term.setTextColor(colors.yellow)
    write("> ")

    term.setTextColor(colors.white)

    local input = read()
    
    if input == "" then
        toggleEngine()
        sleep(5)
        print(textutils.formatTime(os.time("utc"), true) .. " : " .. (rs.getOutput(ENGINE_SIDE) and "The engine has started!" or "The engine has stopped!"))
        
        write("\nPress ENTER to continue or return to the menu\n")
        local key = os.pullEvent("key")
        
        if keys.getName(key) ~= "enter" then
            print("Returning to menu\n")
            sleep(4)
            os.run({}, "/GoonOS/menu")
        else
            os.run({}, "/GoonOS/engine")
        end
        
    elseif input == "log" then
        displayLogs()
        
    elseif input == "dellog" then
        deleteLogs()
        
    elseif input == "menu" then
        print("Returning to menu\n")
        sleep(5)
        os.run({}, "/GoonOS/menu")
        
    end
end

main() -- Run the main program