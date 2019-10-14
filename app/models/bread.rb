class Bread < Food
	validates :expiration_date, presence: true
	validates_inclusion_of :expiration_date, :in => Date.today..3.days.from_now, :message => "Food expiration date is limited to up to three days from today."
	validates :brand, presence: true
	validates_inclusion_of :brand, :in => %w(cheap expensive), :message => "The options for brand are only cheap and expensive." 
	validates :size, presence: true
	validates_inclusion_of :size, :in => %w(big small), :message => "The allowed sizes for bread are big and small."
end
