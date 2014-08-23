require 'date'
module MilestonesHelper

  def fetch_status(milestone)
    case milestone.status
    when Milestone::OPEN
      return '<span class="label label-default">Open</span>'.html_safe
    when Milestone::STARTED
      return '<span class="label label-secondary">In Progress</span>'.html_safe
    when Milestone::COMPLETED
      return '<span class="label label-secondary">Completed</span>'.html_safe
    end
  end

  def fetch_period(milestone)
    "#{milestone.start_date.strftime('%d %b %Y')} - #{milestone.end_date.strftime('%d %b %Y')}"
  end
end
