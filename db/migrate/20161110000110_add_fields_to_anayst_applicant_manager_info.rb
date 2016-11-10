class AddFieldsToAnaystApplicantManagerInfo < ActiveRecord::Migration
  def change
    add_column :applicant_infos, :cargo, :string
    add_column :applicant_infos, :office_id, :integer
    
    add_column :analyst_infos, :cedula, :string
    add_column :analyst_infos, :tlf, :string

    add_column :manager_infos, :cedula, :string
    add_column :manager_infos, :tlf, :string
  end
end
