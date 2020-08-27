class AddVideoToVideos < ActiveRecord::Migration[6.0]
  def change
    add_column :videos, :video, :string
  end
end
