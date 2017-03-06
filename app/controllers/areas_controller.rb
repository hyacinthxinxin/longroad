class AreasController < ApplicationController
    def show      
      @floor = Floor.find(params[:floor_id])
      @area = @floor.areas.find(params[:id])
      sort_item
    end
    
    def sort_item
      if ["move_lower", "move_higher", "move_to_top", "move_to_bottom"].include?(params[:method]) and params[:item_name] =~ /^\d+$/
        case params[:move_type] 
        when 'device'
        Device.find(params[:item_name]).send(params[:method])
        end
      end
    end

    def new
      @building = Building.find(params[:building_id])
      @floor = Floor.find(params[:floor_id])
      @area = @floor.areas.new(name:'新的房间',image_name: 'other')
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
        flash[:success] = "Area Created!"
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
      flash[:success] = "Area deleted"
      redirect_to request.referrer || root_url
    end

    private

      def area_params
        params.require(:area).permit(:name, :image_name)
      end
    
end
