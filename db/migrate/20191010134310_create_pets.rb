class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
    	t.string :type
    	t.integer :owner_id
    	t.string :name
    	t.integer :age
    	t.string :favorite_food
    	t.date :date_of_death
    end
  end
end
