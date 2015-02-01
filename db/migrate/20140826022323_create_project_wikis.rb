class CreateProjectWikis < ActiveRecord::Migration
  def change
    create_table :project_wikis do |t|
      t.integer :user_id
      t.integer :project_id
      t.string :title
      t.integer :modified_user_id
      t.text :body
      t.timestamps
    end
  end
end
