Rails.application.routes.draw do
  devise_for :admins, skip: :all
  namespace :api do
    namespace :v1 do
      get 'members/index'
      get 'members/show'
      get 'members/update'
      get 'members/create'
      get 'members/delete'
    end
  end
  namespace :api do
    namespace :v1 do
      get 'contact/create'
    end
  end
end
