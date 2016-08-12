require 'paperclip'
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :image, styles: { screen: "640x480>", thumb: "100x75>" }
  validates_attachment :image, presence: true
  do_not_validate_attachment_file_type :image

  before_create do |user|
    user.api_key = user.generate_api_key
  end

  # Generate a unique API key
  def generate_api_key
  loop do
    token = SecureRandom.base64.tr('+/=', 'Qrt')
    break token unless User.exists?(api_key: token)
  end
end
end
