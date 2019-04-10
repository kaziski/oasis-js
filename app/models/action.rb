class Action < ApplicationRecord
  has_many :plants_actions
  has_many :plants, through: :plants_actions
  accepts_nested_attributes_for :plants_actions, :allow_destroy => true

end
