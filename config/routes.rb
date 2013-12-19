BudgetTranquility::Application.routes.draw do
  get "registration/new"
  post "registration/create"
  root :to => 'visitors#new'
end
