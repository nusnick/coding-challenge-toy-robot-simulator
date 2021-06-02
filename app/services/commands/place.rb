class Commands::Place < Commands::Base

  private

  def command_args
    @command_args ||= command_str.split(' ').last.split(',')
  end

  def x
    _x = command_args[0]
    _x.present? && _x.to_i
  end

  def y
    _y = command_args[1]
    _y.present? && _y.to_i
  end

  def f
    command_args[2]
  end

end