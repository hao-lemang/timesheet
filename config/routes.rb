Rails.application.routes.draw do
  get 'sessions/new'
  resources :time_sheets do
    resources :line_items
  end
  resources :users do
    resources :time_sheets do
      resources :line_items
    end
  end

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  root to: 'sessions#new'
end
