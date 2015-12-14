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

    # if  current_user.total_points = current_user.total_points - @quiz.points_to_play
    #  	current_user.save
    #  end

  end


  def show
    @quiz = current_quiz.quizzes.find(params[:id])
    @quizzes = Quiz.all

  end


  def validate_response
    # Find the quiz the user is taking
    quiz = Quiz.find_by_id(params[:quiz_id])

    # find the question the user is on
    question_number = params[:question_number].to_i - 1

    # answer the user gave
    response = params[:response]

    question = quiz.questions[question_number]

    # did the user answer the question correctly?
    if question.correct_response == response
       # user.points += 1
      # They did answer correctly
      render :json => {res:"correct!"}
    else
      render :json => {res:"wrong!"}
    end
  end


end
