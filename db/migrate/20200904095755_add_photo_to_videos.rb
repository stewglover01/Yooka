class AddPhotoToVideos < ActiveRecord::Migration[6.0]
  def change
        add_column :videos, :photo, :string
  end
end
