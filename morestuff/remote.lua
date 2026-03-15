local component = require("component")
local event = require("event")
local modem = component.proxy(component.list("modem")());

print("-- Multipurpose remotes for stuff V.1--")
print("Made by CatboiiTheCatboy / pluem_plu - 2026")
io.write("Define this remote's port? ")
local port = tonumber(io.read())
io.write("Connect to? ")
local to = tonumber(io.read())

modem.open(port)
while true do
    io.write("> ")
    local input = io.read()
    modem.broadcast(to, input)
    local _, _, _, _, _, receive = event.pull("modem_message")
    io.write(tostring(receive))
end