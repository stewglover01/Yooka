class AddAuthorDescriptionAndPhoto < ActiveRecord::Migration[6.0]
  def change
    add_column :lessons, :author_description, :string
    add_column :lessons, :author_photo, :string
  end
end
