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
    action_attributes.values.each do |action_attribute|
      if action_attribute[:action_name].present?
        action = Action.find_or_create_by(action_attribute)
        self.actions << action
      end
    end
  end

end

# "actions_attributes"=>{
#   "0"=>{"plants_action_attributes"=>{"0"=>{"action_id"=>"0", "month"=>""}}, "id"=>"1"}, 
#   "1"=>{"plants_action_attributes"=>{"0"=>{"action_id"=>"1", "month"=>"2019-04-12"}}, "id"=>"2"}, 
#   "2"=>{"plants_action_attributes"=>{"0"=>{"action_id"=>"0", "month"=>""}}, "id"=>"3"}, 
#   "3"=>{"plants_action_attributes"=>{"0"=>{"action_id"=>"1", "month"=>"2019-05-18"}}, "id"=>"4"}, 
#   "4"=>{"plants_action_attributes"=>{"0"=>{"action_id"=>"0", "month"=>""}}, "id"=>"9"}}} 
#   permitted: false>, "commit"=>"Create Plant", "controller"=>"plants", "action"=>"create"} permitted: false>