-- Open rednet on all sides
for n,m in ipairs(rs.getSides()) do
    if peripheral.isPresent(m) and peripheral.getType(m) == "modem" then
        rednet.open(m)
    end
end

-- Register computer as "server"
rednet.host("client download", "server")

-- Initialise uploading variable
uploading = -1

-- Calculate file size
local file = fs.open("client.lua", "r")
local line = file.readLine()
fileLength = 0
while line do
    fileLength = fileLength + 1
    line = file.readLine()
end
file.close()

-- Provider loop
local linesSent = 0
while true do
    id, message, protocol = rednet.receive()

    term.clear()
    local percentage = math.floor(linesSent / fileLength * 10000) / 100
    print(linesSent .. "/" .. fileLength .. " : " .. percentage)
    
    if message == "requesting client" then
        uploading = id
        file = fs.open("client.lua", "r")
        rednet.send(uploading, "download start")
        print("Download starting...")
    end

    if uploading > -1 then
        local line = file.readLine()
        if not line then
            rednet.send(uploading, "download end")
            uploading = -1
            print("Download finished.")
        else
            rednet.send(uploading, line)
            linesSent = linesSent + 1
        end
    end
end




