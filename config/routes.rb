# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts do
    scope module: :posts do
      member do
        resources :likes, only: %i[create]
        resources :comments, only: %i[create]
      end
    end
  end

  resources :comments, only: %i[destroy update]
end
