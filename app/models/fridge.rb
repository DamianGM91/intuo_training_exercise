class Fridge < ApplicationRecord
	belongs_to :user, class_name: "User", foreign_key: "owner_id"
	has_many :foods, class_name: "Food", dependent: :destroy, foreign_key: "fridge_id"

	before_save :validate_last_technical_check_date
	before_update :validate_last_technical_check_date

	validates :brand, presence: true
	validates_inclusion_of :brand, :in => %w(Siemens Whirpool AEG), :message => "The allowed brands for fridges are Siemens, Whirpool and AEG."

	def validate_last_technical_check_date
  	if self.last_technical_check > Date.today
  		errors.add(:last_technical_check, "The date of the last technical check can't be set in the future.")
  	end
  end
end
