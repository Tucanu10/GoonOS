term.clear()
term.setCursorPos(1, 1)
term.setTextColor( colors.red )

print("Do you wish to uninstall GoonOS? y/n")

term.setTextColor( colors.yellow)
input = read()
print("")
if input == "y" then
    term.setTextColor( colors.white)
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
    print("Uninstall complete.")
    sleep(1)
    print("Rebooting.")
    sleep(1)
    os.reboot()
else
    os.run({}, "/GoonOS/menu")
end
