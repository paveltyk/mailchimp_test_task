class ApiKeyController < ApplicationController
  def new;end

  def create
    session[:api_key] = params[:api_key]
    redirect_to :action => :new
  end

  def destroy
    session[:api_key] = nil
    redirect_to :action => :new
  end

end
