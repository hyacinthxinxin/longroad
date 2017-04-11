# frozen_string_literal: true
class BuildingsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new]

  def index
    @buildings = current_user.buildings.all
  end

  def show
    @building = current_user.buildings.find(params[:id])
  end

  def new
    @building = current_user.buildings.build
  end

  def edit
    @building = current_user.buildings.find(params[:id])
  end

  def create
    @building = current_user.buildings.build(building_params)
    if @building.save
      flash[:success] = '项目创建成功！'
      redirect_to request.referrer || root_url
    else
      flash[:error] = '项目创建失败！'
      render :new
    end
  end

  def update
    @building = current_user.buildings.find(params[:id])
    if @building.update(building_params)
      flash[:success] = '项目更新成功！'
      redirect_to buildings_path
    else
      flash[:error] = '项目更新失败！'
      render :edit
    end
  end

  def destroy
    @building = current_user.buildings.find(params[:id])
    if  @building.destroy
      flash[:success] = '项目删除成功！'
      redirect_to buildings_path
    else
      flash[:error] = '项目删除失败！'
      redirect_to request.referrer || root_url
    end
  end

  private

  def building_params
    params.require(:building).permit(:name, :socket_address)
  end
end
