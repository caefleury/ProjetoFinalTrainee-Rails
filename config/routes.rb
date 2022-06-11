Rails.application.routes.draw do
  devise_for :admins, skip: :all
  namespace :api do
    namespace :v1 do
      get 'contact/create'
    end
  end
end
