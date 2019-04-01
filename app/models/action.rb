class Action < ApplicationRecord
  has_many :plantactions
  has_many :plants, through: :plantactions
  accepts_nested_attributes_for :plantactions
end
