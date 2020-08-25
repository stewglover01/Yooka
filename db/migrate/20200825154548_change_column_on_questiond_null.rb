class ChangeColumnOnQuestiondNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:questions, :activity_id, true)
    change_column_null(:questions, :habit_id, true)
  end
end
