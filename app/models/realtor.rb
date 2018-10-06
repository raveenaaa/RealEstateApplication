class Realtor < ApplicationRecord
  has_many :houses
  has_many :replies, dependent: :destroy
  belongs_to :company

  EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false,   message: "This account already exists. Go to Login" }, format: { with: EMAIL_FORMAT }
  validates :name, presence: true
  validates :password, presence: true, confirmation: true
  validates :phone, presence: true, length: { maximum: 15 }
  validates :company_id, presence: true

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

end