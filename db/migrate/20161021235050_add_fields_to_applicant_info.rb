class AddFieldsToApplicantInfo < ActiveRecord::Migration
  def change
    add_column :applicant_infos, :cedula, :string
    add_column :applicant_infos, :tlf, :string
  end
end
