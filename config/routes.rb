Rails.application.routes.draw do
  root "static_pages#home"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"

  namespace :trainee do
    root "courses#index"
  end
  resources :courses do
    member do
      get "assign_trainee"
      post "add_trainee"
      post "start"
      get "delete_trainee"
    end
  end
  resources :subjects do
    resources :tasks, except: %i(index show)
  end
  resources :course_subjects, only: :show do
    member do
      patch "finish"
      patch "start"
    end
  end
end
