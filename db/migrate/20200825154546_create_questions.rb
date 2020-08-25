class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :question
      t.string :correct_answer
      t.string :possible_answers
      t.references :activity, null: false, foreign_key: true
      t.references :habit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
