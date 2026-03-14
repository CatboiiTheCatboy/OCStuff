local d = component.proxy(component.list("drone")());
--More components go here

local x, y, z = 0, 0, 0;
function move(x2, y2, z2)
  x, y, z = x2, y2, z2;
  d.move(x2-x, y2-y, z2-z);
end
--More functions go here
