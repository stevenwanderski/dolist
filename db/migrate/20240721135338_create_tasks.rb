class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.integer :project_id
      t.string :name
      t.text :description
      t.boolean :is_completed, default: false
      t.integer :weight

      t.timestamps
    end
  end
end
