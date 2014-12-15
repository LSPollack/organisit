class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.string :description
      t.string :code
      t.date :startdate
      t.date :enddate
      t.integer :max_no_of_students
      t.string :category
      t.integer :mincoursessions
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thurday
      t.boolean :friday
      t.boolean :saturday
      t.boolean :sunday
      t.string :string






      t.timestamps
    end
  end
end
