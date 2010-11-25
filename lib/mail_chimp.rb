require 'active_support'
require 'xmlrpc/client'

module MailChimp
  class StandardError < ::StandardError;end
  class ApiClientError < StandardError;end
end

Dir[File.expand_path(File.join(File.dirname(__FILE__),'mail_chimp','**','*.rb'))].each {|f| require f}


