class User < ActiveRecord::Base
  has_many :enrolments
  has_many :courses, through: :enrolments




  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :trackable, :validatable

  def role?(role_to_compare)
    self.role.to_s == role_to_compare.to_s
  end

  # def instructors
  #   Enrolment.where(position: "instructor")
  # end
  
end
