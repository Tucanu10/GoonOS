-- File Installer
-- Written by Tucanu

if not term.isColor then
    print("Your computer cannot handle GoonOS, please upgrade to an advanced one")
    error()
end

function download(path, url)
    print("Downloading : " .. path)
    data = http.get(url).readAll()
    file = assert(io.open(path, "w"))
    file:write(data)
    file:close()
end

-- Clear computer of old version of GoonOS

if(fs.exists("/GoonOS"))then
    fs.delete("/GoonOS")
end

if(fs.exists("startup"))then
    fs.delete("startup")
end

fs.makeDir("/GoonOS")

-- Main Menu
download("/GoonOS/menu", "https://raw.githubusercontent.com/Tucanu10/GoonOS/main/programs/menu.lua")

-- Engine Startup
download("/GoonOS/engine", "https://raw.githubusercontent.com/Tucanu10/GoonOS/main/programs/engine.lua")

-- Login Screen
download("/startup", "https://raw.githubusercontent.com/Tucanu10/GoonOS/main/programs/login.lua")

-- GoonOS Updater
download("/GoonOS/update", "https://raw.githubusercontent.com/Tucanu10/GoonOS/main/system/update.lua")

-- GoonOS Uninstaller
download("/GoonOS/uninstall", "https://raw.githubusercontent.com/Tucanu10/GoonOS/main/system/uninstall.lua")

term.setTextColor(colors.green)
print("GoonOS succesfully installed!")
sleep(1)
print("Restarting...")

sleep(1)
os.reboot()

-- link towards pastebin : https://pastebin.com/MWa4dXy6
