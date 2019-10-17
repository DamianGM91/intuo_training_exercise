class BreadSerializer < ActiveModel::Serializer
  attributes :id, :fridge_id, :expiration_date, :brand, :size
end
