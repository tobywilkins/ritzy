require 'api_constraints'

Rails.application.routes.draw do

#   devise_for :users, path_names: {
#   sign_up: ''
# }
  namespace :api, defaults: { format: :json },
                              constraints: { subdomain: 'api' }, path: '/'  do
    scope module: :v1,
              constraints: ApiConstraints.new(version: 1, default: true) do
      resources :users, :only => [:show, :create, :update, :destroy]
    end
  end
end
