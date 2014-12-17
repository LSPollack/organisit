class AddDateColumnToCoursesessions < ActiveRecord::Migration
  def change
    add_column :coursesessions, :date, :date
  end
end
