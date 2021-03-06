# frozen_string_literal: true

# words to calm down rubocop
class MessageBroadcastJob < ApplicationJob
  queue_as :default
  # :nocov:
  def perform(message)
    ActionCable.server.broadcast 'room_channel',
                                 message: render_message(message)
  end

  private

  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/message',
                                          locals: { message: message })
  end
end

# :nocov:
