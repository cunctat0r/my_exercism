#
class Robot
  attr_reader :bearing, :coordinates

  ORIENTATION = [:north, :east, :south, :west].freeze

  def initialize
  end

  def orient(direction)
    raise ArgumentError unless ORIENTATION.include?(direction)
    @bearing = direction
  end

  def turn_right
    @bearing = ORIENTATION[ORIENTATION.index(@bearing) + 1]
    @bearing = :north if @bearing.nil?
  end

  def turn_left
    @bearing = ORIENTATION[ORIENTATION.index(@bearing) - 1]
  end

  def at(x, y)
    @coordinates = [x, y]
  end

  def advance
    case @bearing
    when :north
      @coordinates[1] += 1
    when :east
      @coordinates[0] += 1
    when :south
      @coordinates[1] -= 1
    when :west
      @coordinates[0] -= 1
    end
  end
end
#
class Simulator
  INSTRUCTIONS = {
    'L' => 'turn_left',
    'R' => 'turn_right',
    'A' => 'advance'
  }.freeze

  def instructions(cmd)
    cmd.chars.each_with_object([]) do |char, commands|
      commands << INSTRUCTIONS[char].to_sym
    end
  end

  def place(robot, options)
    robot.orient(options[:direction])
    robot.at(options[:x], options[:y])
  end

  def evaluate(robot, cmd)
    instructions(cmd).each do |instruction|
      robot.send(instruction)
    end
  end
end
