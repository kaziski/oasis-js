module WelcomeHelper

  def number_of_plants
    @plants.select{|plant| plant.user_id == current_user.id}.count
  end
end
