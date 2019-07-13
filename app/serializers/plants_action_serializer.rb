class PlantsActionSerializer < ActiveModel::Serializer
  attributes :id, :action_date
  belongs_to :plant
  belongs_to :action
end
