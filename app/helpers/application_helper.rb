module ApplicationHelper

  def text_with_icon(text, icon)
    unless text.blank?
      return ('<i class="'+ icon + '"></i> ' + text).html_safe
    end
  end

  def show_icon(icon)
      return ('<i class="'+ icon + '"></i>').html_safe
  end
  
  def nav_links_with_icon(text, icon)
    return ("<i class='#{icon}'></i> <span>#{text}</span>").html_safe
  end

  def show_user(user)
    return (link_to "<i class='#{ICON_USER}'></i> #{user.name}".html_safe, user_path(user)) rescue "Anonymous"
  end

  def show_project_link_with_icon(project)
    return (link_to "<i class='#{ICON_LEAF}'></i> #{truncate(project.title, :length => 30)}".html_safe, project_path(project))
  end

  def get_issue_type_icon(issue_type)
    icon = case issue_type
    when "STORY"
      ICON_FILE_TEXT
    when "BUG"
      ICON_BUG
    when "RELEASE"
      ICON_GIFT
    when "EPIC"
      ICON_BRIEFCASE
    end
    return icon
  end

  def show_priority_icon(priority)
    text = case priority
    when "CRITICAL"
      "C"
    when "HIGH"
      "H"
    when "MEDIUM"
      "M"
    when "LOW"
      "L"
    end

    return "<div class='issue-priority-icon pull-right #{priority.downcase}' title='#{priority.humanize}' data-toggle='tooltip'>#{text}</div>".html_safe
  end


  def formatted_time(time)
    time.strftime("%d/%h/%Y %I:%m %p")
  end

  def formatted_date(date)
    date.strftime("%d/%h/%Y")
  end

  def get_small_avatar(user)
    !user.avatar.blank? ? image_tag(user.avatar.url(:small)) : image_tag("/assets/no_photo_small.gif")
  end
  
end
