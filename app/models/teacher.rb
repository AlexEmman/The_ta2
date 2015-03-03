class Teacher < ActiveRecord::Base
	has_secure_password

	def self.confirm(email_param, password_param)
    	teacher = Teacher.find_by({email: email_param})
    	teacher.authenticate(password_param)
    end

  has_many :enrollments
  has_many :courses, :through => :enrollments
  has_many :students, :through => :enrollments

end
