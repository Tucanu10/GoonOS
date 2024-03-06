-- Login System
-- Written by Tucanu

username = {"", "", ""}
password = {"", "", ""}

-- Set up your own users

os.pullEvent = os.pullEventRaw

term.clear()
term.setCursorPos(1, 1)
term.setTextColor( colors.white )

monSide = "left" --Change to appropiate side of computer
os.run({}, "mirror " .. monSide .. " startup")

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

write("")
if access == true then
  
  write("Logging in...")
  sleep(1)
  write("")
  write("Welcome, ")
  term.setTextColor( colors.lime )
  write(user)
  sleep(2)

else
  
  term.setTextColor( colors.red )
  write("Incorrect username and password combination")
  sleep(2)
  os.reboot()

end

os.run({}, "/GoonOS/menu")
