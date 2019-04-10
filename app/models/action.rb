class Action < ApplicationRecord
  has_many :plants_actions
  has_many :plants, through: :plants_actions
  accepts_nested_attributes_for :plants_actions, :allow_destroy => true

  # def plants_actions_attributes=(plant_action_attribute)
  #   binding.pry

  #   # if action_attribute["0"][:action_name].present?  
  #   #   # Action.create(action_name: action_attribute["0"][:action_name]
  #   #     # month:  action_attribute["0"][:plants_actions][:month] ) 
  #   # end
  # end

end
