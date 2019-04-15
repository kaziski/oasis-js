class ActionsController < ApplicationController

  def new
    @plant = Plant.find_by(id: params[:plant_id]) 
  end

end
