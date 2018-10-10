class HouseHunter < ApplicationRecord
  has_many :inquiries, dependent: :destroy
  has_many :favourites, dependent: :destroy

  EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false,   message: "This account already exists. Go to Login"  }, format: { with: EMAIL_FORMAT }
  validates :phone, presence: true, length: { maximum: 15 }
  validates :preferred, presence: true, format: { with: /email|text|phone/i, message: "Can only be email, text or phone"}

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

end

