class Applicant < User
  has_one :applicant_info
  accepts_nested_attributes_for :applicant_info
  
  has_many :applicant_computers
  has_many :computers, through: :applicant_computers


  validates_presence_of :applicant_info
    
  def sign_in_path
     Rails.application.routes.url_helpers.root_path
  end

  def self.permited_params
    [:type, :email, :password, :password_confirmation, applicant_info_attributes: ([:name, :username])]
  end

  def name
    self.applicant_info.blank? ? "N/A" : self.applicant_info.name
  end

  def username
    self.applicant_info.blank? ? "N/A" : self.applicant_info.username
  end

end
