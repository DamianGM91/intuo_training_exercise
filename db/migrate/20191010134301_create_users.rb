class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
    	t.string :first_name
    	t.string :last_name
    	t.string :email
    	t.date :date_of_birth
    	t.integer :pet_count, counter_cache: true
    	t.integer :fridge_id
    end
  end
end
