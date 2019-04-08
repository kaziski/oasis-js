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

# name"=>"Pepper", 
# "in_the_garden"=>"0", 
# "edible"=>"1", 
# "annual"=>"0", 
# "note"=>"", 
# "user_id"=>"4", "actions_attributes"=>{
#   "0"=>{"action_name"=>"", "plants_action_attributes"=>{"0"=>{"month"=>""}}, "id"=>"1"}, 
#   "1"=>{"action_name"=>"2", "plants_action_attributes"=>{"0"=>{"month"=>"2019-04-04"}}, "id"=>"2"}, 
#   "2"=>{"action_name"=>"", "plants_action_attributes"=>{"0"=>{"month"=>""}}, "id"=>"3"}, 
#   "3"=>{"action_name"=>"4", "plants_action_attributes"=>{"0"=>{"month"=>"2019-04-19"}}, "id"=>"4"}}} permitted: false>

# "name"=>"Pepper", 
# "in_the_garden"=>"0", 
# "edible"=>"1", 
# "annual"=>"0", 
# "note"=>"", 
# "user_id"=>"4", "actions_attributes"=>{
#   "0"=>{"action_name"=>"", "plants_action_attributes"=>{"0"=>{"month"=>""}}, "id"=>"1"}, 
#   "1"=>{"action_name"=>"2", "plants_action_attributes"=>{"0"=>{"month"=>"2019-04-12"}}, "id"=>"2"}, 
#   "2"=>{"action_name"=>"", "plants_action_attributes"=>{"0"=>{"month"=>""}}, "id"=>"3"}, 
#   "3"=>{"action_name"=>"4", "plants_action_attributes"=>{"0"=>{"month"=>"2019-04-30"}}, "id"=>"4"}}} permitted: false>,