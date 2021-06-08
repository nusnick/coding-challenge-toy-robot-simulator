require 'rails_helper'

RSpec.describe 'MovementService' do           #

  context 'Robot at initial state' do

    let(:robot_params) {{x: '', y: '', f: ''}}
    before(:each) do
      @service = MovementService.new(robot_params)
    end

    it 'should has right position' do
      commands = [
        "PLACE 0,0,NORTH",
        "MOVE"
      ]
      robot = @service.run(commands)
      expect(robot.report).to eq("0,1,NORTH")
    end

    it 'should has right position' do
      commands = [
        "PLACE 0,0,NORTH",
        "LEFT"
      ]
      robot = @service.run(commands)
      expect(robot.report).to eq("0,0,WEST")
    end

    it 'should has right position' do
      commands = [
        "PLACE 1,2,EAST",
        "MOVE",
        "MOVE",
        "LEFT",
        "MOVE"
      ]
      robot = @service.run(commands)
      expect(robot.report).to eq("3,3,NORTH")
    end

    it 'should has right position' do
      commands = [
        "LEFT",
        "PLACE 0,0,NORTH",
        "MOVE"
      ]
      robot = @service.run(commands)
      expect(robot.report).to eq("0,1,NORTH")
    end

    it 'should has right position' do
      commands = [
        "PLACE 5,100,NORTH",
        "PLACE 0,0,NORTH",
        "MOVE"
      ]
      robot = @service.run(commands)
      expect(robot.report).to eq("0,1,NORTH")
    end

  end

end