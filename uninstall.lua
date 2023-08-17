term.clear()
term.setCursorPos(1, 1)
term.setTextColor( colors.red )

if input == "y" then

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

    print("Uninstall complete")
    sleep(1)
    print("Rebooting")

    os.reboot()
else
    os.run({}, "/GoonOS/menu")
end
