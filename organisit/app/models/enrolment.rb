class Enrolment < ActiveRecord::Base
  belongs_to :user
  belongs_to :course

#1
  scope :instructors, -> { where(position: 'instructor') }


end
