class User
  include Mongoid::Document
  field :fname
  field :lname
  field :email
  validates_uniqueness_of :email

  def build_mailchimp_member
    MailChimp::Member.new email, 'FNAME' => fname, 'LNAME' => lname
  end
end
