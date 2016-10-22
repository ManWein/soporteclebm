class CreateAnalystSolicitud < ActiveRecord::Migration
  def change
    create_table :analyst_solicituds do |t|
      t.belongs_to :analyst, index: true
      t.belongs_to :solicitud, index: true
      t.timestamps
    end
  end
end
