class ActionsController < ApplicationController

  def new
    @plant = Plant.find_by(id: params[:plant_id]) 
    # @plant = @plant.actions.build
    # @action
    # @plant = Plant.new
    # @plant.actions.build.plants_actions.build
  end

  def create
  end   
end
