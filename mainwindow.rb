# The main window
class MainWindow
  def initialize
    @window = Window.new(
      MainScreen::MAIN_WINDOW_HEIGHT,
      MainScreen::MAIN_WINDOW_WIDTH,
      1,
      0
    )
    @window.scrollok true
    @window.idlok true
    @window.color_set 1
    @window.setpos MainScreen::MAIN_WINDOW_HEIGHT - 1, 0
  end

  def scroll
    @window.scroll
    @window.setpos MainScreen::MAIN_WINDOW_HEIGHT - 1, 0
  end

  def draw_prompt
    @window.setpos MainScreen::MAIN_WINDOW_HEIGHT, 0
    @window << '> '
    @window.setpos MainScreen::MAIN_WINDOW_HEIGHT, 2
    @window.refresh
  end

  def add_message(msg)
  end

  def take_input
    loop do
      input = @window.getstr
      @window.refresh
      # TODO: Post message
      draw_prompt
    end
  end

  def method_missing(m, *args)
    @window.send m, *args
  end
end
