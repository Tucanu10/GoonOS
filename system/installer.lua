-- File Installer
-- Written by Tucanu

os.pullEvent = os.pullEventRaw

term.setTextColor(colors.lime)

function download(path, url)
    write("Downloading : " .. path)
    data = http.get(url).readAll()
    file = assert(io.open(path, "w"))
    file:write(data)
    file:close()
end

-- Clear computer of old version of GoonOS

if(fs.exists("startup"))then
    fs.delete("startup")
end

fs.makeDir("/GoonOS")

-- Login Screen
download("/startup", "https://raw.githubusercontent.com/Tucanu10/GoonOS/main/programs/login.lua")

-- Main Menu
download("/GoonOS/menu", "https://raw.githubusercontent.com/Tucanu10/GoonOS/main/programs/menu.lua")

-- Engine Startup & Logger
download("/GoonOS/engine", "https://raw.githubusercontent.com/Tucanu10/GoonOS/main/programs/engine.lua")

-- Update
download("/GoonOS/update", "https://raw.githubusercontent.com/Tucanu10/GoonOS/main/system/update.lua")

-- Uninstall
download("/GoonOS/uninstall", "https://raw.githubusercontent.com/Tucanu10/GoonOS/main/system/uninstall.lua")

-- [Utility] Monitor Mirroring, by lurquhar1221
download("mirror", "https://pastebin.com/K9813zBz")

term.setTextColor(colors.green)
write("GoonOS succesfully installed!")
sleep(1)
write("Restarting...")

sleep(1)
os.reboot()

-- link towards pastebin : https://pastebin.com/MWa4dXy6
