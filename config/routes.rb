Rails.application.routes.draw do
    get 'group_memberships/controller'
    root 'static_pages#home'
    get 'password_resets/new'
    get 'password_resets/edit'
    get 'sessions/new'
    get 'admin/css_workshop'
    get 'admin/workshop'
    get 'static_pages/home'
    get 'static_pages/help'
    get 'static_pages/about'
    get 'static_pages/biz_type'
    get 'static_pages/pro_type'
    get 'static_pages/admin_menu'
    get 'static_pages/statistics'
    get 'static_pages/central'
    get 'static_pages/relation'
    get 'static_pages/secretary'
    get 'cover/alpha'
    get 'cover/donate'
    get 'cover/contact'
    get 'cover/privacy_policy'
    get 'cover/developer'
    get 'cover/freelance'
    get 'cover/portfolio'
    get 'category/recovery'
    get 'category/fitness'
    get 'category/cooking'
    get 'category/finance'
    get 'category/gaming'
    get 'category/music'
    get 'category/politics'
    get '/signup', to: 'users#new'
    # get '/users/edit', to: 'users#edit'
    # post '/signup', to: 'users#create'
    get '/search', to: 'search#all'
    get '/search_user', to: 'search#user'
    get '/search_group', to: 'search#group'
    # get '/search_article'
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
    resources :microposts, only: [:create, :destroy] do
      # resources :pins, only: [:create, :destroy]
      resources :likes, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy] do
        resources :commmentlikes, only: [:create, :destroy]
        resources :replies, only: [:create, :destroy] do
          resources :replylikes, only: [:create, :destroy]
        end
      end
    end
    resources :pins, only: [:create, :destroy] do
      resources :likes, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy] do
        resources :commmentlikes, only: [:create, :destroy]
        resources :replies, only: [:create, :destroy] do
          resources :replylikes, only: [:create, :destroy]
        end
      end
    end
    resources :notifications, only: [:index]
    resources :groups do
      resources :gposts, only: [:create, :destroy] do
        resources :glikes, only: [:create, :destroy]
        resources :gcomments, only: [:create, :destroy] do
          resources :gcommentlikes, only: [:create, :destroy]
          resources :greplies, only: [:create, :destroy] do
            resources :greplylikes, only: [:create, :destroy]
          end
        end
      end
    end
    resources :events
    resources :polls
    resources :debates
    resources :views, only: [:index]
    resources :categories
    resources :todo
    resources :messages
    resources :themes
    resources :articles
    resources :users do
      member do
        get :following, :followers
      end
    end
    resources :account_activations, only: [:edit]
    resources :password_resets, only: [:new, :create, :edit, :update]
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :relationships, only: [:create, :destroy]
  end
