-- Login System
-- Written by Tucanu

os.pullEvent = os.pullEventRaw

term.clear()
term.setCursorPos(1, 1)
term.setTextColor( colors.white )

username = {"admin", "user2", "user3"}
password = {"admin", "", ""}

write("Username: ")
term.setTextColor( colors.green )
user = read()

term.setTextColor( colors.white )
write("Password: ")
term.setTextColor( colors.green )
pass = read('*')

term.setTextColor( colors.white )

for i=1, #username do
 if user == username[i] and pass == password[i] then
   access = true
 end
end

if access == true then
  print("Logging in...")
  sleep(1)
  print("")
  write("Welcome, ")
  term.setTextColor( colors.lime )
  write(user)
  sleep(2)
else
  term.setTextColor( colors.red )
  print("Incorrect username and password combination")
  sleep(2)
  os.reboot()
end

os.run({}, "/GoonOS/menu")
