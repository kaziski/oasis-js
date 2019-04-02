class Action < ApplicationRecord
  has_many :plants_action
  has_many :plants, through: :plants_action
  # accepts_nested_attributes_for :plantactions
end
