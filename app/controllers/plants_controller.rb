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
    # binding.pry 
    @plant.update_attributes(plant_params)
    # @plant.plants_actions.each do |pa|
    #   # binding.pry
    #   pa.update(action_date: pa.action_date) 
    #   pa.save
    # end
    
    
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

#Reject is date is not selected for an action

# "plants_actions_attributes"=>{
#   "0"=>{"action_id"=>"1", "action_date"=>"2019-04-01"}, 
#   "1"=>{"action_id"=>"", "action_date"=>""}, 
#   "2"=>{"action_id"=>"", "action_date"=>""}, 
#   "3"=>{"action_id"=>"9", "action_date"=>"2019-05-01"}, 
#   "4"=>{"action_id"=>"", "action_date"=>""}, 
#   "5"=>{"action_id"=>"", "action_date"=>""}}, 
#   "actions_attributes"=>{"0"=>{"action_name"=>"Trim", 
#     "plants_actions_attributes"=>{"0"=>{"action_date"=>"2019-06-01"}

# "name"=>"Mint", "in_the_garden"=>"0", "edible"=>"0", 
# "annual"=>"1", "note"=>"", "plants_actions_attributes"=><ActionController::Parameters {
#   "0"=><ActionController::Parameters {"action_id"=>"1", "action_date"=>"2019-04-01"} permitted: true>, 
#   "1"=><ActionController::Parameters {"action_id"=>"", "action_date"=>""} permitted: true>, 
#   "2"=><ActionController::Parameters {"action_id"=>"", "action_date"=>""} permitted: true>, 
#   "3"=><ActionController::Parameters {"action_id"=>"9", "action_date"=>"2019-05-01"} permitted: true>, 
#   "4"=><ActionController::Parameters {"action_id"=>"", "action_date"=>""} permitted: true>, 
#   "5"=><ActionController::Parameters {"action_id"=>"", "action_date"=>""} permitted: true>} permitted: true>,
#    "actions_attributes"=><ActionController::Parameters {
#      "0"=><ActionController::Parameters {"action_name"=>"Trim", "plants_actions_attributes"=><ActionController::Parameters {
#        "0"=><ActionController::Parameters {"action_date"=>"2019-06-01"} permitted: true>} perm