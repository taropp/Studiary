class CreateLearnings < ActiveRecord::Migration[5.2]
  def change
    create_table :learnings do |t|
      t.integer :learning_time
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :learnings, [:user_id, :created_at]
  end
end
