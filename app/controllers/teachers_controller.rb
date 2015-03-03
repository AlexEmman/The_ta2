class TeachersController < ApplicationController
  before_action :logged_in?, only: [:show]


  def new
     @teacher = Teacher.new
  end

  def create
     @teacher = Teacher.create(teacher_params)
     if @teacher.save
        flash[:success] = "Welcome to the Sample App!"
        redirect_to teacher_path(@teacher.id)
        # redirect_to teacher_path(@teacher.id)
     else render 'new'
     end
  end

  def show
    find_teacher
  end
  
  private

   def teacher_params
     params.require(:teacher).permit(:first_name, :last_name, :email, :password)
   end

   def find_teacher
    @teacher = Teacher.find(params[:id])
  end


end
