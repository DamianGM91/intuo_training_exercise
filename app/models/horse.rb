class Horse < Pet
	validates_inclusion_of :favorite_food, :in => %w(carrot grass water), :message => "Horse foods are restricted to carrot, grass and water."
end
