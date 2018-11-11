class Inquiry < ApplicationRecord
  belongs_to :house
  belongs_to :house_hunter
  has_many :replies, dependent: :destroy

  validates :subject, presence: true
  validates :message, presence: true
  validates :house_hunter_id, presence: true
  validates :house_id, presence: true
end