class PositionValidator
  attr_reader :x, :y

  def initialize x, y
    @x = x
    @y = y
  end

  def valid?
    x.present? &&
    y.present? &&
    x < UNITS &&
    x >= 0 &&
    y < UNITS &&
    y >= 0
  end

end