Rails.application.routes.draw do
  resources :cipher, only: %i[index show create] do
    get :decrypt, on: :member
  end

  root to: 'cipher#index'
end
