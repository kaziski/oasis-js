class AddAnnualToPlants < ActiveRecord::Migration[5.2]
  def change
    add_column :plants, :annual, :boolean
  end
end
