module WelcomeHelper

  def number_of_plants
    @plants.select{|plant| plant.user_id.to_i == current_user.id}.count
  end
end
