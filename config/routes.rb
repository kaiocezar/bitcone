Rails.application.routes.draw do
  resources :cones
  devise_for :users

  root 'cones#index'

  namespace :api do
    namespace :v1 do
      get 'links/start'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
