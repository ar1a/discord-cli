require 'discordrb'

class DiscordManager
  def initialize(window)
    Discordrb::LOGGER.mode = :silent
    @bot = Discordrb::Bot.new type: :user, token: CONFIG.token
    @window = window

    @bot.message(in: CONFIG.channel) do |event|
      @window.add_message("<#{event.author.nick}> #{event.content}")
    end
  end

  def run
    @bot.run
  end
end

