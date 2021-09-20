Rails.application.routes.draw do
  devise_for :users
  resources :courier_requests do
    get 'search', on: :collection
  end
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
