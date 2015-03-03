module SessionsHelper

  def login(teacher)
  	session[:teacher_id] = teacher.id
  	@current_teacher = teacher
  end

  def logout
	@current_teacher = session[:teacher_id] = nil
  end
    def logged_in?
	if current_teacher == nil
	redirect_to "/login"
	end
end

	def current_teacher
	@current_teacher = @current_teacher || Teacher.find_by(id: session[:teacher_id])
	end
end