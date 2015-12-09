class User < ActiveRecord::Base
  before_save { email.downcase! }
  validates :name, presence: true , length: { maximum: 50 }
  VALD_EMAIL_REGEX = /\A[\w+-.]+@([a-z0-9-]+[.]){1,}[a-z]+\z/i
  validates :email, presence: true, format: { with: VALD_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}
  validates :password, length: { minimum: 6 }            

  has_secure_password            
end
