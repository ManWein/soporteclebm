class ApplicantInfo < ActiveRecord::Base
  belongs_to :applicant
  belongs_to :office

  accepts_nested_attributes_for :applicant, allow_destroy: true
  validates :name, :username, :cedula, :tlf, :cargo, :office_id, presence: true

  def oficina_nombre
    self.office.blank? ? "N/A" : self.office.set_nombre
  end

end

