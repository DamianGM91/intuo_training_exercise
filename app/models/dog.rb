class Dog < Pet
	validates_inclusion_of :favorite_food, :in => %w(Water Meat), :message => "Dog foods are restricted to Water and Meat."
end
