class CreateApplicantInfo < ActiveRecord::Migration
  def change
    create_table :applicant_infos do |t|
      t.integer :applicant_id
      t.string  :name
      t.string  :username

      t.timestamps
    end
  end
end
