class Swipe < ApplicationRecord
  belongs_to :user, :class_name => "User"
  belongs_to :swiped_user, :class_name => "User"
end
