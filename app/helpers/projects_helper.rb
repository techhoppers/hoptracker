module ProjectsHelper

  def get_status(project)
    case project.status
    when "STARTED"
      t(:in_progress, :scope => [:projects, :statuses])
    when "DISABLED"
      t(:disabled, :scope => [:projects, :statuses])
    when "CLOSED"
      t(:closed, :scope => [:projects, :statuses])
    end
  end
end
