class Plant < ApplicationRecord
  belongs_to :user
  has_many :plantactions
  has_many :actions, through: :plantactions
end
