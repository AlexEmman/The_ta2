class CoursesController < ApplicationController
  # http://stackoverflow.com/questions/7398928/undefined-method-merge-for-teststring-rails-3-1
  # http://stackoverflow.com/questions/15083958/rails-need-some-explanations-of-collection-select
  
  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    # Course.create(name: "Math")
    @course = Course.create(course_params)
    if @course.save
       flash[:success] = "Course Created!"
       # redirect_to '/courses/'+ @course.id +'/add_student'
       # @students = Student.all
       redirect_to (new_enrollment_path())
       # render 'add_student', locals: {course: @course, students: @students}
       # redirect_to course_students_path(@course.id, course: @course, students: @students)
    else 
      redirect_to new_course_path
      # same as
      
    end
  end

  def edit
    find_course
  end

  def show
    find_course
    @enrolled_students = @course.students
    @enrollments = @course.enrollments
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
    find_course
    @course.update_attributes(course_params)
    redirect_to course_path(@course.id)
  end

  def destroy
    find_course
    @course.destroy
    redirect_to courses_path
  end

  # def add_students
  #   find_course
    
  #   render 'add_student'
  # end


    private
        def course_params
           params.require(:course).permit(:name)
        end

        def find_course
          @course = Course.find(params[:id])
        end

end
