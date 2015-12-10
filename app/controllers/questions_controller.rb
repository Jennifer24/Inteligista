class QuestionsController < ApplicationController
	
	def new
		@quiz = Quiz.find(params[:quiz_id])
	end


	def create
		@quiz = Quiz.find(params[:quiz_id])
    	@question = @quiz.questions.create(question_params)
    	redirect_to quiz_path(@quiz)
	end
 private
    def question_params
      params.require(:question).permit(:question_text, :response_a, :response_b, :response_c, :response_d, :correct_response)
    end

end
