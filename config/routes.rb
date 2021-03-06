Rails.application.routes.draw do
  root "events#index"

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get 'registrations/new', to: 'users/registrations#new'
    post 'create', to: 'users/registrations#create'
    get 'complete', to: 'users/registrations#complete'
    get 'sessions/new', to: 'users/session#new'
  end

  resources :events
  resources :users, only: [:show] do
    collection do
      get 'signout'
    end
  end
  resources :participants, only: [:create, :show] do
    member do
      get 'history'
    end
  end
  resource :participants, only: [:destroy]
  resources :favorites, only: [:create, :show]
  resource :favorites, only: [:destroy]
  resources :search, only: [:index] 
end
