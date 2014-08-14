module ApplicationHelper

  def text_with_icon(text, icon)
    return ('<i class="'+ icon + '"></i> ' + text).html_safe
  end

  def nav_links_with_icon(text, icon)
    return ("<i class='#{icon}'></i> <span>#{text}</span>").html_safe
  end
  
end
