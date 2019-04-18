class PlantsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_plant, only: [:show, :edit, :update]
  
  def index
    if current_user.admin
      owner_id = params[:user_id].to_i  
      @plants_owner = User.find(owner_id)
      @plants = Plant.where(user_id: owner_id) 
    else
      @plants = current_user.plants
    end
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
        flash[:danger] =  @plant.errors.full_messages.to_sentence
      redirect_to new_plant_path
    end
  end

  def show
  end

  def edit
    @user = current_user
  end

  def update
    @plant.update(plant_params) 
    redirect_to plant_path(@plant)
  end


  def destroy
    Plant.find(params[:id]).destroy
    redirect_to plants_path
  end

  def in_garden
    @plants = current_user.plants.where(in_the_garden: true)
  end

  def edible
    @plants = current_user.plants.where(edible: true)
  end

  def annual
    @plants = current_user.plants.where(annual: true)
  end

  private 

  def plant_params
    params.require(:plant).permit(:name, :in_the_garden, :edible, :annual, :user_id, :note,
      :plants_actions_attributes => [:action_id, :action_date],
      :actions_attributes => [:action_name,
        :plants_actions_attributes => :action_date])
  end

  def set_plant
    @plant = Plant.find_by(id: params[:id])
  end
end
