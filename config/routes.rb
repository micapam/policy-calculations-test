Rails.application.routes.draw do
  resources :quotes, only: [:new, :create, :show]
  root to: redirect('/quotes/new')
end
