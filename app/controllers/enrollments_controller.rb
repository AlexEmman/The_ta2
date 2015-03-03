class EnrollmentsController < ApplicationController
  def index
    @enrollments = Enrollment.all
  end

  def new
    @enrollment = Enrollment.new
    @student_options = Student.all.map{|u| [ u.first_name, u.id ] }
    @teacher_options = Teacher.all.map{|u| [ u.first_name, u.id ] }
    @course_options = Course.all.map{|u| [ u.name, u.id ] }
    # @course = params[:course_id]
    # @courses = Student.all
  end

  def create
    @enrollment = Enrollment.create(enrollment_params)
    if @enrollment.save
       flash[:success] = "enrollment Created!"
       # redirect_to '/enrollments/'+ @enrollment.id +'/add_student'
       # @students = Student.all
       redirect_to courses_path()
       # render 'add_student', locals: {enrollment: @enrollment, students: @students}
       # redirect_to enrollment_students_path(@enrollment.id, enrollment: @enrollment, students: @students)
    else 
      redirect_to new_enrollment_path
      # same as
      
    end
  end
  def update_points(student, course, new_points)
    # find the current enrollment for this student and course
    current_enrollment = student.enrollments.find_by(course_id: course.id)
    # get current point total and add the new_points
    new_point_total = current_enrollment.points + new_points
    # save new_point_total to the db w/ update_attributes
    current_enrollment.update_attributes(points: new_point_total)
  end

  def update
    find_enrollment
    @enrollment.update_attributes(enrollment_params)
    redirect_to course_path(@enrollment.id)
  end

 

  def edit
    find_enrollment
  end

  def show
  end

  def find_course
   @course = Course.find(params[:id])
  end

      private
          def enrollment_params
            params.require(:enrollment).permit(:teacher_id, :student_id, :course_id, :points)
          end

          def find_enrollment
            @enrollment = Enrollment.find(params[:id])
          end
          def course_params
           params.require(:course).permit(:name)
          end

          


        
end
