class AddUserIdToResponses < ActiveRecord::Migration[6.0]
  def change
    add_reference :responses, :user, index: true
    add_foreign_key :responses, :users
  end
end
