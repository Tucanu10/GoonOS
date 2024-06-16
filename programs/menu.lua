-- Computer Menu
-- Written by Tucanu

os.pullEvent = os.pullEventRaw

local function printMenu()
    term.clear()
    term.setCursorPos(1, 1)
    term.setTextColor(colors.yellow)
    write("Welcome to GoonOS! \nHere are the commands:\n\n")
    term.setTextColor(colors.green)

    local commands = {
        "engine - maintains a redstone signal on preferred side of the computer",
        "shutdown",
        "update",
        "uninstall",
        "press enter - use the computer normally"
    }
    for _, command in ipairs(commands) do
        write(command .. "\n")
    end
end

local function handleInput(input)
    local paths = {
        engine = "/GoonOS/engine",
        update = "/GoonOS/update",
        uninstall = "/GoonOS/uninstall",
        default = "/shell"
    }
    
    if paths[input] then
        os.run({}, paths[input])
    elseif input == "shutdown" then
        os.shutdown()

    else
        term.clear()
        term.setCursorPos(1, 1)
    end
end

printMenu()

term.setTextColor(colors.yellow)
write("> ")
term.setTextColor(colors.white)

local input = read()
handleInput(input)
