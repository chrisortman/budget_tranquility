BudgetTranquility::Application.routes.draw do
  get "setup/index"
  get "setup/paychecks"
  get "setup/bills"
  get "setup/envelopes"
  get "home/index"
  get "home/setup"
  resources :recurring_transactions

  resources :widgets

  get  'login', to: "sessions#new", as: 'login'
  post 'login', to: "sessions#create"
  get  'logout', to: "sessions#destroy", as: 'logout'
  get  'register', to: "registration#new", as: 'register'
  post 'register', to: "registration#create"
  get 'home', to: "home#index", as: 'home'
  root :to => 'home#index'
end
