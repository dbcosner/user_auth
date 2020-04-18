Rails.application.routes.draw do

  root to: 'sessions#login'

  get 'sessions/login'
  get 'sessions/logout'
  get 'sessions/home'
  get 'sessions/profile'
  get 'sessions/setting'

  resources :users
end
