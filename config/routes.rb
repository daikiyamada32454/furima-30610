Rails.application.routes.draw do
  devise_for :users

  root to: 'items#index'
<<<<<<< Updated upstream
  resources :items, only: [:new, :create]
=======
  resources :items, only: [:index,:new, :create, :edit, :show]
>>>>>>> Stashed changes
end
