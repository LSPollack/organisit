class RenameJoinTable < ActiveRecord::Migration
  def change
      rename_table :courses_users, :enrolments 
  end
end
