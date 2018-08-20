Rails.application.routes.draw do
  root to: "api/users#index"

  namespace :api do
    defaults format: :json do
      resources :users do
        collection do
          post :logged_in
        end
      end
      resources :business, only: [:create, :index, :show] do
        member do
          get 'owner' => :owner
          get 'yelp' => :yelp
          get 'reviews' => :reviews
          get 'my_business' => :my_business
        end
        resources :services, only: [:index]
        resources :orders do
          collection do
            get 'last' => :last
          end
        end
      end

      resources :orders, only: [] do
        collection do
          get 'all', :all
        end
        resources :order_items
      end

      controller :sessions do
        post 'sign_in' => :create
        delete 'sign_out' => :destroy
      end

      namespace :admin do
        resources :users
        resources :business
      end

      namespace :owner do
        resources :business, only: [:index, :show, :update] do
          resources :services
          resources :staffs
        end
      end

      namespace :staff do
        resources :orders
      end
    end
  end
end
