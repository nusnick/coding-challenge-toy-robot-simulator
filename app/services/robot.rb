class Robot
  attr_accessor :x, :y, :f

  FACES = ['NORTH', 'EAST', 'SOUTH', 'WEST']

  def initialize params
    return unless params
    @x = params[:x].present? && params[:x].to_i
    @y = params[:y].present? && params[:y].to_i
    @f = params[:f]
  end

  def run_command command_str
    command = get_command_from(command_str)
    command.run
  end

  def valid?
    PositionValidator.new(x, y).valid? &&
    f.present? &&
    FACES.include?(f)
  end

  def as_json options
    super.merge(isValid: self.valid?)
  end

  private

  def get_command_from command_str
    case command_str.split(' ').first
    when 'PLACE'
      Commands::Place.new(command_str, self)
    when 'MOVE'
      Commands::Move.new(command_str, self)
    when 'LEFT'
      Commands::Left.new(command_str, self)
    when 'RIGHT'
      Commands::Right.new(command_str, self)
    end
  end

end