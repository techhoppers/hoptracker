class CreateProjectUsers < ActiveRecord::Migration
  def change
    create_table :project_users do |t|
      t.integer :project_id
      t.integer :user_id
      t.integer :project_role_id
      t.boolean :is_admin, :default => false
      t.timestamps
    end
  end
end
