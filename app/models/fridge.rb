class Fridge < ApplicationRecord
	belongs_to :user, class_name: "User"
	has_many :foods, class_name: "Food", dependent: :destroy, foreign_key: "fridge_id"
end
