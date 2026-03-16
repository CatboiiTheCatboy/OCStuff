--Requires: modem
--Optional: leash, piston
function init(name, req)
    local addr = component and component.list(name)();
    if not addr and req then error("The component " .. name .. " was not found. System Halted."); return end
    return addr and component.proxy(addr) or nil;
end
--local drone, modem = component.proxy(component.list("drone")()), component.proxy(component.list("modem")());
--local leash = component.proxy(component.list("leash")()) or
--local piston = component.proxy(component.list("piston")()) or nil
local drone = init("drone", 1)
local modem = init("modem", 1)
local leash = init("leash", false)
local piston = init("piston", false)

modem.open(123) --Specify your port
local remote = 456 -- Specify your remote's port

function getMsg()
  local event, _, _, _, _, text = computer.pullSignal()
  if event == "modem_message" then
    return text
  end
end
function msg(text)
  modem.broadcast(remote, text)
end

function move(x2, y2, z2)
  drone.move(x2, y2, z2)
  return true
end
function use()
  return drone.use(0)
end
function swing()
  return drone.swing(0)
end

function leashMob()
  if leash == nil then return "Unavailable." end
  return leash.leash(0) --sides.down
end
function unleash()
  if leash == nil then return "Unavailable." end
  leash.unleash()
  return true
end

function pushF()
  if piston == nil then return "Unavailable." end
  msg("Input side (0-5)")
  local side = tonumber(getMsg())
  return piston.push(side) --up, down, -z, +x, -x, +z
end

while true do
  local cmd = getMsg()
  if cmd == "north" then msg(move( 1, 0, 0)) end
  if cmd == "south" then msg(move(-1, 0, 0)) end
  if cmd == "up"    then msg(move( 0, 1, 0)) end
  if cmd == "down"  then msg(move( 0,-1, 0)) end
  if cmd == "east"  then msg(move( 0, 0, 1)) end
  if cmd == "west"  then msg(move( 0, 0,-1)) end
  if cmd == "use"   then msg(use()) end
  if cmd == "swing" then msg(swing()) end

  if cmd == "leash" then msg(leashMob()) end
  if cmd == "unleash" then msg(unleash()) end

  if cmd == "push" then msg(pushF()) end

  --if cmd == "dumpcomp" then msg(st .. " // " .. pt) end
  if cmd == "shutdown" then msg("Goodbye."); error("Remotely shut down.") end

  msg("Unknown command.")
end