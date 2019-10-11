class CreateWaters < ActiveRecord::Migration[5.2]
  def change
    create_table :waters do |t|

      t.timestamps
    end
  end
end
