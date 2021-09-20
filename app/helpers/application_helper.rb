module ApplicationHelper
  def flash_class(level)
    case level
        when :notice then "alert alert-info"
        when :success then "alert alert-success"
        when :error then "alert alert-error"
        when :alert then "alert alert-error"
    end
  end

  def nav_link(text, path)
    options = current_page?(path) ? { class: "nav-link active" } : { class: 'nav-link' }
    content_tag(:li, options) do
      link_to text, path
    end
  end
end
