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

    if plant_action_hash[:month].present?
      pa = PlantsAction.new(
        month: plant_action_hash[:month],
        action_id: plant_action_hash[:action_id],
        )
        self.plants_actions << pa
      end
    end
  end

end
