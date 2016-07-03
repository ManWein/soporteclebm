class CreateScreen < ActiveRecord::Migration
  def change
    create_table :screens do |t|
      t.integer :computer_id
      t.string :marca
      t.string :modelo
      t.string :serial
      t.string :bien_nacional
      t.string :pulgadas
      t.boolean :estatus, default: true

      t.timestamps
    end
  end
end
