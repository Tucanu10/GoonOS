-- GoonOS Updater
-- Written by Tucanu

function download(path, url)
    print("Downloading n: " .. path)
    data = http.get(url).readAll()
    file = assert(io.open(path, "w"))
    file:write(data)
    file:close()
end

term.clear()
term.setCursorPos(1,1)

print("Do you wish to proceed wtih updating GoonOS? y/n")

input = read()

if input == "y" then
    if(fs.exists("startup"))then
        fs.delete("startup")
    end

    download("/installer", "https://pastebin.com/raw/aDGBL1nn")
else
    os.run({}, "/GoonOS/menu")
end