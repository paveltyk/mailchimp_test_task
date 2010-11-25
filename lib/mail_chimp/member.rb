class MailChimp::Member
  attr_accessor :email, :merge_vars
  def initialize(email, merge_vars = {})
    @email = email
    @merge_vars = merge_vars
  end
end