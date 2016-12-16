Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'pages#index'

  post 'pages/upload_file'

  post 'pages/upload_profile_pic'

  post 'pages/mail_to_welcome'

  resources :replies

  resources :subjects

  get 'logged/download'

  get 'logged/features'

  get 'logged/contact'

  get 'pages/download'

  get 'pages/features'

  get 'pages/contact'

  devise_for :users, controllers: { omniauth_callbacks: "callbacks" }

  get 'pages/index'

end
