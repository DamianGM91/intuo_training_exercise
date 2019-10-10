class Entity < ApplicationRecord
	self.table_name = "training_exercise"

  def check_type
  	self.type
  end
end
