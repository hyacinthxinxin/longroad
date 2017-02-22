class DevicesController < ApplicationController

    def show      
      @device = Area.find(params[:area_id]).devices.find(params[:id])
    end

    def new
      @area = Area.find(params[:area_id])
      @device = @area.devices.new
    end

    def create
      @device = Area.find(params[:area_id]).devices.new(device_params)
      if @device.save
        case @device.i_type
        when 0 # 场景
          @device.cams.create([{:name => '启动',:i_type => 0, :control_type => 1}])
        when 1 # 灯光
          @device.cams.create([{:name => '开关',:i_type => 10, :control_type => 0}])
        when 2 # 灯光和调光
          @device.cams.create([{:name => '开关',:i_type => 20, :control_type => 0},
                                {:name => '调光',:i_type => 21, :control_type => 1}])
        when 3 # 窗帘
          @device.cams.create([{:name => '打开',:i_type => 30, :control_type => 0},
                                {:name => '关闭',:i_type => 31, :control_type => 0}])
        when 4 # 空调
          @device.cams.create([{:name => '开关',:i_type => 40, :control_type => 0},
                                {:name => '调温',:i_type => 41, :control_type => 2},
                                {:name => '制热',:i_type => 42, :control_type => 1},
                                {:name => '制冷',:i_type => 43, :control_type => 1},
                                {:name => '通风',:i_type => 44, :control_type => 1},
                                {:name => '除湿',:i_type => 45, :control_type => 1},
                                {:name => '低速',:i_type => 46, :control_type => 1},
                                {:name => '中速',:i_type => 47, :control_type => 1},
                                {:name => '高速',:i_type => 48, :control_type => 1}])
        when 5 # 地暖
          @device.cams.create([{:name => '开关',:i_type => 50, :control_type => 0},
                                {:name => '调温',:i_type => 51, :control_type => 2}])
        when 6 # 新风
          @device.cams.create([{:name => '开关',:i_type => 60, :control_type => 0},
                                {:name => '低速',:i_type => 61, :control_type => 1},
                                {:name => '中速',:i_type => 62, :control_type => 1},
                                {:name => '高速',:i_type => 63, :control_type => 1}])
        else 
          puts '...'
        end

        flash[:success] = "Device created!"
        @area = Area.find(params[:area_id])
        redirect_to building_floor_area_path(@area.floor.building, @area.floor, @area)
      else
        flash[:notice] = "Device created fail!"
        redirect_to request.referrer || root_url
      end

    end

    def edit
      @device = Device.find(params[:id])
    end

    def update
      @device = Device.find(params[:id])
      if @device.update(params.require(:device).
                        permit(:id, :name, :image_name, 
                                cams_attributes: [:id, 
                                                  :control_address, 
                                                  :status_address, 
                                                  :control_type, 
                                                  :control_value]))

        flash[:success] = "Profile updated successfully"
        redirect_to building_floor_area_path(@device.area.floor.building, @device.area.floor, @device.area)
      else
        render 'show'
      end
    end

    def destroy
      @device = Device.find(params[:id])
      @device.destroy
      flash[:success] = "Device deleted"
      redirect_to request.referrer || root_url
    end

    private

      def device_params
        params.require(:device).permit(:name, :image_name, :i_type)
      end

end
