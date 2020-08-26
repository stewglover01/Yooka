class CreateBadgeUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :badge_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :badge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
