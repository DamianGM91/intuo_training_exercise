class MouseSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :favorite_food, :date_of_death, :owner_id
end
