# frozen_string_literal: true

# Controller for the settings
class SettingsController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def display_settings
    puts params
    user = User.find(params[:id])
    respond_to do |format|
      response = { font: user.font,
                   background_colour: user.background_colour }
      format.json  { render json: response }
    end
  end

  def update_settings
    puts params
    parsed_json = params[:setting]
    user = User.find(parsed_json[:userId])
    user.update(font: parsed_json[:font],
                background_colour: parsed_json[:background_colour])
  end
end
