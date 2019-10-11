class User < ApplicationRecord
	has_one :fridge, class_name: "Fridge", dependent: :destroy, foreign_key: "owner_id"
	has_many :pets, class_name: "Pet", dependent: :destroy, foreign_key: "owner_id"
end
