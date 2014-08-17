module ApplicationHelper

  def text_with_icon(text, icon)
    return ('<i class="'+ icon + '"></i>' + text).html_safe
  end

  def nav_links_with_icon(text, icon)
    return ("<i class='#{icon}'></i> <span>#{text}</span>").html_safe
  end

  def show_user(user)
    return (link_to user.name, user_path(user))
  end

  def show_project_link_with_icon(project)
    return (link_to "<i class='icon-leaf'></i> #{truncate(project.title, :length => 30)}".html_safe, project_path(project))
  end
  
end
