class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :authenticate

  def current_user
    puts request.headers['authentication']
    @current_user ||= authenticate_with_http_token do |token, options|
      puts token
      puts options
      User.active.find_by(access_token: token)
    end
  end

  def authenticate
    unless current_user
      render json: { error: "You are not authorized", status: 403 }
    end
  end
end
