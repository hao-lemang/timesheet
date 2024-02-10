Rails.application.routes.draw do
  resources :time_sheets do
    resources :line_items
  end
  resources :users do
    resources :time_sheets do
      resources :line_items
    end
  end
end
