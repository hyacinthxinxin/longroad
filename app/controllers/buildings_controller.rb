class BuildingsController < ApplicationController
	before_action :authenticate_user!, :only => [:index, :new]

	def index
	  @buildings = current_user.buildings.all
	end

	def show
	  @building = current_user.buildings.find(params[:id])
		sort_item
	end

	def sort_item
		if ["move_lower", "move_higher", "move_to_top", "move_to_bottom"].include?(params[:method]) and params[:item_name] =~ /^\d+$/
			case params[:move_type] 
			when 'floor'
			Floor.find(params[:item_name]).send(params[:method])
			when 'area'
			Area.find(params[:item_name]).send(params[:method])
			end
		end
	end

	def new
	  @building = current_user.buildings.new
	end

	def edit
	  @building = current_user.buildings.find(params[:id])
	end

	def create
		@building = current_user.buildings.new(building_params)
		if @building.save
			flash[:success] = "Building created!"
			redirect_to root_url
		else
			render :new
		end
	end

	def update
		@building = current_user.buildings.find(params[:id])
		if @building.update(building_params)
			redirect_to buildings_path
		else
			render :edit
		end
	end

	def destroy
		@building = current_user.buildings.find(params[:id])
		@building.destroy
		flash[:success] = "Building deleted"
		redirect_to request.referrer || root_url
	end

	private
	def building_params
		params.require(:building).permit(:name, :socket_address)
	end

	def correct_user
		@building = current_user.buildings.find_by(id: params[:id])
		redirect_to root_url if @building.nil?
	end

	def move
   
    if ["move_lower", "move_higher", "move_to_top", "move_to_bottom"].include?(params[:method]) and params[:floor_id] =~ /^\d+$/
     #if the incoming params contain any of these methods and a numeric book_id, 
     #let's find the book with that id and send it the acts_as_list specific method
     #that rode in with the params from whatever link was clicked on
      Floor.find(params[:floor_id]).send(params[:method])
    end
    #after we're done updating the position (which gets done in the background
    #thanks to acts_as_list, let's just go back to the list page, 
    #refreshing the page basically because I didn't say this was an RJS
    #tutorial, maybe next time
    redirect_to :show
  end

end