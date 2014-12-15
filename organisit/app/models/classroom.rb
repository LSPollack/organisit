class Classroom < ActiveRecord::Base
  has_many :coursesessions
end
