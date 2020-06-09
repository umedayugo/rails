Rails.application.routes.draw do
  devise_for :users

  root 'users#top'
  resources :users, only: [:top, :show, :index, :edit, :update]

  resources :books, only: [:new, :create, :index, :show, :edit, :destroy, :update] do
  	  resource :book_comments, only: [:create]
  	  delete '/book_comments/:id' => 'book_comments#destroy'
      resource :favorites, only: [:create, :destroy]

      

  end

  get 'home/about' => 'users#about'

  #get 'users' => 'users#index'

  #get 'users' => 'users#show'

  #post 'books' => 'books#create'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
