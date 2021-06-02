class CommandsController < ApplicationController

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
