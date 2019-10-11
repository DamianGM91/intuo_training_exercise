class Pet < ApplicationRecord
	belongs_to :user, class_name: "User", foreign_key: "owner_id", counter_cache: :pet_count
end
