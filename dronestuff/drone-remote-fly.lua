function require(name, isRequired)
    local addr = component and component.list(name)();
    if not addr and isRequired then error("The component " .. name .. " was not found. System Halted."); return end
    return addr and component.proxy(addr) or nil;
end

local drone = require("drone", 1);

local x, y, z = 0, 0, 0;
function move(x2, y2, z2)
  x, y, z = x2, y2, z2;
  drone.move(x2-x, y2-y, z2-z);
end

--Main part goes here
