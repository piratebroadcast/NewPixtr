Pixtr::Application.routes.draw do
  get "/galleries/random" => "random_galleries#show"
  get 'tags/:tag', to: 'images#index', as: :tag

  root "homes#show"

  get '/search', to: 'searches#show'

  resource :dashboard, only: [:show]

  resources :galleries do
    resources :images, only: [:new, :create]
  end

  resources :groups, only: [:index, :show, :new, :create] do
    member do
      post "join" => "group_memberships#create"
      delete "leave" => "group_memberships#destroy"
      post "like" => "group_likes#create"
      delete "unlike" => "group_likes#destroy"
    end
  end

  resources :images, except: [:index, :new, :create] do
    resources :comments, only: [:create]
    member do
      post "like" => "image_likes#create"
      delete "unlike" => "image_likes#destroy"
    end
  end

  resources :charges, only: [:create]

  resources :accounts, only: [:show]

  resources :users, only: [:show] do
    member do
      post "follow" => "following_relationships#create"
      delete "unfollow" => "following_relationships#destroy"
    end
  end
end
