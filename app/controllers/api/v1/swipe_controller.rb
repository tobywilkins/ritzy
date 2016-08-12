class Api::V1::SwipeController < ApplicationController

  respond_to :json

def show
top_match
end

def create
  swiped_user = User.find(params[:swiped_user_id])
  swipe = Swipe.new(user_id: @current_user.id,swiped_user: swiped_user,yes_swipe: params[:yes_swipe])
  if swipe.save
    render json: swipe, status: 201
  else
    render json: {errors: swipe.errors}, status: 422
  end
end



private

def top_match
  user = User.where(sex: @current_user.looking_for).first
  render json: user, status: 201
end

def swipe_params
  params.permit(:swiped_user_id,:yes_swipe)
end

end
