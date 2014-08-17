class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title, :null => false, :default => ""
      t.text   :description
      t.string :code, :null => false, :default => ""
      t.string :user_id, :null => false
      t.string :status
      t.timestamps
    end

    add_index :projects, :title
    add_index :projects, :code, :unique => true
  end
end
