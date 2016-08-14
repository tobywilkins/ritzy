class Match < ApplicationRecord
  belongs_to :user_one, :class_name => "User"
  belongs_to :user_two, :class_name => "User"

  def self.create_match(user1,user2)
    match = Match.create({user_one_id: user1, user_two_id: user2})
    return match
  end


end
