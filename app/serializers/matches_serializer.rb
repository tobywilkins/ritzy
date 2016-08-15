class MatchesSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :user_one_id
  belongs_to :user_two_id


end
