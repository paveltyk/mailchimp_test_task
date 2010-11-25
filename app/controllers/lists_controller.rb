class ListsController < ApplicationController
  before_filter :setup_api_client

  def index
    @lists = MailChimp::List.all
  end

  def upload
    @list = MailChimp::List.all.find { |list| list.id == params[:id] }
    render :text => 'List could not be found' and return unless @list
    @uploaded_users = []
    User.all.each do |user|
      @uploaded_users << user if @list.add_member(user.build_mailchimp_member, :double_optin => false)
    end
  end

  private

  def setup_api_client
    MailChimp::Base.api_client = MailChimp::ApiClient.new(api_key)
  end
end
