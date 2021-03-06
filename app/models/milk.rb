class Milk < Food
	validates :expiration_date, presence: true
	validates_inclusion_of :expiration_date, :in => Date.today..3.days.from_now, :message => "Food expiration date is limited to up to three days from today."
	validates :brand, presence: true
	validates_inclusion_of :brand, :in => %w(Cheap Expensive), :message => "The options for brand are only Cheap and Expensive." 
	validates :volume, presence: true
	validates_inclusion_of :volume, :in => 0.5..1, :message => "Milk volume has to be between 0.5 and 1 liters."
end
