# frozen_string_literal: true
class CamsController < ApplicationController
  def move_higher
    Cam.find_by(id: params[:cam_id]).move_higher
    # redirect_to :back
  end

  def move_lower
    Cam.find_by(id: params[:cam_id]).move_lower
    # redirect_to :back
  end
end