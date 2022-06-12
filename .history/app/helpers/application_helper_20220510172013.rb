module ApplicationHelper
  BASE_TITLE = "Potepanec".freeze

  def full_title(page_title = nil)
    if page_title.empty?
      BASE_TITLE
    else
      "#{page_title} | #{BASE_TITLE}"
    end
  end
end
