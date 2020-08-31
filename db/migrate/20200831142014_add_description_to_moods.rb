class AddDescriptionToMoods < ActiveRecord::Migration[6.0]
  def change
    add_column :moods, :description, :string
  end
end
