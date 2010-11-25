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

    def <<(member)
      Base.api_client.call "listSubscribe", id, member.email, member.merge_vars
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
