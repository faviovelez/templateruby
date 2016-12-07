Rails.application.routes.draw do
  root 'pages#index'

  post 'pages/upload_file'

  post 'pages/mail_to_welcome'


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
