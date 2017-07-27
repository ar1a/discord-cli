require 'curses'

include Curses

init_screen
curs_set 0
start_color if has_colors?
begin
  static_win = Window.new(lines / 2 - 1, cols / 2 - 1, 0, 0)
  static_win.box "o", "o"
  static_win.setpos(2, 2)
  static_win.addstr("Gay memes here")
  static_win.refresh

  animation_win = Window.new(lines / 2 - 1, cols / 2 - 1, lines / 2, cols / 2)

  animation_win.box "|", "-"
  animation_win.refresh
  2.upto(animation_win.maxx - 3) do |i|
    animation_win.setpos animation_win.maxy / 2, i
    animation_win << '*'
    animation_win.refresh
    sleep 0.05
  end

  sleep 0.5
  static_win.clear
  static_win.refresh
  static_win.close
  sleep 0.5
  animation_win.clear
  animation_win.refresh
  animation_win.close
  sleep 0.5
ensure
  close_screen
end
