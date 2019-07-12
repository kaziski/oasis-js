class PlantSerializer < ActiveModel::Serializer
  attributes :id, :name, :in_the_garden, :edible, :annual
end
