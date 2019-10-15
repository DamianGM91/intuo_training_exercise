class Food < ApplicationRecord
	belongs_to :fridge, class_name: "Fridge", foreign_key: "fridge_id"

	validates_inclusion_of :type, :in => %w(Milk Water Cheese Bread Meat Carrot Grass), :message => "The allowed foods types are Milk, Water, Cheese, Bread, Meat, Carrot and Grass."
end
