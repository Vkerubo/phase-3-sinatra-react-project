class CreateTasks < ActiveRecord::Migration[6.1]
  def change
     create_table :tasks do |t|
      t.string :name
      t.date :due_date
      t.text :description
      t.string :status
      t.string :priority
      t.boolean :completed

    end
  end
end
