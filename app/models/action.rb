class Action < ApplicationRecord
  has_many :plants_action
  has_many :plants, through: :plants_action
  accepts_nested_attributes_for :plants_action

  def plants_action_attributes=(plant_action_attributes)
    plant_action_attributes.values.each do |plant_action_hash|
    if plant_action_hash[:plants_action][:month].present?
      PlantsAction.create(
        month: action_hash[:plants_action][:month],
        action_id: action.id,
        plant_id: self.id
        )
      end
    end
end
  

end
#This is what's in params when changing to action_name to id. This happened after a session with Z?
# "actions_attributes"=>{
#   "0"=>{"plants_action_attributes"=>{"0"=>{"month"=>""}}, "id"=>"1"}, 
#   "1"=>{"plants_action_attributes"=>{"0"=>{"month"=>"2019-04-05"}}, "id"=>"2"}, 
#   "2"=>{"plants_action_attributes"=>{"0"=>{"month"=>""}}, "id"=>"3"}, 
#   "3"=>{"plants_action_attributes"=>{"0"=>{"month"=>"2019-04-24"}}, "id"=>"4"}}}

# "actions_attributes"=>{
#   "0"=>{"action_name"=>"", "plants_action_attributes"=>{"0"=>{"month"=>""}}, "id"=>"1"}, 
#   "1"=>{"action_name"=>"2", "plants_action_attributes"=>{"0"=>{"month"=>"2019-04-05"}}, "id"=>"2"}, 
#   "2"=>{"action_name"=>"", "plants_action_attributes"=>{"0"=>{"month"=>""}}, "id"=>"3"}, 
#   "3"=>{"action_name"=>"4", "plants_action_attributes"=>{"0"=>{"month"=>"2019-04-25"}}, "id"=>"4"}}}