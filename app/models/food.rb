class Food < ApplicationRecord
	belongs_to :fridge, class_name: "Fridge"
end
