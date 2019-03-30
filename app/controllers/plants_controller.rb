class PlantsController < ApplicationController

  def index
    @plants = Plant.all
  end

  def new
    @user = current_user
    @plant = @user.plants.build
    # @plant = Plant.new(user_id: current_user.id)
  end

  def create
    binding.pry
    
  #   @plant = Plant.new(plant_params)
  #   @plant.save
  # #   redirect_to plant_path(@plant)
  #   @plant = Plant.new(plant_params)
  #   if @plant.save
  #     redirect_to plant_path(@plant)
    # else
    #   render :new
    # end
  end

  private 

  def plant_params
    params.require(:plant).permit(:name, :in_the_garden, :edible, :annual, :user_id)
  end
end
