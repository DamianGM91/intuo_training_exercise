class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
    	t.string :type
    	t.integer :fridge_id
    	t.date :expiration_date
    	t.string :brand
    	t.decimal :volume, precision: 3, scale: 1
    	t.string :size
    	t.string :color
    end
  end
end
