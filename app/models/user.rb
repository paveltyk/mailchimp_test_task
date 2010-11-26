class User
  include Mongoid::Document
  field :fname
  field :lname
  field :email
  key :email
  validates_uniqueness_of :email
  validates_presence_of :email, :fname, :lname
  validates_format_of :email, :with => /^[A-Z0-9_\.%\+\-]+@(?:[A-Z0-9\-]+\.)+(?:[A-Z]{2,4}|museum|travel)$/i
  validates_length_of :email, :maximum => 30
  validates_length_of :fname, :maximum => 30
  validates_length_of :lname, :maximum => 30

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
