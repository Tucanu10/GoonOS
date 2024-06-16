-- Screen projection script
-- Written by Tucanu

os.pullEvent = os.pullEventRaw

local monitor = peripheral.find("monitor")

if not monitor then
    print("No monitors found.")
else
    local side = peripheral.getName(monitor)
    side.setTextScale(0.5)

    os.run({}, "/monitor", side .. "startup")
end