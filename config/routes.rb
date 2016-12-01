Rails.application.routes.draw do
  get 'logged/download'

  get 'logged/features'

  get 'logged/contact'

  get 'pages/download'

  get 'pages/features'

  get 'pages/contact'

  devise_for :users
  root 'pages#index'
  get 'pages/index'
end
