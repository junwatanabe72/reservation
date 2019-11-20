Rails.application.routes.draw do

   resource :auths, only: [:new, :create, :destroy]
   resources :users
   root to: "tops#index"
   resources :rooms
   resources :entries , only: [:index, :new, :create, :destroy] , path: :rentals do
    post:confirm , on: :collection
    post:confirm_back , on: :collection
   end

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
