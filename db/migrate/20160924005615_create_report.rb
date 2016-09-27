class CreateReport < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer  :solicitud_id
      t.integer  :tipo_servicio
      t.text     :detalle_servicio
      t.boolean  :estatus, default: true

      t.timestamps
    end
  end
end
