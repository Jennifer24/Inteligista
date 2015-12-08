class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |column|
      # t.text :questions
      column.text :name
      column.text :prize_name
      column.text :prize_img
      column.integer :points_to_win
      column.integer :coins_to_play
      column.timestamps null: false
    end
  end
end
