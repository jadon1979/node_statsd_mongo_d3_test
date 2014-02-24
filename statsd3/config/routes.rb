Statsd3::Application.routes.draw do

  resources :users do 
    resources :pages do
      resources :page_stats, only: [:index]
    end
  end

  root 'users#index'
end
