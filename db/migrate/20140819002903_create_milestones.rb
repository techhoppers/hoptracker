class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.integer :project_id
      t.string :name, :null => false
      t.string :status
      t.text :description
      t.date :start_date
      t.date :end_date
      t.timestamps
    end
  end
end
