class RemoveDoneFromTodos < ActiveRecord::Migration[8.0]
  def change
    remove_column :todos, :done, :boolean
  end
end
