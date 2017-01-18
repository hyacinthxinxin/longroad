class FloorsController < ApplicationController
    http_basic_authenticate_with name: "ting", password: "111111", only: :destroy
    
    def create
      @building = Building.find(params[:building_id])
      @floor = @building.floors.create(floor_params)
      redirect_to building_path(@building)
    end
    
    def destroy
      @building = Building.find(params[:building_id])
      @floor = @building.floors.find(params[:id])
      @floor.destroy
      redirect_to building_path(@building)
    end

    private

    def floor_params
      params.require(:floor).permit(:name, :image_name)
    end
end
