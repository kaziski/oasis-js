class PlantsController < ApplicationController
  def index
  end

  # def new
  #   @user = current_user
  # end

  def create
    @plant = Plant.new(plant_params(:name, :in_the_garden, :edible, :annual))
    @plant.save
    redirect_to plant_path(@plant)
  end
end
