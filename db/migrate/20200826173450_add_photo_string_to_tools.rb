class AddPhotoStringToTools < ActiveRecord::Migration[6.0]
  def change
    add_column :tools, :photo, :string
  end
end
