Rails.application.routes.draw do
  
  

  get 'users/show'
  root to: 'homes#top'
  root 'post_images#index'
  devise_for :users
 
  resources :post_images, only: [:index, :new, :show, :create, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
