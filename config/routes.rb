Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :comments
    get 'delete', on: :member, to: 'posts#delete'
    
  end

  resources :comments, only: [] do
    get 'delete', on: :member, to: 'comments#destroy'
  end
  root 'posts#index'
  get 'tags/:tag', to: 'posts#index', as: :tag
  
end
