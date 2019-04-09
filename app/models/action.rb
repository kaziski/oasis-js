class Action < ApplicationRecord
  has_many :plants_actions
  has_many :plants, through: :plants_actions
end

# "plants_actions_attributes"=>{
#   "0"=>{"action_id"=>"", "month"=>""}, 
#   "1"=>{"action_id"=>"2", "month"=>"2019-04-04"}, 
#   "2"=>{"action_id"=>"", "month"=>""}, 
#   "3"=>{"action_id"=>"4", "month"=>"2019-04-23"}}, 
#   "actions_attributes"=>{"0"=>{"action_name"=>"Fertilize"}}}, 

"plants_actions_attributes"=>{
  "0"=>{"action_id"=>"", "month"=>""}, 
  "1"=>{"action_id"=>"2", "month"=>"2019-04-05"}, 
  "2"=>{"action_id"=>"", "month"=>""}, 
  "3"=>{"action_id"=>"4", "month"=>"2019-04-30"}}, 
  "actions_attributes"=>{"0"=>{"action_name"=>"Fertilize", "plants_actions"=>{"month"=>"2019-04-09"}}}}
  # Need to add def actions_attributes and modify the strong params

  def plant_params
    params.require(:plant).permit(:name, :in_the_garden, :edible, :annual, :user_id, :note,
         :plants_actions_attributes => [:action_id, :month, 
          :actions_attributes => [:action_name. :plants_actions]])
  end

