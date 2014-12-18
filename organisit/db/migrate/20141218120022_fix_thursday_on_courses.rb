class FixThursdayOnCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :thursday, :string
    add_column :courses, :thursday, :boolean
  end
end
