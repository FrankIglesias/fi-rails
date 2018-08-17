Rails.application.routes.draw do
  devise_for :users

  api_version(module: 'api/v1', path: { value: 'api/v1' }, defaults: { format: :json }) do
    resources :users do
      collection do
        resources :sessions, only: [:create] do
          collection do
            post :renew
            post :invalidate_all
          end
        end
      end
    end
    resources :books, only: [:show, :index]
    resources :rents, only: [:create, :index]
  end
end
