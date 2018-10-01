class Company < ApplicationRecord
  has_many :houses, dependent: :destroy
  has_many :realtors, dependent: :destroy

  #attr_accessor :name
  validates :name, :presence => true
  validates :website, :presence => true, uniqueness: true, format: { with: /\A((http|https):\/\/)?[a-zA-Z0-9\-#\/_]+[\.][a-zA-Z0-9\-\.#\/_]+\Z/i }
  validates :address, :presence => true
  validates :size, :presence => true, numericality: { only_integer: true }
  validates :year, :presence => true, numericality: { only_integer: true, greater_than: 1500, less_than_or_equal_to:  2018, message: "Invalid year" }, length: { maximum: 4,  too_long: "Invalid year" }
  validates :revenue, :presence => true, numericality: { only_integer: true }
  validates :synopsis, :presence => true
end
