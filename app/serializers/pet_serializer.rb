class PetSerializer < ActiveModel::Serializer
  attributes :id, :type, :name, :age, :favorite_food, :date_of_death, :owner_id
  type :pet
  # belongs_to :user
end
