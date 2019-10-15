class Mouse < Pet
	validates_inclusion_of :favorite_food, :in => %w(Water Cheese), :message => "Mouse foods are restricted to Water and Cheese."
end
