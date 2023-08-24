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
    
    fs.delete("/GoonOS")
    fs.delete("startup")
    fs.delete("installer")

    print("")
    term.setTextColor( colors.lime)
    print("Uninstall complete \n")
    sleep(1)
    write("Rebooting")
    sleep(1)
    for i = 1, 3, 1 do
        write(".")
        sleep(0.5)
    end
    os.reboot()
else
    os.run({}, "/GoonOS/menu")
end
