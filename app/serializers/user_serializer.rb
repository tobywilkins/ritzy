class UserSerializer < ActiveModel::Serializer
  attributes :id,:name,:dob,:image,:email
end
