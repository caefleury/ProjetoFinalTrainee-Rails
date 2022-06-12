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
      end
    end
  end
end
