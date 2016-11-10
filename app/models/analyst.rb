class Analyst < User
  has_one :analyst_info
  accepts_nested_attributes_for :analyst_info

  has_many :analyst_solicituds
  has_many :solicituds, through: :analyst_solicituds

  #has_many :solicituds
  #accepts_nested_attributes_for :solicituds, :allow_destroy => true

  validates_presence_of :analyst_info

  def sign_in_path
     Rails.application.routes.url_helpers.dashboard_analyst_path(self)
  end

  def self.permited_params
    [:type, :email, :password, :password_confirmation, analyst_info_attributes: ([:name, :username, :cedula, :tlf])]
  end

  def name
    self.analyst_info.blank? ? "N/A" : self.analyst_info.name
  end

  def username
    self.analyst_info.blank? ? "N/A" : self.analyst_info.username
  end

  def cedula
    self.analyst_info.blank? ? "N/A" : self.analyst_info.cedula
  end

  def tlf
    self.analyst_info.blank? ? "N/A" : self.analyst_info.tlf
  end

end
