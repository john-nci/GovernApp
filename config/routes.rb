Rails.application.routes.draw do
  
  devise_for :users
  
  resources :polls do
    resources :questions
    resources :replies, only: [ :new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'polls#index' #Rooting straight to polls page
end
