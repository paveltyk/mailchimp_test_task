module MailChimp
  class ApiClient
    attr_reader :api_key
  
    def initialize(api_key)
      @api_key = api_key
      @api_client = XMLRPC::Client.new_from_uri "http://#{dc}.api.mailchimp.com/#{Base::API_VERSION}/"
    end

    # data center
    def dc
      api_key.split('-').last
    end

    def call(method, *args)
      @api_client.call(method, @api_key, *args)
    end
  end
end
