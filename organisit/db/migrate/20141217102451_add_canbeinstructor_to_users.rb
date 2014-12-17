class AddCanbeinstructorToUsers < ActiveRecord::Migration
  def change
    add_column :users, :canbeinstructor, :boolean, default: false
  end
end
