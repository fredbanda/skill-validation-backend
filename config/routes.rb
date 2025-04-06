Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :companies, only: [ :index, :show, :create, :update, :destroy ]
      resources :invoices, only: [ :index, :show, :create, :update, :destroy ]
      resources :checks, only: [ :index, :show, :create, :update, :destroy ] do
        member do
          post :link_invoices
        end
      end
      resources :check_invoices, only: [ :index, :create, :destroy ]
    end
  end

  # Add this line **outside** the API block:
  mount ActiveStorage::Engine => "/rails/active_storage"
end
