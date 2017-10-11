Rails.application.routes.draw do

  resources :likes
  resources :photos do
    resources :comments
  end

  devise_for :users
  authenticated :user do
    root :to => 'photos#index', as: :authenticated_root
  end
  root 'home#landing'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
