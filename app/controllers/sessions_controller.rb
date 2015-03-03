class SessionsController < ApplicationController
	def new
	end

	def create
		teacher_params = params.require(:teacher)
		teacher = Teacher.confirm(teacher_params[:email], teacher_params[:password])
		if teacher
			# use our handy login method
			login(teacher)
			redirect_to teacher_path(teacher.id)
		else
			redirect_to "/login"
		end
	end
end