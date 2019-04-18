class PlantsActionsController < ApplicationController
  before_action :authenticate_user!
    
  def new
    @plant = Plant.find_by(id: params[:plant_id]) 
    @plant_action = @plant.plants_actions.build
  end

  def create
    @plant = Plant.find_by(id: params[:plant_id]) 
    @plant_action = @plant.plants_actions.build(plants_action_params)
    if @plant_action.save
      redirect_to plant_path(@plant)
    else
      flash[:danger] = "Name can't be blank"
      redirect_to new_plant_plants_action_path
    end
  end

  private

  def plants_action_params
    params.require(:plants_action).permit(:action_date, 
      :action_attributes => [:action_name])
  end
end
