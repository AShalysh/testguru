Rails.application.routes.draw do

  root 'tests#index'
  devise_for :users, 
    path: :gurus, 
    path_name: { sign_in: :login, sign_out: :logout },
    controllers: {
      sessions: 'my_devise/sessions'
    }

  get 'users/new'

  resources :tests, only: :index do
    # resources :questions, shallow: true, except: :index do
    #   resources :answers, shallow: true, except: :index
    #end
    post :start, on: :member  
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end
  
  namespace :admin, shallow: true do
    resources :gists
    
    resources :tests do
      patch :update_inline, on: :member
      resources :questions do
        resources :answers
      end
    end
  end

end
