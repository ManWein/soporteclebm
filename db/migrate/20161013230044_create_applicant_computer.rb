class CreateApplicantComputer < ActiveRecord::Migration
  def change
    create_table :applicant_computers do |t|
      t.belongs_to :applicant, index: true
      t.belongs_to :computer, index: true
      t.timestamps
    end
  end
end