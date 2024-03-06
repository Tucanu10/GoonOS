-- Uninstall program
-- Written by Tucanu

os.pullEvent = os.pullEventRaw

term.clear()
term.setCursorPos(1, 1)
term.setTextColor( colors.white )

write("Do you wish to uninstall GoonOS? y/n")

input = read()
if input == "y" then
    write("")
    term.setTextColor( colors.red)
    write("Uninstalling GoonOS")
    for i = 1, 3, 1 do
        sleep(1)
        write(".")
    end
    
    fs.delete("/GoonOS")
    fs.delete("startup")
    fs.delete("mirror")

    write("")
    term.setTextColor( colors.lime)
    write("Uninstall complete \n")
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
