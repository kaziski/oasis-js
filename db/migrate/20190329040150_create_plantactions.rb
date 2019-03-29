class CreatePlantactions < ActiveRecord::Migration[5.2]
  def change
    create_table :plantactions do |t|
      t.date :month
      t.string :plant_id
      t.string :user_id
      t.timestamps
    end
  end
end
