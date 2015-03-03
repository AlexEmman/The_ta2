module PointsHelper
  def update_points(student, course, new_points)
    # find the current enrollment for this student and course
    current_enrollment = student.enrollments.find_by(course_id: course.id)
    # get current point total and add the new_points
    new_point_total = current_enrollment.points + new_points
    # save new_point_total to the db w/ update_attributes
    current_enrollment.update_attributes(points: new_point_total)
  end
end
