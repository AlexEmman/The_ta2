class Course < ActiveRecord::Base
  has_many :enrollments
  has_many :students, :through => :enrollments
  has_many :teachers, :through => :enrollments
end
