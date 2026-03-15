--Requires: Leash Upgrade
local drone, modem = component.proxy(component.list("drone")()), component.proxy(component.list("modem")());
local leash = component.proxy(component.list("leash")())
if not (drone and modem) then error("Missing components.") end

modem.open(123) --Specify your port
local remote = 456 -- Specify your remote's port

local x, y, z = 0, 0, 0
function getMsg()
  local event, _, _, _, _, msg = computer.pullSignal()
  if event == "modem_message" then
    return msg
  end
end
function move(x2, y2, z2)
  --x, y, z = x2, y2, z2
  drone.move(x2-x, y2-y, z2-z)
  return true
end
function leashMob()
  if leash then
    return leash.leash(0) --sides.down
  else return false
  end
end
function unleash()
  if leash then
    leash.unleash()
    return true
  else return false
  end
end
function msg(text)
  modem.broadcast(remote, text)
end

while true do
  local cmd = getMsg()
  if cmd == "north" then msg(move( 1, 0, 0)) end
  if cmd == "south" then msg(move(-1, 0, 0)) end
  if cmd == "up"    then msg(move( 0, 1, 0)) end
  if cmd == "down"  then msg(move( 0,-1, 0)) end
  if cmd == "east"  then msg(move( 0, 0, 1)) end
  if cmd == "west"  then msg(move( 0, 0,-1)) end

  if cmd == "leash" then msg(leashMob()) end
  if cmd == "unleash" then msg(unleash()) end
end