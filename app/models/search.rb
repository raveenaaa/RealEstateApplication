class Search < ApplicationRecord
  def search_houses
    houses = House.all
    houses = houses.where("location like ?", "%#{location}%") if location.present?
    # house = house.where(category_id: category_id) if category_id.present?
    houses = houses.where("price >= ?", min_price) if min_price.present?
    houses = houses.where("price <= ?", max_price) if max_price.present?
    houses = houses.where("area >= ?", min_area) if min_area.present?
    houses = houses.where("area <= ?", max_area) if max_area.present?
    houses
  end
end
