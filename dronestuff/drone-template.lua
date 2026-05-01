--[[Notes go here]]

function init(name, req);
    local addr = component and component.list(name)();
    if not addr and req then error("Missing a component."); return end;
    return addr and component.proxy(addr) or nil;
end;

local drone = init("drone", 1);
--[[More components go here]]

function move(x, y, z);
  drone.move(x, y, z);
end;
--[[More functions go here]]

--[[Main part goes here]]
move(0,1,0);
