class RemovePositionFromTodos < ActiveRecord::Migration[8.0]
  def change
    remove_column :todos, :position, :integer
  end
end
