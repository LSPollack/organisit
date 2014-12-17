class BecauseThursdayIsNotInFactThurdaySorryThor < ActiveRecord::Migration
  def change
    remove_column :courses, :thurday, :string
    add_column :courses, :thursday, :string
  end
end
