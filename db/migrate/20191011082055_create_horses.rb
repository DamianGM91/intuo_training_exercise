class CreateHorses < ActiveRecord::Migration[5.2]
  def change
    create_table :horses do |t|

      t.timestamps
    end
  end
end
