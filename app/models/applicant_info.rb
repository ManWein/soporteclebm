class ApplicantInfo < ActiveRecord::Base
  belongs_to :applicant

  accepts_nested_attributes_for :applicant, allow_destroy: true

  validates :name, :username, :cedula, :tlf, :cargo, :office_id, presence: true

end
