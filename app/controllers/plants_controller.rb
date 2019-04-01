class PlantsController < ApplicationController
  before_action :set_plant, only: [:show, :edit, :update, :destroy]

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
  end

  def edit
    @user = current_user
  end

  def update
    @plant.update(plant_params)
    redirect_to plants_path
  end

  private 

  def plant_params
    params.require(:plant).permit(:name, :in_the_garden, :edible, :annual, :user_id, :note)
  end

  def set_plant
    @plant = Plant.find_by(id: params[:id])
  end
end
