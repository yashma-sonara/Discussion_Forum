Rails.application.routes.draw do
  devise_for :users
  resources :posts do
  resources :comments
  
  end
root 'posts#index'
get 'tags/:tag', to: 'posts#index', as: :tag
end
