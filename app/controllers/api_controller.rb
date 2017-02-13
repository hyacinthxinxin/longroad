class ApiController < ApplicationController

  def login
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      render json: {
          'result': true,
          'buildings': user.buildings.all
      }
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
