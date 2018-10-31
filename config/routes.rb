Rails.application.routes.draw do

  root 'tests#index'
  
  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    post :start, on: :member
    
  end

# GET /test_passages/101/result
  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
    #get :result, on: :member
  end
end
