class CreatePrinter < ActiveRecord::Migration
  def change
    create_table :printers do |t|
      t.string :marca
      t.string :modelo
      t.string :serial
      t.string :bien_nacional
      t.boolean :estatus, default: true

      t.timestamps
    end
  end
end
