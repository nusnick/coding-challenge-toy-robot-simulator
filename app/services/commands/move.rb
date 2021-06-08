class Commands::Move < Commands::Base

  private

  def x
    case robot.f
    when 'EAST'
      robot.x + 1
    when 'WEST'
      robot.x - 1
    else
      robot.x
    end
  end

  def y
    case robot.f
    when 'NORTH'
      robot.y + 1
    when 'SOUTH'
      robot.y - 1
    else
      robot.y
    end
  end

  def f
    robot.f
  end

end