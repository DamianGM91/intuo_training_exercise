class Cat < Pet
	validates_inclusion_of :favorite_food, :in => %w(milk water bread), :message => "Cat foods are restricted to milk, water and bread."
end
