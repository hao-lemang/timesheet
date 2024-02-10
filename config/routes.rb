Rails.application.routes.draw do
  resources :users do
    resources :timesheets do
      resources :line_items
    end
  end
end
