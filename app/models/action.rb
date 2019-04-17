class Action < ApplicationRecord
  has_many :plants_actions
  has_many :plants, through: :plants_actions
  accepts_nested_attributes_for :plants_actions, :allow_destroy => true, :reject_if => :no_action_id
  validates :action_name, presence: true
 
  private


  def no_action_id(attributes)
    attributes[:action_id] == nil
  end
end
