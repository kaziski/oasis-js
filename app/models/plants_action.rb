class PlantsAction < ApplicationRecord
  belongs_to :plant, optional: true
  belongs_to :action, optional: true
  # accepts_nested_attributes_for :actions, :allow_destroy => true
end
