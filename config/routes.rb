# frozen_string_literal: true

Rails.application.routes.draw do
  root 'items#index'

  resources :tags
  resources :items do
    member do
      delete '/tags/:tag_id', to: 'items#destroy_tag_from_item'
    end
  end
end
