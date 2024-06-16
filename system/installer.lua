-- File Installer
-- Written by Tucanu

os.pullEvent = os.pullEventRaw
term.setTextColor(colors.lime)

local function download(name, path, url)
    write("Downloading: " .. name .. "\n")
    local response = http.get(url)
    if response then
        local data = response.readAll()
        if data then
            local file = fs.open(path, "w")
            file.write(data)
            file.close()
        else
            write("Failed to read data from: " .. url .. "\n")
        end
        response.close()
    else
        write("Failed to download from: " .. url .. "\n")
    end
end

local function silentDownload(path, url)
    local data = http.get(url).readAll()
    if data then
        local file = assert(io.open(path, "w"))
        file:write(data)
        file:close()
    end
end

-- Clear computer of old version of GoonOS
fs.delete("startup")
fs.makeDir("/GoonOS")

-- Download components
local files = {
    {"Login Screen",            "/startup", "https://raw.githubusercontent.com/Tucanu10/GoonOS/main/programs/login.lua"},
    {"Main Menu",               "/GoonOS/menu", "https://raw.githubusercontent.com/Tucanu10/GoonOS/main/programs/menu.lua"},
    {"Engine Startup & Logger", "/GoonOS/engine", "https://raw.githubusercontent.com/Tucanu10/GoonOS/main/programs/engine.lua"},
    {"Update",                  "/GoonOS/update", "https://raw.githubusercontent.com/Tucanu10/GoonOS/main/system/update.lua"},
    {"Uninstall",               "/GoonOS/uninstall", "https://raw.githubusercontent.com/Tucanu10/GoonOS/main/system/uninstall.lua"}
}

for _, file in ipairs(files) do
    download(unpack(file))
end
silentDownload("/login.txt", "https://raw.githubusercontent.com/Tucanu10/GoonOS/main/login.txt")

term.setTextColor(colors.green)
write("GoonOS successfully installed! \nRebooting")
for i = 1, 3 do
    write(".")
    sleep(0.5)
end

os.reboot()
