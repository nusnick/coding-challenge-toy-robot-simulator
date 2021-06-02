class MovementService
  attr_reader :robot

  def initialize robot_params
    @robot = Robot.new(robot_params)
  end

  def run commands
    commands.each do |command_str|
      robot.run_command(command_str)
    end
    robot
  end

end