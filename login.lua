-- Login System
-- Written by Tucanu

os.pullEvent = os.pullEventRaw

term.clear()
term.setCursorPos(1, 1)

username = {"Tucanu", "BeanMan", "Hoshi"}
password = {"admin", "1234", "ilovemaids"}

write("Username: ")
user = read()

write("Password: ")
pass = read('*')

for i=1, #username do -- Starts a loop
 if user == username[i] and pass == password[i] then
   access = true
 end
end

if access == true then
print("Logging in...")
sleep(1)
print("Welcome "..user)
else
print("Incorrect username and password combination")
sleep(2)
os.reboot()
end

os.run("/TucanuOS/menu")
