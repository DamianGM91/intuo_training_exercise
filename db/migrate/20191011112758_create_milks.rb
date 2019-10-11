class CreateMilks < ActiveRecord::Migration[5.2]
  def change
    create_table :milks do |t|

      t.timestamps
    end
  end
end
