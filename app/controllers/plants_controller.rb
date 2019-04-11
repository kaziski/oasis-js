class PlantsController < ApplicationController
  before_action :set_plant, only: [:show, :edit, :update]

  def index
    @plants = Plant.all
  end

  # def new
  #   @plant = Plant.new
  #   Action.all.each do |action|
  #     @plant.plants_actions.build(action_id: action.id)
  #   end
  #   @plant.actions.build.plants_actions.build
  # end

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
    binding.pry
    @plant.update_attributes(plant_params
    )
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

  # def plant_params
  #   params.require(:plant).permit(:name, :in_the_garden, :edible, :annual, :user_id, :note,
  #     :plants_actions_attributes => [:action_id, :month],
  #     :actions_attributes => [:action_name, 
  #       :plants_actions_attributes => [:month]]
  #   )
  # end

  def plant_params
    params.require(:plant).permit(:name, :in_the_garden, :edible, :annual, :user_id, :note,
      :plants_actions_attributes => [:action_id, :month],
      :actions_attributes => [:action_name, 
        :plants_actions_attributes => [:month]]
    )
  end

  def edit_params
    params.require(:plant).permit(:name, :in_the_garden, :edible, :annual, :user_id, :note, 
      :actions_attributes => [:action_name, :plants_action => [:month] ])
  end

# plant[:action][:action_name] 
# plant[:action][:plants_action][:month]
  def set_plant
    @plant = Plant.find_by(id: params[:id])
  end
end

#this was the params in update b4 changing 
# > <ActionController::Parameters {"utf8"=>"✓", "_method"=>"patch", 
#   "authenticity_token"=>"WeSe9v7DiNh6K8Pqbe0o6uQSoeiasFmEvv+iLngdx9KAakd0nMmMDtHMvLe22exd0i07Fn4zPVPZvZakM5GmPQ==", 
#   "plant"=>{"name"=>"Mint", "in_the_garden"=>"0", "edible"=>"1", "annual"=>"1", "note"=>"", 
#     "action"=>{"action_name"=>"Minty action", "plants_action"=>{"month"=>"2019-04-27"}}}, 