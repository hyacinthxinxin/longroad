class DevicesController < ApplicationController

    def show      
      @device = Area.find(params[:area_id]).devices.find(params[:id])
    end

    def new
      @area = Area.find(params[:area_id])
      @device = @area.devices.new(name:"新的设备", image_name:"other", i_type: params[:i_type])
      case @device.i_type
      when 0 # 场景
        @device.cams.build([{:name => '启动',:i_type => 0, :control_type => 1}])
      when 1 # 灯光
        @device.cams.build([{:name => '开关',:i_type => 10, :control_type => 0}])
      when 2 # 灯光和调光
        @device.cams.build([{:name => '开关',:i_type => 20, :control_type => 0},
                              {:name => '调光',:i_type => 21, :control_type => 1}])
      when 3 # 窗帘
        @device.cams.build([{:name => '打开',:i_type => 30, :control_type => 0},
                              {:name => '关闭',:i_type => 31, :control_type => 0}])
                              # 上升 32 下降 33 停止 34
      when 4 # 空调
        @device.cams.build([{:name => '开关',:i_type => 40, :control_type => 0},
                              {:name => '调温',:i_type => 41, :control_type => 2},
                              {:name => '制热',:i_type => 42, :control_type => 1},
                              {:name => '制冷',:i_type => 43, :control_type => 1},
                              {:name => '通风',:i_type => 44, :control_type => 1},
                              {:name => '除湿',:i_type => 45, :control_type => 1},
                              {:name => '低风',:i_type => 46, :control_type => 1},
                              {:name => '中风',:i_type => 47, :control_type => 1},
                              {:name => '高风',:i_type => 48, :control_type => 1}])
                              # 微风 72 强风 76
      when 5 # 地暖
        @device.cams.build([{:name => '开关',:i_type => 50, :control_type => 0},
                              {:name => '调温',:i_type => 51, :control_type => 2}])
      when 6 # 新风
        @device.cams.build([{:name => '开关',:i_type => 60, :control_type => 0},
                              {:name => '低速',:i_type => 61, :control_type => 1},
                              {:name => '中速',:i_type => 62, :control_type => 1},
                              {:name => '高速',:i_type => 63, :control_type => 1}])
      else # 自定义
        @device.cams.build([{:name => '自定义',:i_type => 80, :control_type => 0}])
      end
      
      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @device }
      end
    end

    def create2
        render plain: params[:device].inspect
    end

    def create
      @device = Area.find(params[:area_id]).devices.new(device_params)
      if @device.save
        flash[:success] = "设备创建成功!"
        @area = Area.find(params[:area_id])
        redirect_to building_floor_area_path(@area.floor.building, @area.floor, @area)
      else
        flash[:notice] = "设备创建失败!"
        render :new
      end

    end

    def edit
      @device = Device.find_by(id:params[:id])
    end

    def update
      @device = Device.find_by(id:params[:id])
      if @device.update_attributes(device_params)
        flash[:success] = "设备修改成功!"
        redirect_to building_floor_area_path(@device.area.floor.building, @device.area.floor, @device.area)
      else
        render :edit
      end
    end

    def destroy
      @device = Device.find(params[:id])
      @device.destroy
      flash[:success] = "设备已删除!"
      redirect_to request.referrer || root_url
    end

    private

      def device_params
        params.require(:device).permit(:name, :image_name, :i_type, cams_attributes: [:id, :i_type, :name, :control_address, :status_address, :control_type, :control_value, :status_value, :min_control_value, :max_control_value, :min_status_value, :max_status_value, :_destroy])
      end

end
