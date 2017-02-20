class ApiController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken

  def buildings
    if user = User.find_by(id: params[:user_id])
      render json: user.buildings.all
    else
      render json: {
          'result': false
      }
    end
  end

  def project
      @building = Building.find_by(id: params[:building_id]).
          as_json(include: {floors: {include: {areas: {include: {devices: {include: :cams}}}}}})
      render json: @building
  end

end
