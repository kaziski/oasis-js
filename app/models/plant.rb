class Plant < ApplicationRecord
  belongs_to :user
  has_many :plants_actions
  has_many :actions, through: :plants_actions
  accepts_nested_attributes_for :plants_actions, :allow_destroy => true
  accepts_nested_attributes_for :actions, :allow_destroy => true

  validates :name, presence: true
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


  def plants_actions_attributes=(plant_action_attribute)

    plant_action_attribute.values.each do |plant_action_hash|

    if plant_action_hash[:action_date].present?
        pa = PlantsAction.new(action_date: plant_action_hash[:action_date], action_id: plant_action_hash[:action_id])
        if self.plants_actions.find_by(action_id: plant_action_hash[:action_id])
          existing_pa = self.plants_actions.find_by(action_id: plant_action_hash[:action_id])
          existing_pa.destroy
        end
        self.plants_actions << pa
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

end

