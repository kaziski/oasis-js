class Action < ApplicationRecord
  has_many :plantactions
  has_many :plants, through: :plantactions
end
