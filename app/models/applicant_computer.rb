class ApplicantComputer < ActiveRecord::Base
  belongs_to :applicant
  belongs_to :computer
end