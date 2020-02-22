Rails.application.routes.draw do
  resources :cipher

  root to: 'cipher#index'
end
