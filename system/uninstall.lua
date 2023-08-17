term.clear()
term.setCursorPos(1, 1)
term.setTextColor( colors.white )

print("Do you wish to uninstall GoonOS? y/n")

input = read()
if input == "y" then
    print("")
    term.setTextColor( colors.red)
    write("Uninstalling GoonOS")
    for i = 1, 3, 1 do
        sleep(1)
        write(".")
    end
    
    if(fs.exists("/GoonOS"))then
        fs.delete("/GoonOS")
    end

    if(fs.exists("startup"))then
        fs.delete("startup")
    end
    print("")
    term.setTextColor( colors.lime)
    print("Uninstall complete.")
    sleep(1)
    print("Rebooting.")
    sleep(1)
    os.reboot()
else
    os.run({}, "/GoonOS/menu")
end
