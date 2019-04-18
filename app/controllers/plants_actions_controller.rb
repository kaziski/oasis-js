class PlantsActionsController < ApplicationController

  def new
    @plant = Plant.find_by(id: params[:plant_id]) 
    @plant_action = @plant.plants_actions.build
  end

  def create
    @plant = Plant.find_by(id: params[:plant_id]) 
    @plant_action = @plant.plants_actions.build(plants_action_params)
    @plant_action.save
    redirect_to plant_path(@plant)
  end

  private

  def plants_action_params
    params.require(:plants_action).permit(:action_date, 
      :action_attributes => [:action_name])
  end
end
