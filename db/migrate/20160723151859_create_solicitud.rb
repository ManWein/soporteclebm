class CreateSolicitud < ActiveRecord::Migration
  def change
    create_table :solicituds do |t|
      t.integer :applicant_id
      t.integer :analyst_id
      t.text :description
      t.integer :estado, default: 0
      t.boolean :estatus, default: true

      t.timestamps
    end
  end
end
