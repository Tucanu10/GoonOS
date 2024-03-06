-- GoonOS Updater
-- Written by Tucanu

os.pullEvent = os.pullEventRaw

function download(path, url)
    write("Downloading : " .. path .. "\n")
    data = http.get(url).readAll()
    file = assert(io.open(path, "w"))
    file:write(data)
    file:close()
end

term.clear()
term.setCursorPos(1,1)
term.setTextColor( colors.white )

write("Do you wish to proceed wtih updating GoonOS? y/n \n")

input = read()

if input == "y" then
    term.setTextColor( colors.lime)
    if (fs.exists("startup")) then
        fs.delete("startup")
    end

    if (fs.exists("mirror")) then
        fs.delete("mirror")
    end
    download("startup", "https://raw.githubusercontent.com/Tucanu10/GoonOS/main/system/installer.lua")
    os.run({}, "/startup")
else
    os.run({}, "/GoonOS/menu")
end