class CarrotSerializer < ActiveModel::Serializer
  attributes :id, :fridge_id, :expiration_date, :brand, :color
end
