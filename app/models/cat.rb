class Cat < Pet
	validates_inclusion_of :favorite_food, :in => %w(Milk Water Bread), :message => "Cat foods are restricted to Milk, Water and Bread."
end
