class Pet < ApplicationRecord
	belongs_to :user, class_name: "User", foreign_key: "owner_id", counter_cache: :pet_count

	after_validation :upcase_name

	validates_inclusion_of :type, :in => %w(Cat Dog Horse Mouse), :message => "Valid pets are restricted to Cat, Dog, Horse and Mouse."
	validates :age, presence: true
	validates_inclusion_of :age, :in => 1..15, :message => "The pet's age must be between 1 and 15 years."
  validates :name, presence: true, length: {maximum: 100}
  validates :favorite_food, presence: true
  validates :owner_id, presence: true

  def upcase_name
    self.name = name.capitalize unless self.name == nil
  end
end
