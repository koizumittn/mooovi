TechReviewSite::Application.routes.draw do

  resources :products, only: [:index, :show] do
    collection do
      get 'search'
    end
    resources :reviews, only: [:new, :create]
  end

  root 'products#index'

end
