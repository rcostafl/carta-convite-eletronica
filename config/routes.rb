Rails.application.routes.draw do
  devise_for :users
  
  resources :needs, only: %i[new create show edit update index destroy] do
    collection do
      get 'my_needs'    
    end

    resources :proposals, only: %i[create]
  end

  resources :proposals, only: %i[update destroy] do
    collection do
      get 'my_proposals'    
    end
  end

  
  
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
 