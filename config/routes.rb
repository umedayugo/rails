Rails.application.routes.draw do
  devise_for :users

  root 'users#top'

  resources :books, only: [:new, :create, :index, :show, :edit, :destroy, :update]
  resources :users, only: [:top, :show, :index, :edit, :update]
  

  get 'home/about' => 'users#about'

  #get 'users' => 'users#index'

  #get 'users' => 'users#show'

  #post 'books' => 'books#create'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
