module ApplicationHelper
  def icon_tag icon_class
    content_tag(:i, " ",class: icon_class).html_safe
  end
end
