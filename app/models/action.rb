class Action < ApplicationRecord
  has_many :plants_action
  has_many :plants, through: :plants_action
  # accepts_nested_attributes_for :plants_actions

  # def plants_action_attributes=(plant_action_attributes)
  #   plant_action_attributes.values.each do |plant_action_attribute|
  #     if plant_action_attribute[:month].present?
  #       plant_action = PlantsAction.find_or_create_by(plant_action_attribute)
  #       self.plants_action << plant_action
  #     end
  #   end
  # end

end


# "actions_attributes"=>{
#   "0"=>{"action_name"=>"", "plants_action_attributes"=>{"0"=>{"month"=>""}}, "id"=>"1"}, 
#   "1"=>{"action_name"=>"2", "plants_action_attributes"=>{"0"=>{"month"=>"2019-04-05"}}, "id"=>"2"}, 
#   "2"=>{"action_name"=>"", "plants_action_attributes"=>{"0"=>{"month"=>""}}, "id"=>"3"}, 
#   "3"=>{"action_name"=>"4", "plants_action_attributes"=>{"0"=>{"month"=>"2019-04-25"}}, "id"=>"4"}}} permitted: false>, "commit"=>"Create Plant", "controller"=>"plants", "action"=>"create"}
# "actions_attributes"=>{
#   "0"=>{"action_name"=>"", "plants_action_attributes"=>{"0"=>{"month"=>""}}, "id"=>"1"}, 
#   "1"=>{"action_name"=>"2", "plants_action_attributes"=>{"0"=>{"month"=>"2019-04-05"}}, "id"=>"2"}, 
#   "2"=>{"action_name"=>"", "plants_action_attributes"=>{"0"=>{"month"=>""}}, "id"=>"3"}, 
#   "3"=>{"action_name"=>"4", "plants_action_attributes"=>{"0"=>{"month"=>"2019-04-25"}}, "id"=>"4"}}} permitted: false>, "commit"=>"Create Plant", "controller"=>"plants", "action"=>"create"}