class Solicitud < ActiveRecord::Base
  belongs_to :applicant
  belongs_to :analyst

  accepts_nested_attributes_for :applicant, allow_destroy: true
  accepts_nested_attributes_for :analyst, allow_destroy: true

  validates :description, :estado, presence: true

end
