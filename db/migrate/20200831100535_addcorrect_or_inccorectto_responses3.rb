class AddcorrectOrInccorecttoResponses3 < ActiveRecord::Migration[6.0]
  def change
    add_column :responses, :correct?, :boolean
  end
end
