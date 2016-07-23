class Analyst < User
  has_one :analyst_info
  accepts_nested_attributes_for :analyst_info

  has_many :solicituds
  accepts_nested_attributes_for :solicituds, :allow_destroy => true

  validates_presence_of :analyst_info
    
  def sign_in_path
     Rails.application.routes.url_helpers.root_path
  end

  def self.permited_params
    [:type, :email, :password, :password_confirmation, manager_info_attributes: ([:name, :username])]
  end

end
