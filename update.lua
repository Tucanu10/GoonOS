-- GoonOS Updater
-- Written by Tucanu

function download(path, url)
    print("Downloading : " .. path "from" .. url)
    data = http.get(url).readAll()
    file = assert(io.open(path, "w"))
    file:write(data)
    file:close()
end

term.clear()
term.setCursorPos(1,1)
term.setTextColor( colors.white )

print("Do you wish to proceed wtih updating GoonOS? y/n")

input = read()

if input == "y" then
    if (fs.exists("startup")) then
        fs.delete("startup")
    end

    if (fs.exists("installer")) then
        fs.delete("installer")
    end
    download("/installer", "https://raw.githubusercontent.com/Tucanu10/GoonOS/main/installer.lua")
    os.run({}, "/installer")
else
    os.run({}, "/GoonOS/menu")
end