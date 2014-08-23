class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.integer :project_id
      t.integer :milestone_id
      t.string :title, :null => false
      t.text :description
      t.text :acceptence_criteria
      t.string :issue_type
      t.integer :assigned_to
      t.integer :estimate
      t.integer :percentage_completed
      t.integer :created_by
      t.datetime :start_date
      t.datetime :closed_date
      t.string :priority
      t.string :status
      t.string :code, :null => false
      t.timestamps
    end
    add_index :issues, :title
    add_index :issues, :code, :unique => true
  end
end
