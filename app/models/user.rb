class User
  include Mongoid::Document
  field :fname
  field :lname
  field :email
  validates_uniqueness_of :email
end
