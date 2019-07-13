class PlantSerializer < ActiveModel::Serializer
  attributes :id, :name, :in_the_garden, :edible, :annual
  has_many :actions
  has_many :plants_actions
end
