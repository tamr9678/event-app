Rails.application.routes.draw do
  root "events#index"

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }

  devise_scope :user do
    get 'new', to: 'users/registrations#new'
    post 'create', to: 'users/registrations#create'
    get 'complete', to: 'users/registrations#complete'
  end

  resources :events , only: [:index]
end
