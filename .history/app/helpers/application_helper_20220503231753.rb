module ApplicationHelper
  def full_title(page_title = '')
    BASE_TITLE = "Potepanec"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end
