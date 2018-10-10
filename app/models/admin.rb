class Admin < ApplicationRecord
  EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, uniqueness: { case_sensitive: false,   message: "This account already exists. Go to Login" }, format: { with: EMAIL_FORMAT }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

end
