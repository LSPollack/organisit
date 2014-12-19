class Course < ActiveRecord::Base
  has_many :enrolments

  # because there isn't a student_enrolments model, have to explicitly say to go look to Enrolment for this subset
  has_many :student_enrolments, -> { where(enrolments: {position: "student"}) }, class_name: 'Enrolment'

  has_many :students, :through => :student_enrolments, :source => :user

  has_many :users, through: :enrolments
  has_one :classroom

  #2
  has_many :instructors, -> { where(enrolments: {position: "instructor"}) }, :through => :enrolments, :source => :user
  # this gives you instructor_ids, a collection of ids for those instructors


  scope :with_students, -> { joins(:students).distinct }

  validate :occurs_on_somedays? 
  validates :title, :presence => { message: " - please give the course a title." } 
  validates :category, :presence => { message: " - yes, naming stuff is hard, but suck it up and think of a category." } 
  validates :description, :presence => { message: " - seriously? You don't know what the course is going to be about? Have a think..." } 
  validates :startdate, :presence => { message: " - yeah, this is not happening unless you know when the course will start" }
  validates :enddate, :presence => { message: " - what is this? The never-ending course? Um, no." } 
  validates :max_no_of_students, :presence => { message: " - how many students do you think you can handle?" }
  validates :classroom_id, :presence => { message: " - please select a classroom"}

  # validate :instructor_present

  def self.current_courses
    adate = Date.today
    dayofweek = adate.strftime("%A").downcase
    where("enddate > ? AND startdate <= ?", adate, adate)
  end


  def self.course_today
    adate = Date.today
    dayofweek = adate.strftime("%A").downcase
    self.current_courses.where("#{dayofweek} = ?", true)
  end

  #4 can get the instructor id as instructor is a user (via enrolments) but check if it's nil
  def instructor_id
    instructor.id if instructor
  end

  #5 to change the instructor
  # Since this is a method that we're going to treat like an attribute. Gives the controller a way of setting the instructor_id attribute. As a setter it should return its value, that's sort of the convention.

  def instructor_id=(value)
    # if the course model has already been saved
    if persisted?
      self.instructor_ids = [value]
      # when you save the course THEN save the enrolment, and that works because if you are saving a new course it's NOT persisted
    else
      enrolments.new user_id: value, position: :instructor
    end
    value
  end

  # Because I wanted one instructor (3)
  def instructor
    instructors.first
  end

# Start with an empty string. Then, if Monday is true, then add "Monday" to the string. If also Tuesdays, then 

  def days_course_is_on
    days = String.new
    if (self.enddate - self.startdate) > 14
      days = days + "Mondays " if self.monday
      days = days + "Tuesdays " if self.tuesday
      days = days + "Wednesdays " if self.wednesday
      days = days + "Thursdays " if self.thursday
      days = days + "Fridays " if self.friday
      days = days + "Saturdays " if self.saturday
      days = days + "Sundays " if self.sunday
      days
    else
      days = days + "Monday " if self.monday
      days = days + "Tuesday " if self.tuesday
      days = days + "Wednesday " if self.wednesday
      days = days + "Thursday " if self.thursday
      days = days + "Friday " if self.friday
      days = days + "Saturday " if self.saturday
      days = days + "Sunday " if self.sunday
      days
    end
  end

  def timesofday_for_course
    times = String.new
    if (self.enddate - self.startdate) > 1
      times = times + "Mornings " if self.morning
      times = times + "Afternoons " if self.afternoon
      times = times + "Evenings " if self.evening
      times
    else
      times = times + "Morning " if self.morning
      times = times + "Afternoon " if self.afternoon
      times = times + "Evening " if self.evening
      times
    end
  end

  # def instructor_present
  #     errors.add :instructor, "must be present" unless instructors.any? || enrolments.detect{|e|e.position.to_s=='instructor'}
  # end

  def occurs_on_somedays?
    if ((monday == false || monday.nil?) &&
    (tuesday == false || tuesday.nil?) &&
    (wednesday == false || wednesday.nil?) &&
    (thursday == false || thursday.nil?) &&
    (friday == false || friday.nil?) &&
    (saturday == false || saturday.nil?) &&
    (sunday == false || sunday.nil?))
      errors.add(:base, "A course cannot be saved unless the days of the week that it takes place on are entered. Please go back and select at least one day of the week.")
    end
  end


  accepts_nested_attributes_for :enrolments, allow_destroy: true

end