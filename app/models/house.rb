class House < ApplicationRecord
  belongs_to :company
  belongs_to :realtor
  has_many :inquiries, dependent: :destroy
  has_many :favourites, dependent: :destroy

  validates :location, :presence => true
  validates :area, :presence => true    #Positive float validation
  validates :year, :presence => true, length: { maximum: 4,  too_long: "Invalid year" }, numericality: { only_integer: true, greater_than: 1500, less_than_or_equal_to:  2018, message: "Invalid year"}
  validates :style, :presence => true, format: { with: /single family|apartment|condo/i}
  validates :price, :presence => true, numericality: { only_integer: true }
  validates :floors, :presence => true, numericality: { only_integer: true }
  validates :basement, :presence => true, format: { with: /yes|no/i}
  validates :owner, :presence => true
  validates :realtor_id, :presence => true
  validates :company_id, :presence => true
  validates :name, :presence => true

end
