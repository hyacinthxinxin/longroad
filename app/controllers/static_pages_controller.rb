# frozen_string_literal: true
class StaticPagesController < ApplicationController
  def index
    render :home
  end

  # def home
  #   redirect_to buildings_path if user_signed_in?
  # end

  def help; end

  def about; end

  def contact; end
end
