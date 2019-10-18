class CheeseSerializer < ActiveModel::Serializer
  attributes :id, :fridge_id, :expiration_date, :brand
end
