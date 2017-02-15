class FloorsController < ApplicationController
    
    def index
      @building = Building.find(params[:building_id])
      @floors = @building.floors
    end

    def show      
      @building = Building.find(params[:building_id])
      @floor = @building.floors.find(params[:id])
    end
    
    def new
      @building = Building.find(params[:building_id])
      @floor = @building.floors.new
    end

    def edit
      @building = Building.find(params[:building_id])
      @floor = @building.floors.find(params[:id])
    end

    def create
      @building = Building.find(params[:building_id])
      @floor = @building.floors.create(floor_params)
      redirect_to building_path(@building)
    end

    def update
      @building = Building.find(params[:building_id])
      @floor = @building.floors.find(params[:id])
      if @floor.update(floor_params)
        redirect_to building_path(@building)
      else
        render 'edit'
      end
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
