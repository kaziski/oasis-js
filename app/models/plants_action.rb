class PlantsAction < ApplicationRecord
  belongs_to :plant, optional: true
  belongs_to :action, optional: true
  accepts_nested_attributes_for :action, :allow_destroy => true
  validates_presence_of :action, :scope => :action_id, :message => "must have a checkbox checked first, before selecting a date"
  validates_presence_of :action_date

  def action_attributes=(action_hash)
    action = Action.create(action_hash)
    self.action = action
  end
end
 