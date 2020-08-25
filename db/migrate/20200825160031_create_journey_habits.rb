class CreateJourneyHabits < ActiveRecord::Migration[6.0]
  def change
    create_table :journey_habits do |t|
      t.boolean :complete
      t.references :journey, null: false, foreign_key: true
      t.references :habit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
