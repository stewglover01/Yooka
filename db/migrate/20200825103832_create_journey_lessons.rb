class CreateJourneyLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :journey_lessons do |t|
      t.references :lesson, null: false, foreign_key: true
      t.boolean :complete
      t.references :journey, null: false, foreign_key: true

      t.timestamps
    end
  end
end
