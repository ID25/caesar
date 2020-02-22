Rails.application.routes.draw do
  resources :users, only: %i[new create]
  resources :sessions, only: [:new, :create, :destroy]

  resources :cipher, only: %i[index show create] do
    get :decrypt, on: :member
  end

  get :signup, to: 'users#new', as: :signup
  get :login, to: 'sessions#new', as: :login
  get :logout, to: 'sessions#destroy', as: :logout

  root to: 'cipher#index'
end
