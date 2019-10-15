class Horse < Pet
	validates_inclusion_of :favorite_food, :in => %w(Carrot Grass Water), :message => "Horse foods are restricted to Carrot, Grass and Water."
end
