class StudentsController < ApplicationController
  def index
  end

  def new
    @student = Student.new
  end

  def create
      # Teacher.create(first_name: "Angelo", last_name: "Cisneros")
      @student = Student.create(student_params)
      if @student.save
         flash[:success] = "Welcome to the Sample App!"
         redirect_to student_path(@student.id)
         # redirect_to teacher_path(@teacher.id)
      else
        redirect_to new_student_path
      end
  end

  def edit
  end

  def show
    find_student
  end


      private
          def set_course
            @course = Course.find(params[:course_id])
          end

          def student_params
            params[:student].permit(:first_name, :last_name)
          end

          def find_student
            @student = Student.find(params[:id])
          end


          def current_student
            # get the student id
          end

end
