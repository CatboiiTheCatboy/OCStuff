local robot = require("robot");

print("Put torches in the selected slot.");
io.write("Length? ");
local l = io.read();
io.write("Length of each rib? ");
local n = io.read();

--local torch = 0;
function mine(count)
  for i = 1, count do
    robot.swing();
    robot.forward();
    robot.swingDown();
    if (i % 10 == 0) then
      robot.placeDown();
    end
  end
end

function back(count)
  robot.turnLeft();
  robot.turnLeft();
  for i = 1, count do
    if not robot.forward() then i = i-1; end
  end
end

robot.up();
mine(l);
for i = 1, l, 3 do
  robot.turnLeft();
  mine(n);
  back(n);
  mine(n);
  back(n);
  robot.turnRight();
  for j = 1,3 do
    while not robot.back() do end
  end
end
robot.down();