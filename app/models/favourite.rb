class Favourite < ApplicationRecord
  belongs_to :house_hunter
  belongs_to :house

  validates :house_hunter_id, presence: true
  validates :house_id, presence: true
end
