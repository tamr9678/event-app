Rails.application.routes.draw do
  root "test#index"
  resources :test
end
