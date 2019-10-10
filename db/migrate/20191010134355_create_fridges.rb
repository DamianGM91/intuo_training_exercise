class CreateFridges < ActiveRecord::Migration[5.2]
  def change
    create_table :fridges do |t|
    	t.integer :owner_id
    	t.string :brand
    	t.date :last_technical_check
    end
  end
end
