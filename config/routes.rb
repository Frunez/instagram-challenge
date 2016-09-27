Rails.application.routes.draw do

  devise_for :users
  root "images#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :images do
    resources :comments
  end
end
