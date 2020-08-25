class CreateHabits < ActiveRecord::Migration[6.0]
  def change
    create_table :habits do |t|
      t.string :name
      t.integer :xp
      t.text :description

      t.timestamps
    end
  end
end
