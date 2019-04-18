class Action < ApplicationRecord
  has_many :plants_actions
  has_many :plants, through: :plants_actions
  accepts_nested_attributes_for :plants_actions, :allow_destroy => true
  validates :action_name, presence: true
  validates_uniqueness_of :action_name, :message => "must be unique"


  def plants_actions_attributes=(plant_action_attribute)
    plant_action_attribute.values.each do |plant_action_hash|
      binding.pry
      pa = PlantsAction.create(plant_id: self.plant_id, action_id: plant_action_hash[:action_id])
      pa.update(action_date: plant_action_hash[:action_date])
      self.plants_actions << pa unless self.id
      
    end
  end
end
