class CreateIssueComments < ActiveRecord::Migration
  def change
    create_table :issue_comments do |t|
      t.integer :issue_id
      t.integer :user_id
      t.text  :comment
      t.timestamps
    end
  end
end
