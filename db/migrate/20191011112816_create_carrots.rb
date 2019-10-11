class CreateCarrots < ActiveRecord::Migration[5.2]
  def change
    create_table :carrots do |t|

      t.timestamps
    end
  end
end
