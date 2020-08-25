class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.text :description
      t.integer :xp
      t.integer :time_to_complete
      t.references :lesson, null: false, foreign_key: true

      t.timestamps
    end
  end
end
