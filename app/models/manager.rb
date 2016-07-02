class Manager < User
  has_one :manager_info
  accepts_nested_attributes_for :manager_info

  validates_presence_of :manager_info
    
  def sign_in_path
     Rails.application.routes.url_helpers.root_path
  end

  def self.permited_params
    [:type, :email, :password, :password_confirmation, manager_info_attributes: ([:name, :username])]
  end

end