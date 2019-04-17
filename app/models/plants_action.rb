class PlantsAction < ApplicationRecord
  belongs_to :plant, optional: true
  belongs_to :action, optional: true
  # validate :action_presence

  # private

  # def action_presence
  #   if self.action == nil
  #     errors.add(:action, "You need to check a checkbox first before selecting a date.")
  #   end
  # end
end
