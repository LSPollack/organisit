class Coursesession < ActiveRecord::Base
  belongs_to :course
  has_one :classroom
end
