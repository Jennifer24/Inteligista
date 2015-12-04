class HomeController < ApplicationController
	def index
		@just_registered = session[:just_registered]
		session[:just_registered] = false
		render 'index'
	end

	def new
		render 'new'
	end

end
