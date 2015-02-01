require 'date'
module MilestonesHelper

  def fetch_status(milestone)
    label_class = case milestone.status
    when "OPEN"
       "label-default"
    when "STARTED"
       "label-secondary"
    when "INACTIVE"
       'label-default critical'
    when "COMPLETED"
       'label-primary'
    end

    return "<span class='label #{label_class}'>#{milestone.status.humanize}</span>".html_safe
  end

  def fetch_period(milestone)
    "#{milestone.start_date.strftime('%d %b %Y')} - #{milestone.end_date.strftime('%d %b %Y')}" rescue nil
  end
end
