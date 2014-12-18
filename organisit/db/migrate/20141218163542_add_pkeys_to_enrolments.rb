class AddPkeysToEnrolments < ActiveRecord::Migration
  def change
    add_column :enrolments, :id, :primary_key
  end
end
