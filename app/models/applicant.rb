class Applicant < User
  has_one :applicant_info
    
  def sign_in_path
     Rails.application.routes.url_helpers.root_path
  end

  def self.permited_params
   [:type, :email, :password, :password_confirmation, applicant_info_attributes: ([:name, :username])]
  end
end