class CreateTodos < ActiveRecord::Migration[8.0]
  def change
    create_table :todos do |t|
      t.text :task
      t.integer :priority
      t.boolean :done
      t.datetime :deadline

      t.timestamps
    end
  end
end
