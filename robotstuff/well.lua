local robot = require("robot");

print("Put torches in the selected slot.");
io.write("Continue? ");
io.read();

local total = 0;

repeat
  robot.swingDown()
  total = total + 1
until not robot.down()

for i = 2,total do
  while not robot.up() do
    robot.swingUp()
  end
  if i % 20 == 0 then
    robot.placeDown()
  end
end

robot.back();