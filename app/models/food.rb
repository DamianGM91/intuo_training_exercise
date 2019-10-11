class Food < ApplicationRecord
	belongs_to :fridge, class_name: "Fridge", foreign_key: "fridge_id"
end
