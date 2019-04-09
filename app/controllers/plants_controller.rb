class PlantsController < ApplicationController
  before_action :set_plant, only: [:show, :edit, :update]

  def index
    @plants = Plant.all
  end

  def new
    @plant = Plant.new
    Action.all.each do |action|
      @plant.plants_actions.build(action_id: action.id)
    end
    @plant.actions.build.plants_actions.build
  end

  def create
    binding.pry
    @plant = current_user.plants.new(plant_params)
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
         :plants_actions_attributes => [:action_id, :month])
  end

  def set_plant
    @plant = Plant.find_by(id: params[:id])
  end

end
