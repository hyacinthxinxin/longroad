# frozen_string_literal: true
class Api::V2::BuildingsController < ApiController
  before_action :authenticate_user!

  def index
    if current_user.id.to_s == params[:user_id].to_s
      render json: current_user.buildings.all
    else
      render json: { error: 'wrong user id' }
    end
  end

  def show
    render json: Building.find_by(id: params[:id]).as_json(include: { floors: { include: { areas: { include: { devices: { include: :cams } } } } } })
  end

  def building_detail
    building_id = params[:building_id]
    if building_id
      render json: Building.find_by(id: params[:building_id]).as_json(include: { floors: { include: { areas: { include: { devices: { include: :cams } } } } } })
    else
      render json: { error: 'building id needed' }
    end
  end
end
