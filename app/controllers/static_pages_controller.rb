class StaticPagesController < ApplicationController
  def home
    # @building = current_user.buildings.build if logged_in?
    redirect_to buildings_path if logged_in?
  end

  def help
  end

  def about
  end

  def contact
  end
end