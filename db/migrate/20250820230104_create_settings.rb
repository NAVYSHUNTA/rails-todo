class CreateSettings < ActiveRecord::Migration[8.0]
  def change
    create_table :settings do |t|
      t.integer :default_deadline_days
      t.integer :default_deadline_hours
      t.integer :default_deadline_minutes

      t.timestamps
    end
  end
end
