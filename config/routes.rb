Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  get 'top' => 'homes#top'
  get 'homes/about' => 'homes#about'
  root to: "homes#top"
  resources :books
  resources :users, only: [:index, :show, :edit, :update]
end
