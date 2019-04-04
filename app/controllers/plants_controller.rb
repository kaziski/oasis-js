class PlantsController < ApplicationController
  before_action :set_plant, only: [:show, :edit, :update]

  def index
    @plants = Plant.all
  end

  def new
    @user = current_user
    @plant = @user.plants.build
  end

  def create
    @plant = Plant.new(plant_params)
    binding.pry
    if @plant.save
      redirect_to plant_path(@plant)
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

  def destroy
    Plant.find(params[:id]).destroy
    redirect_to plants_path
  end

  def in_garden
    @plants = Plant.show_all_ingarden(current_user)
  end

  def edible
    @plants = Plant.show_all_edible(current_user)
  end

  def annual
    @plants = Plant.show_all_annual(current_user)
  end

  private 

  def plant_params
    params.require(:plant).permit(:name, :in_the_garden, :edible, :annual, :user_id, :note, 
      # actions_attributes: [:action_name, plants_actions:[:action_id, :month]])
        actions_attributes: [:action_name, plants_action_attributes:[:action_id, :month]])

  end

  def set_plant
    @plant = Plant.find_by(id: params[:id])
  end

end
