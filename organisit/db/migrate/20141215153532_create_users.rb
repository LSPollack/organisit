class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo
      t.string :role
      t.boolean :active

      t.timestamps
    end
  end
end
