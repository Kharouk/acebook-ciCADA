# frozen_string_literal: true

class RoomsController < ApplicationController
  def show
    @messages = Message.all
    @user = current_user
  end
end
