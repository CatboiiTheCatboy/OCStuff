local robot = require("robot");

print("Put torches in the selected slot.");
io.write("Strip length? ");
local n = io.read();
robot.up();
for i = 1,n do
  robot.swing();
  robot.swingDown();
  if (i % 10 == 9) then
    robot.placeDown();
  end
  robot.forward();
end

robot.turnLeft();
robot.turnLeft();
for i = 1,n do
  robot.forward();
end

robot.turnRight();
robot.turnRight();
robot.down();
