class PlantsController < ApplicationController
  skip_before_action :verify_authenticity_token

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
    respond_to do |f|
      f.html
      f.json {render json: @plants}
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
      # redirect_to plant_path(@plant)
      render json: @plant, status: 201
      #if I use the code above, data returns null
      # respond_to do |f|
			# 	f.html {redirect_to plants_path}
			# 	f.json {render json: @plants}
			# end
    else
        flash[:danger] =  @plant.errors.full_messages.to_sentence
      redirect_to new_plant_path
      #render new and restyle flash
    end
  end

  def show
    respond_to do |f|
      f.html
      f.json {render json: @plant}
    end
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
    @plants  = Plant.in_garden_msd(current_user)
  end

  def edible
    @plants  = Plant.edible_msg(current_user)
  end

  def annual
    @plants = Plant.annual_msg(current_user)
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
