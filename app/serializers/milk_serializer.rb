class MilkSerializer < ActiveModel::Serializer
  attributes :id, :fridge_id, :expiration_date, :brand, :volume
end
