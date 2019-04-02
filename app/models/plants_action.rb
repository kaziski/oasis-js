class PlantsAction < ApplicationRecord
  belongs_to :plant
  belongs_to :action
end
