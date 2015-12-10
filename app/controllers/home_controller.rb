class HomeController < ApplicationController
	def index
		@just_registered = session[:just_registered]
		session[:just_registered] = false
		render 'index'
	end

	def shop
		render 'shop'
	end



end
