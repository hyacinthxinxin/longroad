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
    
    private

      def area_params
        params.require(:area).permit(:name, :image_name)
      end

end
