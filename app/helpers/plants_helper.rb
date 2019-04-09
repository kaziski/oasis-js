module PlantsHelper

  def in_the_garden?
    if @plant.in_the_garden == true
      "Yes"
    else
      "No"
    end
  end

  def edible?
    if @plant.edible == true
      "Yes"
    else
      "No"
    end
  end

  def annual?
    if @plant.annual == true
      "Yes"
    else
      "No"
    end
  end

  def memo
    if @plant.note.present?
      "Memo: #{@plant.note}"
    end
  end

  def find_action_name(pa)
    # binding.pry
    id = pa.object.action
    Action.find(id).action_name 
  end 


end
