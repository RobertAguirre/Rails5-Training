Rails.application.routes.draw do
  get 'demo/index'

  #default route, may be phased out in future versions of Rails
    #get ':controller(/:action(:id))'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
