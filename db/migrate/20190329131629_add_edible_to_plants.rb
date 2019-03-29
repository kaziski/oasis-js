class AddEdibleToPlants < ActiveRecord::Migration[5.2]
  def change
    add_column :plants, :edible, :boolean
  end
end
