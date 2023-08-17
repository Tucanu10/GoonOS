-- Windows like Installer
-- Written by Tucanu

function download(path, url)
    print("Downloading n: " .. path)
    data = http.get(url).readAll()
    file = assert(io.open(path, "w"))
    file:write(data)
    file:close()
end

-- Clear computer of old version of TucanuOS

if(fs.exists("/TucanuOS"))then
    fs.delete("/TucanuOS")
end

if(fs.exists("startup"))then
    fs.delete("startup")
end

fs.makeDir("/TucanuOS")

-- Main Menu
download("/TucanuOS/menu", "https://pastebin.com/raw/VfyGMjUp")

-- Engine Startup
download("/TucanuOS/engine", "https://pastebin.com/raw/gk3QLcWH")

-- Login Screen
download("/startup", "https://pastebin.com/raw/T4vz5n3m")

term.setTextColor(colors.green)
print("TucanuOS succesfully installed!")
sleep(1)
print("Restarting...")

sleep(1)
os.reboot()
