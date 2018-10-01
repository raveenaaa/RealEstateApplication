class Inquiry < ApplicationRecord
  belongs_to :house
  belongs_to :house_hunter

  validates :subject, presence: true
  validates :message, presence: true
  validates :house_hunter_id, presence: true
  validates :house_id, presence: true
end