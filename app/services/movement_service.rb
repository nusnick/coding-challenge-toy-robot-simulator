class MovementService
  attr_reader :robot

  # robot_params example: {"x"=>"1", "y"=>"1", "f"=>"NORTH"}
  def initialize robot_params
    @robot = Robot.new(robot_params)
  end

  # commands example: ["MOVE"]
  def run commands
    commands.each do |command_str|
      robot.run_command(command_str)
    end
    robot
  end

end