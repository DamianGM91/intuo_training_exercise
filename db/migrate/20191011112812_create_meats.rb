class CreateMeats < ActiveRecord::Migration[5.2]
  def change
    create_table :meats do |t|

      t.timestamps
    end
  end
end
