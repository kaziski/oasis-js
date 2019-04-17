class ActionsController < ApplicationController
  
  def new
    @plant = Plant.find_by(id: params[:plant_id]) 
  end

  def index
    if current_user.admin
      @actions = Action.all
      else
        redirect_to :root 
      end
  end

  def destroy
    Action.find(params[:id]).destroy
    redirect_to actions_path
  end
end
