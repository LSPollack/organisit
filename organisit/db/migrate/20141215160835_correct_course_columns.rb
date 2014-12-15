class CorrectCourseColumns < ActiveRecord::Migration
  def change
    remove_column :courses, :string, :string
    add_column :courses, :timeofday ,:string
    remove_column :coursesessions, :timeofday, :string
    add_column :coursesessions, :bookedtimeofday ,:string
  end
end
