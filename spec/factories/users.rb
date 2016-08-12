FactoryGirl.define do
  factory :user do
  email { FFaker::Internet.email }
  password "12345678"
  password_confirmation "12345678"
  image { fixture_file_upload(Rails.root.join('spec', 'photos', 'test.jpg'), 'image/jpg') }

  end
end
