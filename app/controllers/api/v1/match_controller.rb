class Api::V1::MatchController < ApplicationController

  respond_to :json

  def show
    user_match_ids = Match.where('user_one_id in (:id) or user_two_id in (:id)',
               :id => @current_user.id).pluck(:user_one_id, :user_two_id).flatten.uniq-[@current_user.id]

    respond_with User.where(id: user_match_ids)
  end
end
