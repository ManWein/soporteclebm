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

  resources :analysts do
    member do
      get :dashboard
    end
    resources :solicituds
  end

  resources :applicants do
    member do
      get :dashboard
    end
    resources :solicituds
  end

  resources :solicituds
  resources :mice
  resources :regulators
  resources :keyboards
  resources :monitors
  resources :cpus
  resources :printers
  resources :offices
  resources :reports



  get "/componentes", to: 'main#componentes'

  get '/componentes', to: 'main#componentes'

  get '/cpu_user', to: 'cpus#cpu_user'

  get :cpu_user_new, to: 'cpus#cpu_user_new'

  post :cpu_user_new, to: 'cpus#cpu_user_create'

  delete '/cpu_user_delete/:cpu_id/:user_id', to: 'cpus#cpu_user_delete'

  get '/analysts_solicitud', to: 'solicituds#analysts_solicitud'

  get :analysts_solicitud_new, to: 'solicituds#analysts_solicitud_new'

  post :analysts_solicitud_new, to: 'solicituds#analysts_solicitud_create'

  delete '/analysts_solicitud_delete/:analyst_id/:solicitud_id', to: 'solicituds#analysts_solicitud_delete'




end
