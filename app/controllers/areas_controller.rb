class AreasController < ApplicationController

    def show      
      @floor = Floor.find(params[:floor_id])
      @area = @floor.areas.find(params[:id])
    end

    def create
      @floor = Floor.find(params[:floor_id])
      @area = @floor.areas.create(area_params)
      redirect_to building_floor_path(@floor.building, @floor)
    end
    
    def edit
      @area = Area.find(params[:id])
    end

    def update
      @area = Area.find(params[:id])
      if @area.update(area_params)
        redirect_to building_floor_path(@area.floor.building, @area.floor)
      else
        render 'edit'
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
