class MoveClassroomIDtoCorrectTableWhoops < ActiveRecord::Migration
  def change
    remove_column :classrooms, :coursesession_id, :integer
    add_column :coursesessions, :classroom_id, :integer
  end
end
