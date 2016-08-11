class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  include ActionController::Serialization

  before_filter :restrict_access

  def allow_forgery_protection
       false
  end

private

  def restrict_access
    authenticate_with_http_token do |token, options|
      ApiKey.exists?(access_token: token)
    end
  end

end
