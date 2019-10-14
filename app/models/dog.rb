class Dog < Pet
	validates_inclusion_of :favorite_food, :in => %w(water meat), :message => "Dog foods are restricted to water and meat."
end
