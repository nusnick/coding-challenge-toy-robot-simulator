class CommandsController < ApplicationController

  # params example:
  #   - {"robot"=>{"x"=>"", "y"=>"", "f"=>"", "isValid"=>"false"}, "commands"=>["PLACE 1,1,NORTH"]}
  #   - {"robot"=>{"x"=>"1", "y"=>"1", "f"=>"NORTH", "isValid"=>"true"}, "commands"=>["MOVE"]}
  def run
    robot = service.run(params[:commands])
    render json: robot
  end

  private

  def service
    MovementService.new(robot_params)
  end

  def robot_params
    params.require(:robot).permit(:x, :y, :f)
  end

end
