local component = require("component")
local computer = require("computer")
local event = require("event")
local modem = component.proxy(component.list("modem")());
function getMessage()
    local counter = 0;
    while counter < 10 do
        local type, _, _, _, _, msg = computer.pullSignal()
        if type == "modem_message" then
            return msg
        end
        counter = counter + 1
    end
    return "No response."
end

print("-- Multipurpose remote for stuff V.2 --")
print("Made by CatboiiTheCatboy / pluem_plu - 2026")
io.write("Define this remote's port? ") -- Will be used to receive feedbacks from another machine
local port = tonumber(io.read())
io.write("Connect to? ")
local to = tonumber(io.read())

print("Spam the keyboard to cancel waiting for signal.")
print("Type quit to exit.")
modem.open(port)
while true do
    io.write("> ")
    local input = io.read()
    if input == "quit" then return end
    modem.broadcast(to, input)
    io.write('"' .. tostring(getMessage()) .. '"')
end