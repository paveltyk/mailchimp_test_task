class User
  include Mongoid::Document
  field :fname
  field :lname
  field :email
  key :email
  validates_uniqueness_of :email
  validates_presence_of :email, :fname, :lname


  def build_mailchimp_member
    MailChimp::Member.new email, 'FNAME' => fname, 'LNAME' => lname
  end

  def name
    [fname, lname].delete_if(&:blank?).join(' ')
  end

  def to_s
    [name, "<#{email}>"].delete_if(&:blank?).join(' ')
  end
end
