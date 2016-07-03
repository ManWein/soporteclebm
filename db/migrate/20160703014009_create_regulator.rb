class CreateRegulator < ActiveRecord::Migration
  def change
    create_table :regulators do |t|
      t.integer :computer_id
      t.string :marca
      t.string :modelo
      t.string :serial
      t.string :bien_nacional
      t.boolean :estatus, default: true

      t.timestamps
    end
  end
end
