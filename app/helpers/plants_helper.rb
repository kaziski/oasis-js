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

  def show_in_the_garden
    @planted = @plants.select {|plant| plant.user_id.to_i == current_user.id && plant.in_the_garden? == true}
    @planted.map{|p|p.name}.shift.strip
  end

  def show_all_edible
    @planted = @plants.select {|plant| plant.user_id.to_i == current_user.id && plant.edible? == true}
    @planted.map{|p|p.name}.shift.strip
  end

  def show_all_annual
    @planted = @plants.select {|plant| plant.user_id.to_i == current_user.id && plant.annual? == true}
    @planted.map{|p|p.name}.shift.strip
  end


end
