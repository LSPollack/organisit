class CreateEnrolmentJoinTable < ActiveRecord::Migration
  def change
    create_join_table :users, :courses do |t|
      t.index [:user_id, :course_id]
      t.index [:course_id, :user_id]
      t.string :position
    end
  end
end
