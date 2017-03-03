class Api::V2::BuildingsController < ApiController
  before_action :authenticate_user!

  def index
    render json: current_user.buildings.all
  end

  def show
    render json: Building.find_by(id: params[:id]).as_json(include: {floors: { include: {areas: { include: {devices: { include: :cams}}}}}})
                  
  end

end