# frozen_string_literal: true
class DevicesController < ApplicationController
  def new
    @area = Area.find(params[:area_id])
    if @device_category = DeviceCategory.find_by(device_type: params[:i_type])
      @device = @area.devices.build(name: @device_category.name,
                                    image_name: 'other',
                                    i_type: params[:i_type])
      @device_category.cam_categories.each do |category|
        @device.cams.build([{ name: category.name,
                              i_type: category.cam_type,
                              control_type: category.control_type }])
      end
    end
  end

  def create_test
    render plain: params[:device].inspect
  end

  def create
    @area = Area.find(params[:area_id])
    @device = @area.devices.build(device_params)
    if @device.save
      flash[:success] = '设备创建成功！'
      redirect_to building_floor_area_path(@area.floor.building,
                                           @area.floor, @area)
    else
      flash[:error] = '设备创建失败！'
      render :new
    end
  end

  def edit
    @device = Device.find_by(id: params[:id])
  end

  def update
    @device = Device.find_by(id: params[:id])
    if @device.update_attributes(device_params)
      flash[:success] = '设备更新成功！'
      redirect_to building_floor_area_path(@device.area.floor.building,
                                           @device.area.floor, @device.area)
    else
      flash[:error] = '设备更新失败！'
      render :edit
    end
  end

  def destroy
    @device = Device.find(params[:id])
    if @device.destroy
      flash[:success] = '设备删除成功！'
      redirect_to building_floor_area_path(@device.area.floor.building,
                                           @device.area.floor, @device.area)
    else
      flash[:error] = '设备删除失败！'
      redirect_to request.referrer || root_url
    end
  end

  def dup_device
    device = Device.find_by(id: params[:device_id])
    device_copy = device.amoeba_dup
    device_copy.save
    redirect_to request.referrer || root_url
  end

  private

  def device_params
    params
      .require(:device)
      .permit(:name, :image_name, :i_type,
              cams_attributes: [:id, :i_type, :name, :control_type,
                                :control_address, :status_address,
                                :control_value, :status_value,
                                :min_control_value, :max_control_value,
                                :min_status_value, :max_status_value,
                                :_destroy])
  end
end
