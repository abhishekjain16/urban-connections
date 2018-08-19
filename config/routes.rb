Rails.application.routes.draw do
  root to: "api/users#index"

  namespace :api do
    defaults format: :json do
      resources :users do
        collection do
          post :logged_in
        end
      end
      resources :business, only: [:create, :index, :show]
      controller :sessions do
        post 'sign_in' => :create
        delete 'sign_out' => :destroy
      end

      namespace :admin do
        resources :users
        resources :business
      end

      namespace :owner do
        resources :business, only: [:index, :show, :update]
      end

      namespace :staff do
      end
    end
  end
end
