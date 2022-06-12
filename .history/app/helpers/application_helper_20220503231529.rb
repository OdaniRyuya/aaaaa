module ApplicationHelper
  def full_title(page_title = '')
    base_title = "Potepanec"
    if page_title.empty?
      base_title.freeze
    else
      "#{page_title} | #{base_title}"
    end
  end
end
