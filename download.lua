
-- Open rednet on all sides
for n,m in ipairs(rs.getSides()) do
    if peripheral.isPresent(m) and peripheral.getType(m) == "modem" then
        rednet.open(m)
    end
end

-- Ping server for the download
local host
while host == nil do
    host = rednet.lookup("client download")
end
rednet.send(host, "requesting client", "client download")

-- Wait for request and download data
downloading = false
local file
while true do
    event, id, text = os.pullEvent()
    if event == "rednet_message" then
        if text == "download end" then
            downloading = false
            file.close()
            shell.run("reboot")
            break
        elseif downloading then
            file.writeLine(text)
            rednet.send(host, "next line")
        elseif text == "download start" then
            downloading = true
            file = fs.open("startup.lua", "w")
        end
    end
end
