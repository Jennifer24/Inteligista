

class QuizzesController < ApplicationController

  
  def new
  	@quiz = Quiz.new
    render 'new'
  end


  def create
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
      redirect_to '/quizzes'
    else
      render 'new'
    end
  end


  def index
  	@quizzes = Quiz.all
    logger.info Quiz
  	render 'index'
  end


  def show
    posible_quiz = Quiz.find_by(id: params[:id])

    if posible_quiz != nil
	   @quiz = Quiz.find_by(id: params[:id])
   else
    @quizNotFoundError = "Unable to find quiz"
    end
  end


  def destroy
    @quiz = Quiz.find(params[:id])
    @quiz.destroy
 
    redirect_to quizzes_path
  end


  private
  def quiz_params
    params.require(:quiz).permit(:name, :prize_name, :prize_img, :points_to_win, :coins_to_play)
  end

  # render plain: params[:quiz].inspect

end
