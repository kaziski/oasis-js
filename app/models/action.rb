class Action < ApplicationRecord
  has_many :plants_action
  has_many :plants, through: :plants_action
  accepts_nested_attributes_for :plants_action

  def plants_action_attributes=(plant_action_attributes)
    plant_action_attributes.values.each do |plant_action_attribute|
      if plant_action_attribute[:month].present?
        plant_action = Action.find_or_create_by(plant_action_attribute)
        self.plants_action << plant_action
      end
    end
  end

end

