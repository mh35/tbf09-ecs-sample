Rails.application.routes.draw do
  root to: 'top#index'
  get 'login', to: 'login#index'
  post 'login', to: 'login#do_login'
  post 'logout', to: 'logout#index'
  resources :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
