class CreateComputer < ActiveRecord::Migration
  def change
    create_table :computers do |t|
      t.string :marca
      t.string :modelo
      t.string :serial
      t.string :bien_nacional
      t.string :tarjeta_madre
      t.string :procesador
      t.string :memoria_ram
      t.string :disco_duro
      t.string :cdrom
      t.string :sistema_operativo
      t.boolean :en_red, default: false
      t.text :software_extra
      t.integer :estatus_servicio, default: 0
      t.integer :tipo, default: 0
      t.boolean :estatus, default: true

      t.timestamps
    end
  end
end
