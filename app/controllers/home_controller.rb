class HomeController < ApplicationController
	def list
		@list = User.all
	end
end
