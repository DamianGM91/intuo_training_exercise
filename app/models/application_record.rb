class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  self.table_name = "training_exercise"
end
