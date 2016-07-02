class CreateManagerInfo < ActiveRecord::Migration
  def change
    create_table :manager_infos do |t|
      t.integer :manager_id
      t.string  :name
      t.string  :username

      t.timestamps
    end
  end
end
