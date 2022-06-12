module ApplicationHelper
  def full_title(page_title = '')
    BASE_TITLE = "Potepanec"
    if page_title.empty?
      BASE_TITLE
    else
      "#{page_title} | #{base_title}"
    end
  end
end
