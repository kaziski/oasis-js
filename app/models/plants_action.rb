class PlantsAction < ApplicationRecord
  belongs_to :plant, optional: true
  belongs_to :action, optional: true
  validates_presence_of :action, :scope => :action_id, :message => "must have a checkbox checked first, before selecting a date"


end
