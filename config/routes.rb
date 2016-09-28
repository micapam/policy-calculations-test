Rails.application.routes.draw do
  mount Flipper::UI.app(Flipper::Rails.flipper) => '/flipper'
  resources :quotes, only: [:new, :create, :show]
  root to: redirect('/quotes/new')
end
