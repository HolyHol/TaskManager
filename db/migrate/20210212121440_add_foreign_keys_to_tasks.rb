class AddForeignKeysToTasks < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :tasks, :users, column: :assignee_id
    add_foreign_key :tasks, :users, column: :author_id
  end
end
