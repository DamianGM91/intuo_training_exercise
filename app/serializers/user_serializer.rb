class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :date_of_birth, :pet_count, :fridge_id
  # has_many :pets
  # has_one :fridge
end
