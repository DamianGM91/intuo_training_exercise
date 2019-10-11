class Fridge < ApplicationRecord
	belongs_to :user, class_name: "User", foreign_key: "owner_id"
	has_many :foods, class_name: "Food", dependent: :destroy
end
