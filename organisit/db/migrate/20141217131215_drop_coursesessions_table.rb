class DropCoursesessionsTable < ActiveRecord::Migration
  def up
     drop_table :coursesessions
   end

   def down
     raise ActiveRecord::IrreversibleMigration
   end
end
