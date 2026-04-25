local component = require("component")
local computer = require("computer")
local event = require("event")
local modem = component.proxy(component.list("modem")());
local filesystem = require("filesystem")

print("-- Mailer for stuff V.1 --")
print("Made by CatboiiTheCatboy / pluem_plu - 2026")
io.write("Send to? ")
local to = tonumber(io.read())
io.write("Path to a file (under 8190 bytes)? ")
local path = io.read()
local file = filesystem.open(path, "r")
modem.broadcast(to, file:read(8190))
file:close();