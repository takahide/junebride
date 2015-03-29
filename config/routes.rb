Junbride::Application.routes.draw do
  resources :guests

  get '', to: 'top#index'
  get '/attend/:code', to: 'top#attend'
  get '/not_attend/:code', to: 'top#not_attend'
  get '/get/:code', to: 'top#get_data'
end
