class SingleQuizGameController < ApplicationController
	def new 
		authenticate_user!

		@quiz = Quiz.find_by(id: params[:id])

		if (current_user.coins >= @quiz.coins_to_play)
			current_user.coins = current_user.coins - @quiz.coins_to_play
			current_user.save
			render 'new'
		else
			redirect_to '/shop'
		end
	end

	def show
	    @quiz = current_quiz.quizzes.find(params[:id])	
	    @quizzes = Quiz.all

	end

	def validate_answer
    # answer the user gave
    answer = params[:answer]

    # Find the quiz the user is taking
    quiz = Quiz.find_by_id(params[:quiz_id])

    # find the question the user is on
   	question = 

    # did the user answer the question correctly?
    if quiz.correct_answer == answer

        # They did answer correctly

        # Increment the user's correctResponse field

    end
end


end
