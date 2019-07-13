class ActionSerializer < ActiveModel::Serializer
  attributes :id, :action_name
  belongs_to :plant
end
