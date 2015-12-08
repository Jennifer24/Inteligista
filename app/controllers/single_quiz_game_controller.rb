class SingleQuizGameController < ApplicationController
	def new 
		@quiz = Quiz.limit(1).order("RANDOM()").first

	end
end
