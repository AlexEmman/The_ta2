class Student < ActiveRecord::Base
  has_many :enrollments
  has_many :courses, :through => :enrollments
  has_many :teachers, :through => :enrollments
  has_many :points, :through => :enrollments
end
