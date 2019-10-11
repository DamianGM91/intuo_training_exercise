class Pet < ApplicationRecord
	belongs_to :user, class_name: "User", foreign_key: "owner_id", counter_cache: :pet_count

	before_save :validate_age_limit
	before_update :validate_age_limit

	validates :age, presence: true, :inclusion => 1..15
  validates :name, presence: true, length: {maximum: 100}
  validates :favorite_food, presence: true

	def validate_age_limit
		if self.age < 1 || self.age > 15
			errors.add(:age, "The pet's age must be between 1 and 15 years.")
		end
	end
end
