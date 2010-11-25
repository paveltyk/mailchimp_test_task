class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def api_key
    @mailchimp_api_key ||= session[:api_key]
  end
end
