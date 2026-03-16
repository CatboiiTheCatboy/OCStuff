--Unlike the original script, this one does not wait for incoming messages.
local component = require("component")
local event = require("event")
local modem = component.proxy(component.list("modem")());

print("-- Multipurpose 1-way remote for stuff V.2 --")
print("Made by CatboiiTheCatboy / pluem_plu - 2026")
io.write("Connect to? ")
local to = tonumber(io.read())

io.write("Type quit to exit.")
while true do
    io.write("> ")
    local input = io.read()
    if input == "quit" then return end
    modem.broadcast(to, input)
end