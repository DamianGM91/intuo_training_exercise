class Mouse < Pet
	validates_inclusion_of :favorite_food, :in => %w(water cheese), :message => "Mouse foods are restricted to water and cheese."
end
