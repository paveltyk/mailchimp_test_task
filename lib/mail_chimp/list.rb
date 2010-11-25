module MailChimp
  class List

    def self.all
      Base.api_client.call("lists").map { |list_options| List.new list_options }
    end

    def initialize options = {}
      @options = options.symbolize_keys
    end

    def id
      @options[:id]
    end

    def to_param
      id
    end

    def self.model_name
      "list".tap do |name|
        def name.plural; "lists"; end;
        def name.singular; "list"; end;
      end
    end

    def add_member(member, opts = {})
      opts.reverse_merge! :email_type => 'html', :double_optin => true, :update_existing => false, :replace_interests => true, :send_welcome => false
      Base.api_client.call "listSubscribe",
                           self.id,
                           member.email,
                           member.merge_vars,
                           opts[:email_type],
                           opts[:double_optin],
                           opts[:update_existing],
                           opts[:replace_interests],
                           opts[:send_welcome]
    end

    def <<(member)
      add_member(member)
    end

    def method_missing(method_name, *args)
      if @options.has_key? method_name
        return @options[method_name]
      else
        super
      end
    end
  end
end
