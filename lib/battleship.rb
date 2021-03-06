require 'pry'

require_relative 'cell'
require_relative 'board'
require_relative 'ship'
require_relative 'player_module'
require_relative 'human'
require_relative 'ai'
require_relative 'game'
require_relative 'arbiter'
require_relative 'menu'

require_relative 'prompts'
include Prompt

class String

  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red
    colorize(31)
  end

  def green
    colorize(32)
  end

  def yellow
    colorize(33)
  end

  def blue
    colorize(34)
  end

  def pink
    colorize(35)
  end

  def light_blue
    colorize(36)
  end
end