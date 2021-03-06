
class Api::V1::UsersController < ApplicationController

  respond_to :json
  before_action :authenticate, except: [:create] unless Rails.env.test?


  def show
    respond_with User.find(params[:id])
  end

  def create
    user = User.new(user_params)
    user.image = params[:image] if params[:image].present?

    if user.save
      render json: user, serializer: CreateUserSerializer, status: 201, location: [:api, user]
    else
      render json: {errors: user.errors}, status: 422
    end
  end

  def update
    user = User.find(params[:id])

    if user.update(user_params)
      render json: user, status: 200, location: [:api, user]
    else
      render json: {errors: user.errors}, status: 422
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    head 204
  end

  private

  def user_params
    params.permit(:email,:password,:password_confirmation,:image,:dob,:name,:sex,:looking_for)
  end
end
