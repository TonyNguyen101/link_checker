Rails.application.routes.draw do
  root 'websites#new'
  
  get '/websites/new', to: "websites#new"

  post '/websites', to: "websites#create"

  get '/websites', to: "websites#show" #, as: "show"

#         root GET  /                       websites#new
# websites_new GET  /websites/new(.:format) websites#new
#     websites POST /websites(.:format)     websites#create
#              GET  /websites(.:format)     websites#show

end
