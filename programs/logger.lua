-- Logs system
-- Written by Tucanu

if not fs.exists("/GoonOS/logs.txt") then
    fs.makeDir("/GoonOS/logs.txt")
end

function log(time, status)
    file = fs.open("/GoonOS/logs.txt", "a")
    file.writeLine(time .. "- Engine turned was on :" .. not status)
    file.close()
end