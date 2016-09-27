class Solicitud < ActiveRecord::Base
  belongs_to :applicant
  belongs_to :analyst
  has_one :report

  accepts_nested_attributes_for :applicant, allow_destroy: true
  accepts_nested_attributes_for :analyst, allow_destroy: true

  validates :description, :estado, presence: true

  def self.permited_params
    [:description, :estado]
  end

  def set_report
    self.report.blank? ? 0 : self.report    
  end

end