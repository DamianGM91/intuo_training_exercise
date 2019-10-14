class Carrot < Food
	validates :expiration_date, presence: true
	validates_inclusion_of :expiration_date, :in => Date.today..3.days.from_now, :message => "Food expiration date is limited to up to three days from today."
	validates :brand, presence: true
	validates_inclusion_of :brand, :in => %w(cheap expensive), :message => "The options for brand are only cheap and expensive."
	validates :color, presence: true
	validates_inclusion_of :color, :in => %w(orange purple white), :message => "The allowed colors for carrots are orange, purple and white."
end
