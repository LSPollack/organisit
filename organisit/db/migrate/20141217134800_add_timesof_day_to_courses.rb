class AddTimesofDayToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :morning, :boolean, default: false
    add_column :courses, :afternoon, :boolean, default: false
    add_column :courses, :evening, :boolean, default: false
    remove_column :courses, :timeofday, :string
  end
end
