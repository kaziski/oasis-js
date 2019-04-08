class Plant < ApplicationRecord
  belongs_to :user
  has_many :plants_action
  has_many :actions, through: :plants_action
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


  def actions_attributes=(action_attributes)
    action_attributes.values.each do |action_attribute|
      if action_attribute[:id].present?
        binding.pry
        action = Action.find_or_create_by(id: action_attribute[:id])
        self.actions << action
      end
    end
  end

  # def actions_attributes=(action_attributes)
  #   action_attributes.values.each do |action_hash|
  #      if action_hash[:id].present?
  #       action = Action.find_or_create_by(id: action_hash[:id])
  #       self.actions << action
  #     end
  #   end
  # end
end

# TO DO: Make sure it creates or find an action.
# Make sure it shows on the show page.