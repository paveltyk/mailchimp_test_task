class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :api_key

  private

  def api_key
    @mailchimp_api_key ||= session[:api_key]
  end
end
