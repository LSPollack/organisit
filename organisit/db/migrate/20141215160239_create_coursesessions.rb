class CreateCoursesessions < ActiveRecord::Migration
  def change
    create_table :coursesessions do |t|
      t.string :timeofday
      t.integer :course_id

      t.timestamps
    end
  end
end
