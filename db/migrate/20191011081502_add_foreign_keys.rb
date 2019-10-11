class AddForeignKeys < ActiveRecord::Migration[5.2]
  def change
  	add_foreign_key :pets, :users, column: :owner_id
  	add_foreign_key :fridges, :users, column: :owner_id
  	add_foreign_key :foods, :fridges, column: :fridge_id
  end
end