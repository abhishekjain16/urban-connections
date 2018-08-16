Rails.application.routes.draw do
  root to: "api/users#index"

  namespace :api do
    defaults format: :json do
      resources :users
      resources :business, only: [:create]
      controller :sessions do
        post 'sign_in' => :create
        delete 'sign_out' => :destroy
      end

      namespace :admin do
      end

      namespace :owner do
        resources :business, only: [:index, :show, :update]
      end

      namespace :staff do
      end
    end
  end
end
