TechReviewSite::Application.routes.draw do

  devise_for :users
  resources :users, only: :show
  resources :products, only: [:index, :show] do
    collection do
      get 'search'
    end
    resources :reviews, only: [:new, :create]
  end

  root 'products#index'

end
