class PlantsController < ApplicationController
  before_action :set_plant, only: [:show, :edit, :update]
  # before_action :authenticate_user!, except: [:show, :index]
  
  def index
    @plants = current_user.plants
  end

  def plants
    @plants = Plant.all
  end

  def new
    @plant = Plant.new
    Action.all.each do |action|
      @plant.plants_actions.build(action_id: action.id)
    end
    
  end

  def create
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
    @plant.update_attributes(plant_params) 
    redirect_to plant_path(@plant)
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
      :plants_actions_attributes => [:action_id, :action_date],
      :actions_attributes => [:action_name, 
        :plants_actions_attributes => [:action_date]]
    )
  end

  def set_plant
    @plant = Plant.find_by(id: params[:id])
  end
end
