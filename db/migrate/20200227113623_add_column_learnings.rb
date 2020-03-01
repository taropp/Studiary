class AddColumnLearnings < ActiveRecord::Migration[5.2]
  def change
    add_column :learnings, :subject, :string
  end
end
