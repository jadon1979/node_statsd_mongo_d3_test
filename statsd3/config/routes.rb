Statsd3::Application.routes.draw do

  resources :users do 
    resources :pages, except: [:index] do
      resources :page_stats, only: [:index]
    end
  end

  resources :users_pages, only: [:index]


  root 'users#index'
end
