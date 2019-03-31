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
    else
      render :new
    end
  end

  def show
    @plant = Plant.find_by(id: params[:id])
  end

  def edit
    @user = current_user
    @plant = Plant.find_by(id: params[:id])
  end

  def update
    @plant = Plant.find_by(id: params[:id])
    @plant.update(plant_params)
    redirect_to plants_path
  end

  private 

  def plant_params
    params.require(:plant).permit(:name, :in_the_garden, :edible, :annual, :user_id, :note)
  end
end
