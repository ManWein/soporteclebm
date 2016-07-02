Rails.application.routes.draw do
  # Root path:
  root to: 'main#dashboard'

  devise_for :users
  #,
  #           controllers: {sessions: 'user/sessions', registrations: 'user/registrations'},
  #           :path_names => {sign_in: 'login/main', sign_out: 'logout', sign_up: 'register/:type'}

  #devise_scope :user do
  #  get "/users/login/:type" => "user/sessions#new"
  #  get "/users/register/:type" => "user/registrations#new"
  #end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

end
