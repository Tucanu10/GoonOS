-- File Installer
-- Written by Tucanu

function download(path, url)
    print("Downloading n: " .. path)
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
download("/GoonOS/menu", "https://pastebin.com/raw/VfyGMjUp")

-- Engine Startup
download("/GoonOS/engine", "https://pastebin.com/raw/gk3QLcWH")

-- Login Screen
download("/startup", "https://pastebin.com/raw/T4vz5n3m")

term.setTextColor(colors.green)
print("GoonOS succesfully installed!")
sleep(1)
print("Restarting...")

sleep(1)
os.reboot()

-- link towards pastebin : https://pastebin.com/pcZanDcd