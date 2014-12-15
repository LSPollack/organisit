class Course < ActiveRecord::Base
  has_many :users, through: :enrolments
  has_many :coursesessions

end
