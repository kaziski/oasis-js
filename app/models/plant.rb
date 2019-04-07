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

  #Using id
  # def actions_attributes=(action_attributes)
  #   action_attributes.values.each do |action_hash|
  #     binding.pry
  #     if action_hash[:action_id].present?
  #       action = Action.find_or_create_by(id: action_hash[:action_id])
  #       self.actions << action
  #     end
  #   end
  # end

  def actions_attributes=(action_attributes)
    action_attributes.values.each do |action_attribute|
      if action_attribute[:action_name].present?
        action = Action.find_or_create_by(id: action_attribute[:action_name])
        self.actions << action
      end
    end
  end



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
