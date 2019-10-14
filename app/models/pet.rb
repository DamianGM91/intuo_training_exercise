class Pet < ApplicationRecord
	belongs_to :user, class_name: "User", foreign_key: "owner_id", counter_cache: :pet_count
	
	validates :age, presence: true
	validates_inclusion_of :age, :in => 1..15, :message => "The pet's age must be between 1 and 15 years."
  validates :name, presence: true, length: {maximum: 100}
  validates :favorite_food, presence: true
end
