class FoodSerializer < ActiveModel::Serializer
  attributes :id, :type, :fridge_id, :expiration_date, :brand, :volume, :size, :color
  type :food
  # belongs_to :fridge
end
