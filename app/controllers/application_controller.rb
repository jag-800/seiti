class ApplicationController < ActionController::Base
  
require "openai"
require 'dotenv'
Dotenv.load

  before_action :set_common_variable

  private

  # APIキーを設定
  def set_common_variable
    @client = OpenAI::Client.new(api_key: ENV["YOUR_ENV_VARIABLE_FOR_API_KEY"])
  end


end
