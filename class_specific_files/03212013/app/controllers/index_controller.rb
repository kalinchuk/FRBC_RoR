class IndexController < ApplicationController

	def test
		user = User.create
		render :text => user.attributes
	end

end