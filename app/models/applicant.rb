class Applicant < User
  has_many :applicant_computers
  has_many :computers, through: :applicant_computers

  has_one :applicant_info
  accepts_nested_attributes_for :applicant_info

  validates_presence_of :applicant_info
    
  def sign_in_path
     Rails.application.routes.url_helpers.dashboard_applicant_path(self)
  end

  def self.permited_params
    [:type, :email, :password, :password_confirmation, applicant_info_attributes: ([:name, :username, :cedula, :tlf, :cargo, :office_id])]
  end

  def name
    self.applicant_info.blank? ? "N/A" : self.applicant_info.name
  end

  def username
    self.applicant_info.blank? ? "N/A" : self.applicant_info.username
  end

  def cedula
    self.applicant_info.blank? ? "N/A" : self.applicant_info.cedula
  end

  def tlf
    self.applicant_info.blank? ? "N/A" : self.applicant_info.tlf
  end

  def cargo
    self.applicant_info.blank? ? "N/A" : self.applicant_info.cargo
  end

  def oficina_nombre
    self.applicant_info.blank? ? "N/A" : self.applicant_info.oficina_nombre
  end

end
