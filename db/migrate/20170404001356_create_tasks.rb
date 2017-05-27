class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.integer :spentTime
      t.datetime :date
      t.integer :id_category
      t.integer :id_user
      t.boolean :done

      t.timestamps
    end
  end
end
