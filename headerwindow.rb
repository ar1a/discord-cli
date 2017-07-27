class HeaderWindow
  def initialize
    @window = Window.new(
      MainScreen::HEADER_HEIGHT,
      MainScreen::HEADER_WIDTH,
      0,
      0
    )
    @window.color_set 2
  end

  def build_display
    @window << 'Discord CLI'.center(MainScreen::HEADER_WIDTH)
    @window.refresh
  end
end
