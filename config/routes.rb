# frozen_string_literal: true

Rails.application.routes.draw do
  root 'items#index'

  resources :tags
  resources :items do
    member do
      delete '/tags/:tag_id', to: 'items#destroy_tag_from_item'
    end
  end
  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
