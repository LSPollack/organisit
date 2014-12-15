class CorrectSpellinginCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :mincoursessions, :integer
    add_column :courses, :mincoursesessions, :integer
  end
end
