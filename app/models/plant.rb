class Plant < ApplicationRecord
  belongs_to :user
  has_many :plantactions
  has_many :actions, through: :plantactions
  accepts_nested_attributes_for :plantactions
  validates :name, uniqueness: true, presence: true
  validates_inclusion_of :in_the_garden?, in: [true, false]
  validates_inclusion_of :edible?, in: [true, false]
  validates_inclusion_of :annual?, in: [true, false]
end
