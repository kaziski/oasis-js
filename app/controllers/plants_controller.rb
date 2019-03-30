class PlantsController < ApplicationController

  def index
    @plants = Plant.all
  end

  def new
    @user = current_user
    @plant = @user.plants.build
  end

  def create
    @plant = Plant.new(plant_params)
    if @plant.save
      redirect_to plants_path
      # redirect_to plant_path(@plant)
    else
      render :new
    end
  end

  def show
  end

  private 

  def plant_params
    params.require(:plant).permit(:name, :in_the_garden, :edible, :annual, :user_id)
  end
end
