class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :question_text
      t.string :response_a
      t.string :response_b
      t.string :response_c
      t.string :response_d
      t.string :correct_response
      t.references :quiz, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
