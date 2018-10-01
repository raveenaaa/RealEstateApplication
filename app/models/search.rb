class Search < ApplicationRecord
  def house
    @house ||= find_house
  end

  private

  def find_house
    house = House.order(:name)
    house = house.where("location like ?", "%#{location}%") if location.present?
    # house = house.where(category_id: category_id) if category_id.present?
    house = house.where("price >= ?", min_price) if min_price.present?
    house = house.where("price <= ?", max_price) if max_price.present?
    house = house.where("area <= ?", min_area) if min_area.present?
    house = house.where("area <= ?", max_area) if max_area.present?
    house
  end
end
