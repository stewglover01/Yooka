class CreateDailyMoods < ActiveRecord::Migration[6.0]
  def change
    create_table :daily_moods do |t|
      t.references :user, null: false, foreign_key: true
      t.references :mood, null: false, foreign_key: true

      t.timestamps
    end
  end
end
