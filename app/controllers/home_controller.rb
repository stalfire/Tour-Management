class HomeController < ApplicationController
	def list
		@list = User.where(id: 1..27)
	end
end
