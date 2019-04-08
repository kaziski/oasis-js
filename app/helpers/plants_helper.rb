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

  
  # def find_action_name
  #   @plant.plants_action.each do |ppa|
  #     id = ppa.action_id
  #     Action.find(id)
  #   end
  # end
  def find_action_name(pao)
    id = pao.action_id
    Action.find(id).action_name 
  end 


end
