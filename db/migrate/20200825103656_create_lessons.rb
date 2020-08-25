class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.string :name
      t.text :description
      t.string :author
      t.string :topic
      t.integer :time_to_complete
      t.string :photo

      t.timestamps
    end
  end
end
