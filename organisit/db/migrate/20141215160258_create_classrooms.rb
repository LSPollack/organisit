class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.string :name
      t.string :address
      t.string :city
      t.integer :capacity
      t.integer :coursesession_id

      t.timestamps
    end
  end
end
