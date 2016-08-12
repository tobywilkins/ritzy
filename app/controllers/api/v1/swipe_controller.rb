class Api::V1::SwipeController < ApplicationController

  respond_to :json

def show
top_match
end

def create
end



private

def top_match
  user = User.where(sex: @current_user.looking_for).first
  render json: user, status: 201
end



end
