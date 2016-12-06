Rails.application.routes.draw do
  post 'subjects/mail_to_welcome'

  root 'pages#index'

  resources :replies

  resources :subjects

  get 'logged/download'

  get 'logged/features'

  get 'logged/contact'

  get 'pages/download'

  get 'pages/features'

  get 'pages/contact'

  devise_for :users
  get 'pages/index'
end
