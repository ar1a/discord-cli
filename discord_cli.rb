require 'curses'
require_relative 'mainwindow'

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
    noecho
    nonl
    stdscr.keypad true
    raw
    stdscr.nodelay = 1
    init_screen
    start_color
    init_pair(1, COLOR_CYAN, COLOR_BLACK)
    init_pair(2, COLOR_WHITE, COLOR_CYAN)
  end

  def build_display
    @main_window = MainWindow.new
    @main_window << 'wew lad'
    @main_window.refresh
  end
end

screen = MainScreen.new
screen.build_display
sleep 5
