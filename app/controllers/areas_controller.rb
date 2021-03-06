# frozen_string_literal: true
# AreasController:
class AreasController < ApplicationController
  def show
    @floor = Floor.find(params[:floor_id])
    @area = @floor.areas.find(params[:id])
  end

  def new
    @building = Building.find(params[:building_id])
    @floor = Floor.find(params[:floor_id])
    @area = @floor.areas.new(name: '新的房间', image_name: 'other')
  end

  def edit
    @building = Building.find(params[:building_id])
    @floor = Floor.find(params[:floor_id])
    @area = Area.find(params[:id])
  end

  def create
    @building = Building.find(params[:building_id])
    @floor = Floor.find(params[:floor_id])
    @area = @floor.areas.new(area_params)
    if @area.save
      flash[:success] = 'Area Created!'
      redirect_to building_path(@building)
    else
      render :new
    end
  end

  def update
    @building = Building.find(params[:building_id])
    @floor = Floor.find(params[:floor_id])
    @area = Area.find(params[:id])
    if @area.update(area_params)
      redirect_to building_path(@building)
    else
      render :edit
    end
  end

  def destroy
    @area = Area.find(params[:id])
    @area.destroy
    flash[:success] = 'Area deleted'
    redirect_to request.referrer || root_url
  end

  def move_higher
    Area.find(params[:area_id]).move_higher
    redirect_to :back
  end

  def move_lower
    Area.find(params[:area_id]).move_lower
    redirect_to :back
  end

  def dup_area
    area = Area.find_by(id: params[:area_id])
    area_copy = area.amoeba_dup
    area_copy.save
    redirect_to :back
  end

  private

  def area_params
    params.require(:area).permit(:name, :image_name)
  end
end
