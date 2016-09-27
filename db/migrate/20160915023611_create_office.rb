class CreateOffice < ActiveRecord::Migration
  def change
    create_table :offices do |t|
      t.string :nombre
      t.boolean :estatus, default: true

      t.timestamps
    end
  end
end
