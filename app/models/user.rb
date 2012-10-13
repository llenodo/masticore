class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  include Mongoid::Timestamps #includes basic behavior for created_at and updated_at
  include Mongoid::MultiParameterAttributes #needed for date stuff -  see notes in railscast comments

  field :email, type: String
  field :password_digest, type: String

  has_secure_password

  #specify which attributes user can set through mass assignment
  #makes it so user cant change things like admin roles, etc through mass assignment
  attr_accessible :email, :password, :password_confirmation

  validates_uniqueness_of :email

end
