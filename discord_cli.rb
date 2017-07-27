require 'curses'

require_relative 'config'

require_relative 'discord'

require_relative 'mainwindow'
require_relative 'headerwindow'

include Curses

# Main Screen
class MainScreen
  SCREEN_HEIGHT = 24
  SCREEN_WIDTH = 80
  HEADER_HEIGHT = 1
  HEADER_WIDTH = SCREEN_WIDTH
  MAIN_WINDOW_HEIGHT = SCREEN_HEIGHT - HEADER_HEIGHT
  MAIN_WINDOW_WIDTH = SCREEN_WIDTH

  def initialize
    # noecho
    # nonl
    stdscr.keypad true
    raw
    stdscr.nodelay = 1
    init_screen
    start_color
    init_pair(1, COLOR_CYAN, COLOR_BLACK)
    init_pair(2, COLOR_BLACK, COLOR_CYAN)
  end

  def add_message(msg)
    @main_window.add_message msg
  end

  def build_display
    @main_window = MainWindow.new
    @header_window = HeaderWindow.new
    @header_window.build_display
    @main_window.draw_prompt
    @main_window.take_input
  end
end

CONFIG = Config.new('config.yaml')

@screen = MainScreen.new
discord = DiscordManager.new(@screen)
t1 = Thread.new { discord.run }
t2 = Thread.new { @screen.build_display }
t1.join
t2.join
# screen.build_display
# sleep 5
