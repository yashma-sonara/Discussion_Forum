Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :comments
  end
  root 'posts#index'
  get 'tags/:tag', to: 'posts#index', as: :tag
  delete 'posts/:id', to: 'posts#destroy', as: 'delete_post'
end
