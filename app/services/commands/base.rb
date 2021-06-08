class Commands::Base
  attr_reader :command_str, :robot

  def initialize _command_str, _robot
    @command_str = _command_str
    @robot = _robot
  end

  def run
    return unless PositionValidator.new(x, y).valid?
    robot.x = x
    robot.y = y
    robot.f = f
  end

end