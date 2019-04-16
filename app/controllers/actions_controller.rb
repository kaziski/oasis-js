class ActionsController < ApplicationController
  
  def new
    @plant = Plant.find_by(id: params[:plant_id]) 
  end

  def index
    @actions = Action.all
  end

  def destroy
    Action.find(params[:id]).destroy
    redirect_to actions_path
  end
end
