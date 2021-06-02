class Commands::Left < Commands::Base

  private

  def x
    robot.x
  end

  def y
    robot.y
  end

  def f
    next_index = Robot::FACES.index(robot.f) - 1
    Robot::FACES[next_index]
  end

end