class Plant < ApplicationRecord
  belongs_to :user
  has_many :plants_action
  has_many :actions, through: :plants_action
  accepts_nested_attributes_for :actions, :allow_destroy => true

  validates :name, uniqueness: true, presence: true
  validates_inclusion_of :in_the_garden?, in: [true, false]
  validates_inclusion_of :edible?, in: [true, false]
  validates_inclusion_of :annual?, in: [true, false]

  def self.show_all_ingarden(user) 
    where(user_id: user.id, in_the_garden: true )
  end

  def self.show_all_edible(user) 
    where(user_id: user.id, edible: true )
  end

  def self.show_all_annual(user)
    where(user_id: user.id, annual: true )
  end

  def actions_attributes=(action_attributes)
    action_attributes.values.each do |action_hash|

      if action_hash[:plants_action][:month].present?
        action = Action.find_or_create_by(id: action_hash[:id])
        PlantsAction.create(
          month: action_hash[:plants_action][:month],
          action_id: action.id,
          plant_id: self.id
          )
        # pa_hash = plants_action_attributes[0]
        self.actions << action
      end
    end
  end
# "actions_attributes"=>{
#   "0"=>{"action_name"=>"", "plants_action_attributes"=>{"0"=>{"month"=>""}}, "id"=>"1"}, 
#   "1"=>{"action_name"=>"2", "plants_action_attributes"=>{"0"=>{"month"=>"2019-04-05"}}, "id"=>"2"}, 
#   "2"=>{"action_name"=>"", "plants_action_attributes"=>{"0"=>{"month"=>""}}, "id"=>"3"}, 
#   "3"=>{"action_name"=>"4", "plants_action_attributes"=>{"0"=>{"month"=>"2019-04-25"}}, "id"=>"4"}}} permitted: false>, "commit"=>"Create Plant", "controller"=>"plants", "action"=>"create"}

  # def plants_action_attributes=(plant_action_attributes)
  #   plant_action_attributes.values.each do |plant_action_attribute|
  #     binding.pry
  #     if plant_action_attribute[:month].present?
  #       plant_action = PlantsAction.find_or_create_by(plant_action_attribute)
  #       self.plants_action << plant_action
  #     end
  #   end
  # end

end
