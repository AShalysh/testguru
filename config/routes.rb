Rails.application.routes.draw do
  #http://localhost:3000/tests/new
  #http://localhost:3000/tests/1/questions/new
  #http://localhost:3000/tests/1/questions

  #to root to default localhost:3000/
  root to: 'tests#index'

  #resources :tests

  #get '/tests/:category/:title', to: 'tests#search', level: 2

  resources :tests, shallow: true do
    resources :questions
  end

#whatever is in start method in tests_controller
 # post '/tests/:id/start/:user_id', to: 'tests#start'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
