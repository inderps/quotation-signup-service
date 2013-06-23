class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string :identifier
      t.string :email
      t.datetime :visit_time
      t.integer :visit_count

      t.timestamps
    end
  end
end
