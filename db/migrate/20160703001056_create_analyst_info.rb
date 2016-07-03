class CreateAnalystInfo < ActiveRecord::Migration
  def change
    create_table :analyst_infos do |t|
      t.integer :analyst_id
      t.string  :name
      t.string  :username

      t.timestamps
    end
  end
end
