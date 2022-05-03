# frozen_string_literal: true

Rails.application.routes.draw do
  get '/@:user_id', to: 'users#default_resume'
  get '/@:user_id/:id', to: 'resumes#show', as: 'user_resume'

  resources :resumes do
    resources :comments, shallow: true, only: [:create, :destroy]
    collection do
      get :my
    end

    member do
      patch :pin
      post :like
      delete :unlike
      post :buy
      get :view
    end
  end

  resource :users, only: [:create] do
    get :sign_up
    get :sign_in
  end

  resource :sessions, only: %i[create destroy]

  resources :orders, only: [:index] do
    member do
      get :checkout
      post :pay
      delete :cancel
    end
  end

  namespace :admin do
    resources :vendors, except: [:show]
    resources :users, only: [:index]
  end

  namespace :api do
    namespace :v1 do
      resources :resumes, only: [] do
        post :like
        delete :unlike
      end
    end
  end

  root 'resumes#index'
end
