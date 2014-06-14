Curso::Application.routes.draw do

  resources :users do
    member do
      get :profile
    end
  end
  
  resources :session

  resources :books do
    member do
      patch :read 
    end
    resources :comments
  end

  root 'books#index'
end
