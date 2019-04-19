class Plant < ApplicationRecord
  belongs_to :user
  has_many :plants_actions
  has_many :actions, through: :plants_actions
  accepts_nested_attributes_for :plants_actions, :allow_destroy => true
  accepts_nested_attributes_for :actions, :allow_destroy => true

  validates_presence_of :name, :message => "for plant can't be blank."
    
  def plants_actions_attributes=(plant_action_attribute)
    plant_action_attribute.values.each do |plant_action_hash|
    if plant_action_hash[:action_date].present?
      pa = PlantsAction.find_or_create_by(plant_id: self.id, action_id: plant_action_hash[:action_id])
      pa.update(action_date: plant_action_hash[:action_date])
      self.plants_actions << pa unless self.id
      end
    end
  end
  
  def actions_attributes=(action_attribute)
    if action_attribute["0"][:action_name].present? 
      action = Action.create(action_name: action_attribute["0"][:action_name])
      pa = PlantsAction.new(action_date: action_attribute["0"][:plants_actions_attributes]["0"][:action_date],
                            action_id: action.id) 
      self.plants_actions << pa
    end
  end

  def self.in_garden_msd(user)
    where(in_the_garden: true, user_id: user.id)
  end

  def self.edible_msg(user)
    where(edible: true, user_id: user.id)
  end

  def self.annual_msg(user)
    where(annual: true, user_id: user.id)
  end

end
