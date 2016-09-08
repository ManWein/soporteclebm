Rails.application.routes.draw do
  # Root path:
  root to: 'main#dashboard'

  devise_for :users,
              path_names: {sign_in: 'login', sign_out: 'logout'}
  #,
  #           controllers: {sessions: 'user/sessions', registrations: 'user/registrations'},
  #           :path_names => {sign_in: 'login/main', sign_out: 'logout', sign_up: 'register/:type'}

  #devise_scope :user do
  #  get "/users/login/:type" => "user/sessions#new"
  #  get "/users/register/:type" => "user/registrations#new"
  #end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :managers do
    member do
      get :dashboard
    end
  end

  resources :solicitudes
  resources :mice
  resources :regulators
  resources :keyboards
  resources :monitors
  resources :cpus


  get "/componentes", to: 'main#componentes'



end
