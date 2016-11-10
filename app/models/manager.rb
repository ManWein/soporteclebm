class Manager < User
  has_one :manager_info
  accepts_nested_attributes_for :manager_info

  validates_presence_of :manager_info
    
  def sign_in_path
    Rails.application.routes.url_helpers.dashboard_manager_path(self)
  end

  def self.permited_params
    [:type, :email, :password, :password_confirmation, manager_info_attributes: ([:name, :username, :cedula, :tlf])]
  end

  def name
    self.manager_info.blank? ? "N/A" : self.manager_info.name
  end

  def username
    self.manager_info.blank? ? "N/A" : self.manager_info.username
  end

end
