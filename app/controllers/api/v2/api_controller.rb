# frozen_string_literal: true
class Api::V2::ApiController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
end
