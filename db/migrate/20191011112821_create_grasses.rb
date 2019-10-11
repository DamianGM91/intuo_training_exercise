class CreateGrasses < ActiveRecord::Migration[5.2]
  def change
    create_table :grasses do |t|

      t.timestamps
    end
  end
end
