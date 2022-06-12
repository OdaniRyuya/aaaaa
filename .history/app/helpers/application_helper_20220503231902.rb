module ApplicationHelper
  
  BASE_TITLE = "Potepanec"
  def full_title(page_title = '')
    if page_title.empty?
      BASE_TITLE
    else
      "#{page_title} | #{base_title}"
    end
  end
end
