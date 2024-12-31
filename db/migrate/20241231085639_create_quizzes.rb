class CreateQuizzes < ActiveRecord::Migration[7.0]
  def change
    create_table :quizzes do |t|
      t.string :question, null: false
      t.string :correct_answer
      t.text :options
      t.integer :score, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
