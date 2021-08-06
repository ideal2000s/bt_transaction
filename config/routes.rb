Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #
  namespace :api do
    namespace :v1 do
      resources :block_chain_transactions do
        collection do
          get :largest_unconfirmed_transaction
        end
      end
    end
  end
end
