class User < ApplicationRecord
	has_one :fridge, class_name: "Fridge", dependent: :destroy, foreign_key: "owner_id"
	has_many :pets, class_name: "Pet", dependent: :destroy, foreign_key: "owner_id"

	before_create :downcase_email
	before_save :validate_date_of_birth
	before_update :validate_date_of_birth
	before_save :validate_pet_count
	before_update :validate_date_of_birth
	before_save :validate_age_for_fridge
	before_update :validate_age_for_fridge

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :first_name, presence: true, length: {maximum: 50}
  validates :last_name, presence: true, length: {maximum: 100}
  validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :date_of_birth, presence: true

  def downcase_email
    self.email = email.downcase
  end

  def validate_date_of_birth
  	if self.date_of_birth > Date.today
  		errors.add(:date_of_birth, "The date of birth can't be set in the future.")
  	end
  end

  def validate_pet_count
  	if self.pet_count != nil && self.pet_count > 3
  		errors.add(:pet_count, "No more than 3 pets are allowed per person.")
  	end
  end

  def calculate_age
  	((Time.zone.now - self.date_of_birth.to_time) / 1.year.seconds).floor
  end

  def validate_age_for_fridge
  	if self.fridge_id != nil && calculate_age < 18
  		errors.add(:fridge_id, "This user doesn't have the age required to have a fridge.")
  	end
  end
end
