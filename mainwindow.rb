class MainWindow
  def initialize
    @window = Window.new(MainScreen::MAIN_WINDOW_HEIGHT, MainScreen::MAIN_WINDOW_WIDTH, 1, 0)
    @window.scrollok true
    @window.idlok true
    @window.color_set 1
    @window.setpos MainScreen::MAIN_WINDOW_HEIGHT - 1, 0
  end

  def scroll
    @window.scroll
    @window.setpos MainScreen::MAIN_WINDOW_HEIGHT - 1, 0
  end

  def method_missing(m, *args)
    @window.send m, *args
  end
end
