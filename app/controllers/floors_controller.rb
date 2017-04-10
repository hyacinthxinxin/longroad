# frozen_string_literal: true
class FloorsController < ApplicationController
  def new
    @building = Building.find(params[:building_id])
    @floor = @building.floors.build(name: '新的楼层')
  end

  def create
    @building = Building.find(params[:building_id])
    @floor = @building.floors.build(floor_params)
    if @floor.save
      flash[:success] = '楼层创建成功！'
      redirect_to building_path(@building)
    else
      flash[:error] = '楼层创建失败！'
      render :new
    end
  end

  def edit
    @building = Building.find(params[:building_id])
    @floor = @building.floors.find(params[:id])
  end

  def update
    @building = Building.find(params[:building_id])
    @floor = @building.floors.find(params[:id])
    if @floor.update(floor_params)
      flash[:success] = '楼层更新成功！'
      redirect_to building_path(@building)
    else
      flash[:error] = '楼层更新失败！'
      render :edit
    end
  end

  def destroy
    @floor = Floor.find(params[:id])
    if @floor.destroy
      flash[:success] = '楼层删除成功！'
      redirect_to building_path(@floor.building)
    else
      flash[:error] = '楼层删除失败！'
      redirect_to request.referrer || root_url
    end
  end

  def move_floor_higher
    Floor.find(params[:id]).move_higher
  end

  private

  def floor_params
    params.require(:floor).permit(:name, :image_name)
  end
end
