class RenameCorrectAnswer < ActiveRecord::Migration[6.0]
  def change
    rename_column :responses, :correct?, :correct
  end
end
