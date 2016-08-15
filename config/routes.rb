require 'api_constraints'

Rails.application.routes.draw do

  namespace :api, defaults: { format: :json },
   path: '/'  do
    scope module: :v1,
    constraints: ApiConstraints.new(version: 1, default: true) do
      resources :users, :only => [:show, :create, :update, :destroy]
      get 'swipes', to: 'swipe#show'
      post 'swipes', to: 'swipe#create'
      get 'matches', to: 'match#show'
    end
  end
end
