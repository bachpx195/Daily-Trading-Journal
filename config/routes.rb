Rails.application.routes.draw do
  resources :currency_pairs
  resources :merchandises
  devise_for :users

  resources :blogs
  resources :system_configs
  resources :currency_pairs do
    member do
      get 'candlesticks', to: "candlesticks#index"
      post 'candlesticks', to: "candlesticks#create"
    end
  end
  mount Ckeditor::Engine => '/ckeditor'

  root "blog/blogs#index"
  get '/blog/:id', to: 'blog/blogs#show'


  get "dashboard", to: "dashboard#index"
  get "/pages/*page", to: "dashboard#show"

  resources :fund_logs
  resources :logs
  resources :trades do
    member do
      get 'close', to: 'trades#close'
    end
  end
  resources :trade_normal_methods
  resources :trade_pyramid_methods
  resources :trade_methods
  resources :funds
  resources :wikis
  resources :daily_reports
  resources :news_sites
  resources :news do
    collection do
      get 'canlendar', to: 'news#canlendar'
    end
  end
  resources :coins
  resources :tags
  resources :plans
  resources :calculates
  resources :glossaries
  resources :comments

  namespace :api do
    namespace :v1 do
      resources :tags
      resources :plans
      resources :news
    end
  end
end
