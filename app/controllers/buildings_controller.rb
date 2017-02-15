class BuildingsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def index
    @buildings = current_user.buildings.all
  end

  def show
    @building = current_user.buildings.find(params[:id])
  end

  def new
    @building = current_user.buildings.new
  end

  def edit
    @building = current_user.buildings.find(params[:id])
  end

  def create
    @building = current_user.buildings.new(building_params)
    if @building.save
      flash[:success] = "Building created!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def update
    @building = current_user.buildings.find(params[:id])
    if @building.update(building_params)
      # redirect_to request.referrer || root_url
      redirect_to buildings_path
    else
      render 'edit'
    end
  end

  def destroy
    @building.destroy
    flash[:success] = "Building deleted"
    redirect_to request.referrer || root_url
  end

  private

    def building_params
      params.require(:building).permit(:name, :socket_address)
    end

    def correct_user
      @building = current_user.buildings.find_by(id: params[:id])
      redirect_to root_url if @building.nil?
    end

end