Rails.application.routes.draw do
  devise_for :admins, skip: :all
  namespace 'api' do
    namespace 'v1' do
      scope 'contacts' do
        post 'create', to: 'contacts#create'
      end
      scope 'members' do
        get 'index', to: 'members#index'
        get 'show/:id', to: 'members#show'
        post 'create', to: 'members#create'
        patch 'update/:id', to: 'members#update'
        delete 'delete/:id', to: 'members#delete'
        post '/add_photo/:id', to: 'members#add_photo'
      end
      scope 'admins' do
        get 'login', to: 'admins#login'
        get 'logout', to: 'admins#logout'
      end
      scope 'projects' do
        get 'index', to: 'projects#index'
        get 'show/:id', to: 'projects#show'
        post 'create', to: 'projects#create'
        patch 'update/:id', to: 'projects#update'
        delete 'delete/:id', to: 'projects#delete'
        post '/add_photo/:id', to: 'projects#add_photo'
      end
      scope 'partners' do
        get 'index', to: 'partners#index'
        get 'show/:id', to: 'partners#show'
        post 'create', to: 'partners#create'
        patch 'update/:id', to: 'partners#update'
        delete 'delete/:id', to: 'partners#delete'
      end
      scope 'services' do
        get 'index', to: 'services#index'
        get 'show/:id', to: 'services#show'
        post 'create', to: 'services#create'
        patch 'update/:id', to: 'services#update'
        delete 'delete/:id', to: 'services#delete'
      end
    end
  end
end
